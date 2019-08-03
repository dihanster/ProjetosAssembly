#Calculo do MDC pelo Metodos das Multiplas Divisoes

main:
	li $v0, 5
	syscall

	move $s0, $v0

	li $v0, 5
	syscall

	move $s1, $v0

	jal calculaMDC

	j imprimeResultado 

	retorna: 

	jr $ra 

	j retorna
	
	calculaMDC: #Faz a divisao por sucessivas subtracoes

	beq $s0, $s1, retorna  		#se igual... Entao temos uma div. exata

	bgt $s0, $s1, calculaMaior 	#bgt = maior que 

	blt $s0, $s1, calculaMenor 	#blt menor que

	j calculaMDC 

	calculaMaior: 

	sub $s0, $s0, $s1   

	j calculaMDC 

	calculaMenor: 

	sub $s1, $s1, $s0

	j calculaMDC 

	imprimeResultado: 

	move $a0, $s0
	li $v0,1 
	syscall

	li $v0, 10 
	syscall