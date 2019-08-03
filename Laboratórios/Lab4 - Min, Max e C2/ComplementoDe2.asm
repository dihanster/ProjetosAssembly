.data
prompt: .asciiz "Digite um número inteiro: "
result: .asciiz " O valor binário correspondente com sinal é: " 
.text

main: 
	li $v0, 4		#Imprime o prompt de entrada
     	la $a0, prompt 
     	syscall
     	
  	li $v0, 5		#le o numero
  	syscall
  	move $t0, $v0
  	
  	move $t7, $t0		#backup do numero
	move $t4, $zero		#variaiveis do deslocamento
	move $t5, $zero		
	addi $t5, $t5, 1	

	li $v0, 4		#Imprime o prompt de resultado
     	la $a0, result
     	syscall

contaNbits:
	div $t7, $t7, 2		#Conta o numero de bits que precisa usar para o numero, para dps fazer o deslocamento
	mflo $t6
	addi $t5, $t5, 1
	beq $t6, $zero, preparaConverte
	j contaNbits

preparaConverte:
  	move $t4, $t5
  	subi $t4, $t4, 1

converte: 
	add $t1, $zero, 1
	sllv $t1, $t1, $t4
	add $t2, $zero, $t5

 loopConverteImprime: 
  	and $t3,$t0, $t1
  	beq $t3, $zero, imprime
  	add $t3, $zero, $zero
  	addi $t3, $zero, 1
  	j imprime

imprime: 
  	li $v0, 1		#Impressao
	move $a0, $t3
 	syscall

  	srl $t1, $t1, 1		#Deslocamento

  	subi $t2, $t2, 1	#iterador de controle

  	bne $t2, $zero, loopConverteImprime	
  	beq $t2, $zero, exit
 
 exit: 
  	li $v0, 10
  	syscall
