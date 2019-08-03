.data
	n:	.asciiz "Digite o valor para a qtd de gas: "
	T:	.asciiz "Digite o valor para a temperatura: "
	P:	.asciiz "Digite o valor para a pressao: "
	cteR:	.float 8.3144621
	Espaco:	.asciiz "\n"
	ResultadoVolume: .asciiz "O resultado do volume V eh: "
	zeroFloat: .float 0.0
.text

main:
	lwc1 $f5, zeroFloat
	lwc1 $f7, cteR
	
	li $v0, 4	#Imprimindo prompt para leitura do n
	la $a0, n
	syscall
	
	li $v0, 6	#Leitura do n em float
	syscall
	
	add.s $f1, $f0, $f5 
	
	li $v0, 4	#Imprimindo prompt para leitura do T
	la $a0, T
	syscall
	
	li $v0, 6	#Leitura do T em float
	syscall
	
	add.s $f2, $f0, $f5 
	
	li $v0, 4	#Imprimindo prompt para leitura do P
	la $a0, P
	syscall
	
	li $v0, 6	#Leitura do P em float
	syscall
	
	add.s $f3, $f0, $f5 
	
	#$f1 = n, $f2 = T, $f3 = P, $f7 = cteR, $f6 = V
	
	#Obtendo v = n*R 
	mul.s $f6, $f1, $f7
	
	#Obtendo v = n*R*T 
	mul.s $f6, $f6, $f2
	
	#obtendo v = n*R*T/P
	div.s $f6, $f6, $f3
	
	#Imprimindo prompt para leitura do T
	li $v0, 4  
	la $a0, ResultadoVolume
	syscall
	
	li $v0, 2 	#Imprime o resultad do volume
	mov.s $f12, $f6
	syscall
	
	li $v0, 10 	#Encerra o programa
	syscall
	
