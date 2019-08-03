.globl LogoCappaTruco
LogoCappaTruco:

	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho � 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	
	addi $29, $0, 0xffffff
	
	#letra C
	sw $29, 3748($10)
	sw $29, 684($10)
	sw $29, 2720($10)
	sw $29, 676($10)
	sw $29, 1696($10)
	sw $29, 3232($10)
	sw $29, 3752($10)
	sw $29, 1184($10)
	sw $29, 3756($10)
	sw $29, 680($10)
	sw $29, 2208($10)
	
	#letra A
	sw $29, 2232($10)
	sw $29, 3264($10)
	sw $29, 3252($10)
	sw $29, 2240($10)
	sw $29, 2228($10)
	sw $29, 1216($10)
	sw $29, 1204($10)
	sw $29, 696($10)
	sw $29, 2236($10)
	sw $29, 2752($10)
	sw $29, 2740($10)
	sw $29, 700($10)
	sw $29, 3764($10)
	sw $29, 1728($10)
	sw $29, 3776($10)
	sw $29, 1716($10)
	
	#letra P
	sw $29, 2760($10)
	sw $29, 2252($10)
	sw $29, 3272($10)
	sw $29, 2260($10)
	sw $29, 2248($10)
	sw $29, 1236($10)
	sw $29, 1224($10)
	sw $29, 720($10)
	sw $29, 2256($10)
	sw $29, 712($10)
	sw $29, 3784($10)
	sw $29, 724($10)
	sw $29, 716($10)
	sw $29, 1748($10)
	sw $29, 1736($10)
	
	#letra P
	sw $29, 2276($10)
	sw $29, 2780($10)
	sw $29, 2272($10)
	sw $29, 3292($10)
	sw $29, 2280($10)
	sw $29, 1756($10)
	sw $29, 3804($10)
	sw $29, 740($10)
	sw $29, 2268($10)
	sw $29, 1256($10)
	sw $29, 732($10)
	sw $29, 1244($10)
	sw $29, 744($10)
	sw $29, 736($10)
	sw $29, 1768($10)
	
	
	#letra A
	sw $29, 1264($10)
	sw $29, 1776($10)
	sw $29, 2288($10)
	sw $29, 2800($10)
	sw $29, 3312($10)
	sw $29, 3824($10)
	sw $29, 756($10)
	sw $29, 760($10)
	sw $29, 1276($10)
	sw $29, 1788($10)
	sw $29, 2300($10)
	sw $29, 2812($10)
	sw $29, 3324($10)
	sw $29, 3836($10)
	sw $29, 2292($10)
	sw $29, 2296($10)
	
	#Truco
	sw $29, 1340($10)
	sw $29, 2396($10)
	sw $29, 3360($10)
	sw $29, 3872($10)
	sw $29, 792($10)
	sw $29, 1852($10)
	sw $29, 796($10)
	sw $29, 2344($10)
	sw $29, 1332($10)
	sw $29, 832($10)
	sw $29, 2908($10)
	sw $29, 836($10)
	sw $29, 2824($10)
	sw $29, 1812($10)
	sw $29, 2868($10)
	sw $29, 3912($10)
	sw $29, 2364($10)
	sw $29, 3924($10)
	sw $29, 3848($10)
	sw $29, 2876($10)
	sw $29, 840($10)
	sw $29, 3928($10)
	sw $29, 2312($10)
	sw $29, 1300($10)
	sw $29, 3368($10)
	sw $29, 2356($10)
	sw $29, 3884($10)
	sw $29, 3888($10)
	sw $29, 2836($10)
	sw $29, 1824($10)
	sw $29, 3408($10)
	sw $29, 808($10)
	sw $29, 3860($10)
	sw $29, 3420($10)
	sw $29, 1360($10)
	sw $29, 3380($10)
	sw $29, 2328($10)
	sw $29, 2844($10)
	sw $29, 1832($10)
	sw $29, 772($10)
	sw $29, 3336($10)
	sw $29, 2324($10)
	sw $29, 1312($10)
	sw $29, 1872($10)
	sw $29, 852($10)
	sw $29, 776($10)
	sw $29, 856($10)
	sw $29, 2384($10)
	sw $29, 1372($10)
	sw $29, 780($10)
	sw $29, 1800($10)
	sw $29, 2856($10)
	sw $29, 1844($10)
	sw $29, 3904($10)
	sw $29, 3348($10)
	sw $29, 2896($10)
	sw $29, 1884($10)
	sw $29, 1288($10)
	sw $29, 820($10)
	sw $29, 3908($10)
	sw $29, 2332($10)
	sw $29, 1320($10)
	sw $29, 3388($10)

	
jr $31