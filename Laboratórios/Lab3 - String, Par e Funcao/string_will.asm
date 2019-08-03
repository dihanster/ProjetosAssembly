.data
userInput: .space 20 
.globl main
.text
main:
    	li $v0, 8
    	la $a0, userInput
    	li $a1, 20
    	syscall 
	add $t6, $t6, $zero
    	add $t0, $a0, $0            
    
	tamanhoString: 
       		lbu   $t2, 0($t0)
        	beq   $t2, $zero, Exit  # Se chegou em 0, é fim da String
        	addiu $t0, $t0,   1
        	addi $t6, $t6, 1 	#Contador Tamanho
        	j tamanhoString
    	Exit:

    	add $t1, $t6, $zero     	#inicia com o tamanho da string 
    	move $t7, $t1
    	li  $t2, 0            		#i = 0

    	li $v0, 11
    	
    	reverteString:
        	slt  $t3, $t2, $t1    	# iterador < tamanho
        	beq  $t3, $0,  percorreString 	# fim
        	addi $t0, $t0, -1     	# decrementando
        	addi $t1, $t1, -1     	# decrementando
        	lbu  $a0, 0($t0)      	# carregando pelo final
        	syscall
        	j reverteString
    	
    	percorreString:
    		slt  $t3, $t2, $t1    	# if i < stringlength
        	bne  $t3, $0,  converteMinMasc 	# if t3 reaches he end of the array
		addi $t0, $t0, -1     	# decrement the array 
        	addi $t1, $t1, -1     	# decrement the array 
		lbu  $a0, 0($t0)      	# load the array from the end
    		
    	converteMinMasc:
    		lb $t2, 0($t0)
    		sge $t5, $t0, 97
    		sle $t6, $t2, 122
    		and $t8, $t5, $t6  	#entao é minusculo
    		beq $t8, 1, minusculo
    		sle $t6, $t0, 90
    		and $t8, $t5, $t6	#se 1, é maisculo
    		beq $t8, 1, maisculo	#Não é letra
    		beq $t8, 0, erro
        	#beq $t7, $zero, exit  # Se chegou em 0, é fim da String
        	#addi $t7, $t7, -1 	#Contador Tamanho
        
        maisculo:
        	add $t2, $t2, 32
        	j percorreString
        	
       	minusculo:
       		sub $t2, $t2, 32
        	j percorreString
       	
       	exit:
        li $v0, 10
    	syscall
       	
       	erro:
       		move $v1, $zero
       		addi $v1, $v1, 1
       		break 1
        
       
