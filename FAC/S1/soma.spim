	.data
	.text
	main:

	li $v0, 5	 	# ler o primeiro numero;
	syscall
	
	move $t0, $v0		#limpando $v0 para ler o segundo numero;
	
	li $v0, 5		#ler o segundo numero;
	syscall
	
	move $t1, $v0		#limpando $v0;
	
	add $t2, $t1, $t0	#soma dos dois numeros;
	
	li $v0, 1
	move $a0, $t2
	syscall

exit:      
      	li   $v0, 10          	# system call for exit
      	syscall

