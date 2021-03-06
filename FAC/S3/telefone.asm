	.data

	entrada:     	.space 15  # Aloca uma entrada com 15 espacos;
	result:     	.asciiz "Voc? digitou: "

        .text
	main: 
	
	# Leitura da entrada;
        li  $v0, 8   		
        la  $a0, entrada   	
        la  $a1, 15
        move $t0, $a0 
        syscall
        
        filtro:
        lb  $a0, ($t0)
        beq $a0, 0, termina
        li $t2, 86
        slt $t1, $t2, $a0
        beq $t1, 1, troca9
        li $t2, 83
        slt $t1, $t2, $a0
        beq $t1, 1, troca8
        li $t2, 79
        slt $t1, $t2, $a0
        beq $t1, 1, troca7
        li $t2, 76
        slt $t1, $t2, $a0
        beq $t1, 1, troca6
        li $t2, 73
        slt $t1, $t2, $a0
        beq $t1, 1, troca5
        li $t2, 70
        slt $t1, $t2, $a0
        beq $t1, 1, troca4
        li $t2, 67
        slt $t1, $t2, $a0
        beq $t1, 1, troca3
        li $t2, 64
        slt $t1, $t2, $a0
        beq $t1, 1, troca2
        add $t0,$t0,1
        j   filtro
        
        troca9:
        li $t2, 57 
	sb  $t2, ($t0)
        add $t0, $t0, 1
        j   filtro
        
        troca8:
        li $t2, 56
	sb  $t2, ($t0)
        add $t0, $t0, 1
        j   filtro
        
        troca7:
        li $t2, 55
	sb  $t2, ($t0)
        add $t0, $t0, 1
        j   filtro
        
        troca6:
        li $t2, 54
	sb  $t2, ($t0)
        add $t0, $t0, 1
        j   filtro
        
        troca5:
        li $t2, 53
	sb  $t2, ($t0)
        add $t0, $t0, 1
        j   filtro
        
        troca4:
        li $t2, 52
	sb  $t2, ($t0)
        add $t0, $t0, 1
        j   filtro
        
        troca3:
        li $t2, 51
	sb  $t2, ($t0)
        add $t0, $t0, 1
        j   filtro
        
        troca2:
        li $t2, 50
	sb  $t2, ($t0)
        add $t0, $t0, 1
        j   filtro
        
        termina:
	# Imprimi a entrada transformada;
        la  $a0, entrada  
        li  $v0, 4    
        syscall

	exit:
	# Encerra o programa
        li $v0, 10  
        syscall