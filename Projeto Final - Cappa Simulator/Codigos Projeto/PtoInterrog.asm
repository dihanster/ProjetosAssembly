.globl PtoInterrog
PtoInterrog:
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho � 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	
	addi $29, $0, 0xFFFF00
	
	sw $29, 7044($10)
	sw $29, 15780($10)
	sw $29, 7560($10)
	sw $29, 8132($10)
	sw $29, 15260($10)
	sw $29, 7048($10)
	sw $29, 7564($10)
	sw $29, 7600($10)
	sw $29, 13240($10)
	sw $29, 15264($10)
	sw $29, 7040($10)
	sw $29, 12716($10)
	sw $29, 13244($10)
	sw $29, 15268($10)
	sw $29, 12712($10)
	sw $29, 13248($10)
	sw $29, 7572($10)
	sw $29, 9596($10)
	sw $29, 7056($10)
	sw $29, 7576($10)
	sw $29, 11196($10)
	sw $29, 7052($10)
	sw $29, 12208($10)
	sw $29, 12724($10)
	sw $29, 14748($10)
	sw $29, 12728($10)
	sw $29, 12200($10)
	sw $29, 7568($10)
	sw $29, 7604($10)
	sw $29, 12204($10)
	sw $29, 7608($10)
	sw $29, 12720($10)
	sw $29, 7068($10)
	sw $29, 7584($10)
	sw $29, 7100($10)
	sw $29, 7620($10)
	sw $29, 13220($10)
	sw $29, 6532($10)
	sw $29, 7588($10)
	sw $29, 7104($10)
	sw $29, 9084($10)
	sw $29, 7060($10)
	sw $29, 9088($10)
	sw $29, 16292($10)
	sw $29, 7064($10)
	sw $29, 7580($10)
	sw $29, 13748($10)
	sw $29, 17828($10)
	sw $29, 13224($10)
	sw $29, 17824($10)
	sw $29, 7612($10)
	sw $29, 17308($10)
	sw $29, 11200($10)
	sw $29, 13740($10)
	sw $29, 13228($10)
	sw $29, 17820($10)
	sw $29, 7616($10)
	sw $29, 11204($10)
	sw $29, 11688($10)
	sw $29, 13744($10)
	sw $29, 7076($10)
	sw $29, 6540($10)
	sw $29, 7596($10)
	sw $29, 17312($10)
	sw $29, 13232($10)
	sw $29, 15772($10)
	sw $29, 6544($10)
	sw $29, 11692($10)
	sw $29, 9092($10)
	sw $29, 7072($10)
	sw $29, 9096($10)
	sw $29, 7592($10)
	sw $29, 12704($10)
	sw $29, 12708($10)
	sw $29, 13752($10)
	sw $29, 13236($10)
	sw $29, 15776($10)
	sw $29, 11696($10)
	sw $29, 6536($10)
	sw $29, 13756($10)
	sw $29, 12700($10)
	sw $29, 17316($10)
	sw $29, 7088($10)
	sw $29, 12192($10)
	sw $29, 9664($10)
	sw $29, 8572($10)
	sw $29, 10172($10)
	sw $29, 12196($10)
	sw $29, 6552($10)
	sw $29, 9668($10)
	sw $29, 8576($10)
	sw $29, 9148($10)
	sw $29, 7080($10)
	sw $29, 7084($10)
	sw $29, 9660($10)
	sw $29, 13728($10)
	sw $29, 11704($10)
	sw $29, 11708($10)
	sw $29, 10176($10)
	sw $29, 10692($10)
	sw $29, 6548($10)
	sw $29, 13724($10)
	sw $29, 11700($10)
	sw $29, 8068($10)
	sw $29, 6560($10)
	sw $29, 16284($10)
	sw $29, 8584($10)
	sw $29, 9156($10)
	sw $29, 10180($10)
	sw $29, 6564($10)
	sw $29, 16288($10)
	sw $29, 8060($10)
	sw $29, 7092($10)
	sw $29, 8064($10)
	sw $29, 8580($10)
	sw $29, 7096($10)
	sw $29, 9152($10)
	sw $29, 11712($10)
	sw $29, 13736($10)
	sw $29, 11716($10)
	sw $29, 6556($10)
	sw $29, 13212($10)
	sw $29, 13732($10)
	sw $29, 13216($10)
	sw $29, 6572($10)
	sw $29, 9600($10)
	sw $29, 6576($10)
	sw $29, 8072($10)
	sw $29, 12736($10)
	sw $29, 6568($10)
	sw $29, 14236($10)
	sw $29, 12212($10)
	sw $29, 14752($10)
	sw $29, 12732($10)
	sw $29, 12216($10)
	sw $29, 14756($10)
	sw $29, 8640($10)
	sw $29, 8124($10)
	sw $29, 14240($10)
	sw $29, 7552($10)
	sw $29, 6584($10)
	sw $29, 8644($10)
	sw $29, 8128($10)
	sw $29, 14244($10)
	sw $29, 7556($10)
	sw $29, 12220($10)
	sw $29, 6580($10)
	sw $29, 12740($10)
	sw $29, 10684($10)
	sw $29, 12224($10)
	sw $29, 9604($10)
	sw $29, 8636($10)
	sw $29, 10688($10)
	sw $29, 12228($10)
	sw $29, 9608($10)
	
	jr $31	
