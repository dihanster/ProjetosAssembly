.data
	promptMaximo: .asciiz "Entre com o número maximo: "
	lePalpite: .asciiz "Digite o seu palpite: "
	numDigitado: .asciiz "O numero digitado eh: "
	numEhMenor: .asciiz "\nO numero eh menor do que vc digitou \n"
	numEhMaior: .asciiz "\nO numero eh maior do que vc digitou \n"
	acertouNumero: .asciiz "\nParabens, vc acertou o numero !!!" 
.text

main:
	li $v0, 4			#Prompt para mensagem de printar o limite
	la $a0, promptMaximo
      	syscall
	
	li $v0, 5 			#Lendo o Numero Maximo pelo usuario
	syscall
	move $t1, $v0
		
	move $a1, $t1			#Gerando o num. aleatorio
	li $v0, 42 
	syscall 
	move $t2, $a0
	
laco:
	li $v0, 4
	la $a0, lePalpite
      	syscall
      	
	li $v0, 5 			#Lendo o Numero Maximo pelo usuario
	syscall
	move $t0, $v0
	
	li $v0, 4			#Mostra msg do numero digitado
	la $a0, numDigitado
      	syscall
	
	move $a0, $t0			#Mostra o  numero digitado
	li $v0,1 
	syscall
	
	beq $t0, $t2, acertou		#Se acertou
	
	blt $t0, $t2, ehMaior		#Se o numero digitado eh menor que o aleatório
	
	blt $t2, $t0, ehMenor		#Se o numero digitado eh maior que o aleatório
	
	j laco

acertou:
	li $v0, 4
	la $a0, acertouNumero		#Printa mensagem de acerto
      	syscall
      	
	li $v0, 10			#Encerra o programa
      	syscall
      	
ehMenor:
	li $v0, 4			#Printa msg de que o numero eh menor do que o digitado
	la $a0, numEhMenor
      	syscall
      	j laco
      			
ehMaior:
	li $v0, 4
	la $a0, numEhMaior		#Printa msg de que o numero eh maior do que o digitado
      	syscall
      	j laco

      	    	