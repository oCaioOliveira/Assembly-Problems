	.data
	.text
	
	main:
	li $v0, 5	 	# ler o primeiro numero;
	syscall
	
	move $t0, $v0		#limpando $v0;
	
	sub $t0, $t0, 1		#retirando o monitor;
	
	li $v0, 5		#ler o segundo numero;
	syscall
	
	move $t1, $v0		#limpando $v0;
	
	div $t2, $t1, $t0	#divide a quantidade de pessoas pelo limite;
	
	mfhi $t3
	
	beq $t3, 0, restoZero
	
	addi $t2, $t2, 1
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall
	
	restoZero:
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
	
	

	
	

