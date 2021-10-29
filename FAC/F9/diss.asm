	.data
		zero: .float 0.0
		aux: .float 0.0
		pos: .asciiz "+" # indicacao de numero positivo;
		negat: .asciiz "-" # indicacao de numero negativo;
		quebraDeLinha:  .asciiz "\n"
		hexa: .asciiz "0x" # primeiros numeros de numero em hexa;
		fin: .space 10
	.text
	
	# linhas 1 e 2;
	main:
	li $v0, 6	 		# ler o numero;
	syscall
	
	lwc1 $f1, zero			# atribuir zero em float a uma variavel qualquer;
		
	add.s $f12, $f1, $f0		# colocar o valor que foi lido para a saida;

	li $v0, 2			# imprimir o numero em float;
	syscall
	
	li $v0, 4
	la $a0, quebraDeLinha		# imprimir "\n";
	syscall
	
	s.s $f0, aux			# armazenamento do float;
	
	lw $t0, aux			# carregamento do numero armazenado;

	# verificacao do sinal;
	bgez $t0, positivo		# direcionamento a excessao "positivo";
	bltz $t0, negativo 		# direcionamento a excessao "negativo";
	
	linha3:
	li $v0, 4
	la $a0, quebraDeLinha		# imprimir "\n";
	syscall
	
  	add $t1, $0, 0xFF      		# atribuicao a variavel $t0 = 0xFF;	  
  	sll $t1, $t1, 23		# movimentando o bit da variavel $t1 23 bits a esquerda (bit mantissa);		 	            
  	and $t1, $t1, $t0		# operacao de AND entre a variavel $t0 e $t1 ("copiando" a mantissa de $t0);  	
  	srl $t1, $t1, 23            	# movimentando o bit da variavel $t1 23 bits a direita;	  	
  	add $t2, $0, 127 		# valor a ser somado com o expoente;	 		
  	sub $t1, $t1, $t2		# tirando o 127 e ficando apenas com o expoente;
  	
  	move $a0, $t1
  	
  	li $v0, 1			# imprimir o expoente;
  	syscall
  	
  	li $v0, 4
	la $a0, quebraDeLinha		# imprimir "\n";
	syscall
	
	j linha4
	
	linha4:
	li $v0, 4 
  	la $a0, hexa        
  	syscall
  	
  	add $t1, $0, 0xFFFF      
  	sll $t1, $t1, 7  	         
  	add $t1, $t1, 0x7F        
  	and $t1, $t1, $t0
  	sub $sp, $sp, 24             
  	sw $t1, 0($sp)              
  	sw $s0, 4($sp)
  	sw $s1, 8($sp)
  	sw $s2, 12($sp)
  	sw $s3, 16($sp)
  	sw $s4, 20($sp)
  	addi $s6, $0, 8
  	move $s5, $0
  	move $s2, $t1
  	li $s0, 8                   
  	la $s3, fin
  
  	jal loip
  	jr $ra

  	loip: 
 	rol $s2, $s2, 4                     
  	and $s1, $s2, 0xf 
  	ble $s1, 9, hex       
  	add $s1, $s1, 7                     


  	hex:
  	addi $s5, $s5, 1 
  	add $s1, $s1, 48            
  	sb $s1, ($s3)               
  	add $s3, $s3, 1 
  	bne $s5, $s6, loip 
  	add $s0, $s0, -1
         
  	la $a0, fin
  	li $v0, 4
  	syscall
  
  	j exit
	
	exit:    
      	li   $v0, 10          		# chamando a saida do programa;
      	syscall
	
	positivo:
	li $v0, 4
	la $a0, pos			# imprimir sinal + do numero; 
	syscall
	
	j linha3
	
	negativo:
	li $v0, 4
	la $a0, negat			# imprimir sinal - do numero; 
	syscall
	
	j linha3
	
