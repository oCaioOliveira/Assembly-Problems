	.data

	Erro:			.asciiz "Entrada invalida."
	QuebraLinha:		.asciiz "\n"

        .text
	main:
	# Ler o numero de entrada;
	li $v0, 5	 	
	syscall 
	
	# Armazenar o numero lido;
	move $t0, $v0	
	
	# Numero mais baixo a ser usado no fatoramento;
	add $t1, $zero, 2
	add $t2, $zero, 32767
	
	# Verifica a validade de um numero com base nos requisitos do programa;
	verificaValidade:
	slt $t3, $t0, $t1
	beq $t3, 1, numInvalido
	
	slt $t3, $t2, $t0
	beq $t3, 1, numInvalido
	
	# Caso um numero seja valido;
	numValido:
	div $t4, $t0, $t1
	mfhi $s0
	beq $s0, 0, attNum
	
	# Versao maxima reduzida do numero de entrada;
	beq $t0, 1, exit
	
	add $t1, $t1, 1
	j numValido
	
	# Atualiza numero a ser fatorado;
	attNum:
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, QuebraLinha		# imprimir '\n' ";
	syscall
	
	add $t0, $zero, $t4
	j numValido
	
	# Caso um numero seja invalido;
	numInvalido:
	li $v0, 4
	la $a0, Erro		# imprimir 'Entrada invalida.' ";
	syscall
	
	li $v0, 4
	la $a0, QuebraLinha		# imprimir '\n' ";
	syscall
	
	j exit
	
	# Encerra o programa;
	exit:
        li $v0, 10  
        syscall
	
		
