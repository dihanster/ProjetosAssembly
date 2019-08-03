
main:
	li $v0, 5
	syscall
	move $s0, $v0
	
	move $t1, $s0
	move $t0, $t1
	move $t2, $t0
	
	beq $zero, $t1, fat0
	
	Loop: 
		subi $t1, $t1, 1
		beq $zero, $t1, Exit
		mul $t0, $t1, $t2
		move $t2, $t0
		j Loop

	Exit:
	
		move $a0, $t0
		li $v0,1 
		syscall

		li $v0, 10 
		syscall
	
	fat0:
		addi $t1, $t1, 1
		move $a0, $t1
		li $v0,1 
		syscall

		li $v0, 10 
		syscall
		
	