.data	
    v1: .space 1000
    promptEntrada: .asciiz "Digite o tamanho do array X: "
    promptValores: .asciiz "Digite os valores inteiros para o array: "
    promptResultadoMinimo: .asciiz " O valor mínimo é: "
    promptResultadoMaximo: .asciiz " O valor máximo é: "
.text

main:    
 	la $a0, promptEntrada
    	li $v0, 4
	syscall

    	li $v0, 5		#Lendo o tamanho do vetor
    	syscall
    	move $s0, $v0
    	move $t4, $s0		#iterador tamanho
    	move $t5, $zero 	#iterado i
    	la $a1, v1		#Array	
    	move $t1, $a1
    	add $t2, $a1, $t4
    
    	move $t6, $t4		#iterador 2 tamanho
    	move $t7, $zero 	#iterador i2
    	move $t8, $zero

    	la $a0, promptValores
    	li $v0, 4
    	syscall
    
leNumeros:
    	beq $t4, $t5, terminouLer
    
   	li $v0, 5		#Leitura do elemento i
    	syscall
    	move $t0, $v0
       
    	sw $t0, ($t1)
    
    	addi $t1, $t1, 4
    	addi $t5, $t5, 1
    
   	 j leNumeros

imprimeVetor:
   	 beq $t7, $t6, terminouLer
    	lw $t0, v1($t8)      
    	li $v0, 1
    	move $a0, $t0
    	syscall
    	addi $t8, $t8, 4
    	addi $t7, $t7, 1
    	j imprimeVetor

terminouLer:
    	lw $t3, v1($zero) #t3 = 1o elemento = min 
    	lw $t4, v1($zero) #t4 = max
    	move $t7, $zero
    	move $t8, $zero
    	j achaMinMax

achaMinMax:
    	beq $t7, $t6, imprime
    	lw $t0, v1($t8)
    	blt $t0, $t3, defineMin
    	bgt $t0, $t4, defineMax
    	addi $t8, $t8, 4
    	addi $t7, $t7, 1
    	j achaMinMax

defineMin:
    	move $t3, $t0
    	j achaMinMax

defineMax:
    	move $t4, $t0
    	j achaMinMax    
    
imprime:
    	la $a0, promptResultadoMinimo
    	li $v0, 4
    	syscall

    	move $a0,$t3
    	li $v0,1
    	syscall
	
    	la $a0, promptResultadoMaximo
    	li $v0, 4
    	syscall	

    	move $a0,$t4
    	li $v0,1
    	syscall

exit:
	li $v0, 10
  	syscall