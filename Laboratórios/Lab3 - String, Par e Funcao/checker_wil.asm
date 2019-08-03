.data
	prompt: .asciiz "Entre com o número: "
	result: .asciiz " Resultado 0 é par, 1 é odd: resultado = " 
.text

main:
	li $v0, 4
	la $a0, prompt
      	syscall
	
	li $v0, 5
	syscall

	move $s0, $v0
	
	move $t1, $v0
	move $t2, $zero
	addi $t2, $t2,  2
	
	li $v0, 4
	la $a0, result
      	syscall
	
	Loop:
		div $t3, $t1, $t2  	# Quoeciente -> t3 = t1/2 
		mul $t4, $t3, $t2	# Resto => t4 = t3 * t2 = 2 * quociente
		sub $t4, $t1, $t4	# Resto -> t4 = t1 * t4 = Numero - 2 * quociente
		beq $zero, $t4, Par 	#Se o resultado é 0, é par e imprime 1, se não, imprime 0 
		
		move $t5, $zero
		addi $t5, $t5, 1
		
		move $a0, $t5
		li $v0, 1
		syscall

		li $v0, 10 
		syscall	
		 
	Par:
		move $t2, $zero
		
		move $a0, $t2
		li $v0,1 
		syscall

		li $v0, 10 
		syscall	 