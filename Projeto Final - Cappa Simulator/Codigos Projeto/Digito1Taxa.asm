.globl Digito1Taxa
Digito1Taxa:
	addi $29, $0, 0xffffff
	
	sw $29, 28424($10)
	sw $29, 28936($10)
	sw $29, 29448($10)
	sw $29, 29960($10)
	sw $29, 30472($10)
	sw $29, 30984($10)
	sw $29, 31496($10)
	
	jr $31