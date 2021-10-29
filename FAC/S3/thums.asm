	.data

	THUMS6:		.asciiz "THUMS THUMS THUMS THUMS THUMS THUMS"
	THUMS3:		.asciiz "THUMS THUMS THUMS"
	QuebraLinha:		.asciiz "\n"

        .text
	main:
	# Ler o numero de linhas;
	li $v0, 5	 	
	syscall 
	
	# Armazenar o numero lido;
	move $t0, $v0	
	
	add $t1, $zero, $zero
	
	linhaImpar:
	add $t1, $t1, 1
	
	li $v0, 4
	la $a0, THUMS3		# imprimir "THUMS ";
	syscall
	
	li $v0, 4
	la $a0, QuebraLinha		# imprimir "\n";
	syscall
	
	beq $t0, $t1, exit
	bne $t0, $t1, linhaPar
	
	linhaPar:
	add $t1, $t1, 1
	
	li $v0, 4
	la $a0, THUMS6		# imprimir "THUMS ";
	syscall

	li $v0, 4
	la $a0, QuebraLinha		# imprimir "\n";
	syscall
	
	beq $t0, $t1, exit
	bne $t0, $t1, linhaImpar
	
	exit:
	# Encerra o programa
        li $v0, 10  
        syscall
	
		
