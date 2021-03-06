	.data

	Erro:			.asciiz "Entrada invalida."
	simPrimo:		.asciiz "sim"
	naoPrimo:		.asciiz "nao"
	QuebraLinha:		.asciiz "\n"

        .text
	main:
	# Ler o numero de entrada;
	li $v0, 5	 	
	syscall 
	
	# Armazenar o numero lido;
	move $t0, $v0
	add $t4, $t0, 1	
	
	# Numero mais baixo a ser usado no fatoramento;
	add $t1, $zero, 3
	
	# Numero 1;
	add $t2, $zero, 1
	
	# Verifica se pertence aos naturais;
	slt $t3, $t0, $t2
	beq $t3, 1, numInvalido
	
	# Condicoes iniciais para o programa funcionar;
	beq $t0, 1, nPrimo
	beq $t0, 2, Primo
	beq $t0, 3, Primo
	beq $t0, 5, Primo
	beq $t0, 7, Primo
	beq $t0, 9, nPrimo
	beq $t0, 11, Primo
	
	# Divide o numero pela metade, para verificar apenas metade dos casos;
	div $t2, $t0, 2
	mfhi $s0
	beq $s0, 0, nPrimo

	# Divide o numero em 3 ja que um numero impar para ser composto minimamente eh divisivel por 3;
	div $t2, $t0, 3
	# Deixa o 1/3 como numero impar somando um ou nao caso ja seja impar;
	div $t3, $t2, 2
	mfhi $s0
	beq $s0, 0, soma1
	
	mul $t6, $t1, $t1

	j numValidoImpar
	
	soma1:
	add $t2, $t2, 1
	
	j numValidoImpar
	
	
	# Caso um numero seja invalido;
	numInvalido:
	li $v0, 4
	la $a0, Erro		# imprimir 'Entrada invalida.' ";
	syscall
	
	li $v0, 4
	la $a0, QuebraLinha		# imprimir '\n' ";
	syscall
	
	li $v0, 10  
        syscall
	
	
	# Numero nao primo;
	nPrimo:
	li $v0, 4
	la $a0, naoPrimo		# imprimir 'nao' ";
	syscall
	
	li $v0, 4
	la $a0, QuebraLinha		# imprimir '\n' ";
	syscall
	
	li $v0, 10  
        syscall


	# Caso um numero seja valido;
	numValidoImpar:
	slt $t5, $t0, $t6
	beq $t5, 1, Primo 
	
	div $t3, $t0, $t1
	mfhi $s0
	beq $s0, 0, nPrimo
	
	add $t1, $t1, 2
	
	mul $t6, $t1, $t1
	
	j numValidoImpar
	
	
	# Numero primo;
	Primo:
	li $v0, 4
	la $a0, simPrimo		# imprimir 'sim' ";
	syscall
	
	li $v0, 4
	la $a0, QuebraLinha		# imprimir '\n' ";
	syscall
	
	li $v0, 10  
        syscall
	
		
