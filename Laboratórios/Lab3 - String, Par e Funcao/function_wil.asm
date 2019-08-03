.data
prompt: .asciiz "Entre com o valor de x: "
result: .asciiz " O resultado é: "
.text

main:
	li $v0, 4
	la $a0, prompt
      	syscall
	
	li $v0, 5
	syscall

	move $s0, $v0		#s0 = n
	move $t1, $s0	
	
	li $v0, 4
	la $a0, result
      	syscall
	
	equacao:
		mul $t2, $s0, $s0	# x = n * n 

		move $t5, $zero
		addi $t5, $t5, 5
		mul $t3, $t5, $t2	#t3 = 5x^2  
		
		move $t6, $zero
		addi $t6, $t6, 2
		mul $t4, $s0, $t6	#t4 = 2x
	
		add $t7, $t3, $t4	#t7 = 5x^2 + 2x
		addi $t7, $t7, 3	#t7 = 5x^2 + 2x + 3
		
		move $a0, $t7
		li $v0,1 
		syscall

		li $v0, 10 
		syscall	 
	