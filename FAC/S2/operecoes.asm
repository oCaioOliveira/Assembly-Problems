	.data
	soma: 		.asciiz "ADD: "
	subtracao: 	.asciiz "SUB: "
	and_: 		.asciiz "AND: "
	or_: 		.asciiz "OR: "
	xor_: 		.asciiz "XOR: "
	mask: 		.asciiz "MASK: "
	sll1: 		.asciiz "SLL("
	sll2: 		.asciiz "): "
	srl1: 		.asciiz "SRL("
	srl2: 		.asciiz "): "
	quebraDeLinha:  .asciiz "\n"
	.text
	
	main:
	li $v0, 5	 	# ler o primeiro numero "a";
	syscall
	
	move $t0, $v0		# limpando $v0;
	
	li $v0, 5	 	# ler o segundo numero "b";
	syscall
	
	move $t1, $v0		# limpando $v0;
	
	li $v0, 5		# ler o terceiro numero "c";
	syscall
	
	move $t2, $v0		# limpando $v0; 
	
	add $t3, $t0, $t1	# somando "a" com "b";
	
	sub $t4, $t0, $t1	# subtraindo "a" com "b";
	
	li $v0, 4
	la $a0, soma		# imprimir "ADD: ";
	syscall
	
	li $v0, 1
	move $a0, $t3		# imprimir a soma de "a" com "b";
	syscall
	
	li $v0, 4
	la $a0, quebraDeLinha	# imprimir "\n";
	syscall
	
	li $v0, 4
	la $a0, subtracao	# imprimir "SUB: ";
	syscall
	
	li $v0, 1
	move $a0, $t4		# imprimir a subtracao de "a" com "b";
	syscall
	
	li $v0, 4
	la $a0, quebraDeLinha	# imprimir "\n";
	syscall
	
	and $t5, $t0, $t1 	# operacao AND entre "a" e "b";
	
	or $t6, $t0, $t1 	# operacao OR entre "a" e "b";
	
	xor $t7, $t0, $t1 	# operacao XOR entre "a" e "b";
	
	li $v0, 4
	la $a0, and_		# imprimir "AND: ";
	syscall
	
	li $v0, 1
	move $a0, $t5		# imprimir a operacao AND de "a" com "b";
	syscall
	
	li $v0, 4
	la $a0, quebraDeLinha	# imprimir "\n";
	syscall
	
	li $v0, 4
	la $a0, or_		# imprimir "OR: ";
	syscall
	
	li $v0, 1
	move $a0, $t6		# imprimir a operacao OR de "a" com "b";
	syscall
	
	li $v0, 4
	la $a0, quebraDeLinha	# imprimir "\n";
	syscall
	
	li $v0, 4
	la $a0, xor_		# imprimir "XOR: ";
	syscall
	
	li $v0, 1
	move $a0, $t7		# imprimir a operacao XOR de "a" com "b";
	syscall
	
	li $v0, 4
	la $a0, quebraDeLinha	# imprimir "\n";
	syscall
	
	and $t8, $t2, 31	# operacao AND entre "c" e 31, resultando "m";
	
	li $v0, 4
	la $a0, mask		# imprimir "MASK: ";
	syscall
	
	li $v0, 1
	move $a0, $t8		# imprimir a operacao AND de "c" com 31;
	syscall
	
	li $v0, 4
	la $a0, quebraDeLinha	# imprimir "\n";
	syscall
	
	sllv  $t9, $t0, $t8	# operacao SLL entre "a" e "m";
	
	srlv $t4, $t1, $t8	# operacao SRL entre "b" e "m";
	
	li $v0, 4
	la $a0, sll1		# imprimir "SLL(";
	syscall
	
	li $v0, 1
	move $a0, $t8		# imprimir o "m";
	syscall
	
	li $v0, 4
	la $a0, sll2		# imprimir "): ";
	syscall
	
	li $v0, 1
	move $a0, $t9		# imprimir a operacao SLL entre "a" e "m";
	syscall
	
	li $v0, 4
	la $a0, quebraDeLinha	# imprimir "\n";
	syscall
	
	li $v0, 4
	la $a0, srl1		# imprimir "SRL(";
	syscall
	
	li $v0, 1
	move $a0, $t8		# imprimir o "m";
	syscall
	
	li $v0, 4
	la $a0, srl2		# imprimir "): ";
	syscall
	
	li $v0, 1
	move $a0, $t4		# imprimir a operacao SRL entre "b" e "m";
	syscall
	
	li $v0, 4
	la $a0, quebraDeLinha	# imprimir "\n";
	syscall
	
	li $v0, 10		# exit;
	syscall
	
	
	
	
	
	
	

	
	

