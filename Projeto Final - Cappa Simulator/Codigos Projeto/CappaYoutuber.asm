.globl CappaYoutuber

CappaYoutuber:
	#addi $7, $0, 0x663300 		#MARROM
	#addi $16, $0, 0x006600 		#VERDE ESCURO
	#addi $29, $0, 0xFF0000		#VERMELHO SANGUE
	#addi $29, $0, 0x333333		#CINZA ESCURO CABELO CAPPA
	#addi $29, $0, 0x999999		#CINZA CLARO CABELO CAPPA
	#addi $21, $0, 0x000080		#AZUL ESCURO
	#addi $23, $0, 0xFFFF00		#AMARELO MINION
	#addi $26, $0, 0x4682B4		#AZUL CLARO
	#addi $27, $0, 0xFF7256		#ROSINHA BOCHECHAS
	#addi $29, $0, 0x000000		#PRETO
	#addi $29, $0, 0xFFA07A		#COR DO CAPPA
	#addi $29, $0, 0xFFFFFF		#BRANCO
 	
 	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho � 4x4
	add $10, $0, $9		#Salvando o "backup"7
	lui $10, 0x1001	
####################################################################################################################################	
	#Cinza Claro Cabelo
	addi $29, $0, 0x999999
	sw $29, 11060($10)
	sw $29, 9984($10)
	sw $29, 11020($10)
	sw $29, 11064($10)
	sw $29, 12076($10)
	sw $29, 11548($10)
	sw $29, 11508($10)
	sw $29, 11980($10)
	sw $29, 11024($10)
	sw $29, 12036($10)
	sw $29, 11468($10)
	sw $29, 13052($10)
	sw $29, 13096($10)
	sw $29, 12040($10)
	sw $29, 13056($10)
	sw $29, 11472($10)
	sw $29, 12000($10)
	sw $29, 12088($10)
	sw $29, 13092($10)
	sw $29, 12080($10)
	sw $29, 12528($10)
	sw $29, 12564($10)
	sw $29, 9944($10)
	sw $29, 9988($10)
	sw $29, 10024($10)
	sw $29, 10980($10)
	sw $29, 11552($10)
	sw $29, 12524($10)
	sw $29, 12568($10)
	sw $29, 9948($10)
	sw $29, 10028($10)
	sw $29, 10984($10)
	sw $29, 11512($10)
	sw $29, 11996($10)
	sw $29, 9964($10)
	sw $29, 15564($10)
	sw $29, 11040($10)
	sw $29, 11528($10)
	sw $29, 11000($10)
	sw $29, 11044($10)
	sw $29, 12056($10)
	sw $29, 11004($10)
	sw $29, 11488($10)
	sw $29, 12016($10)
	sw $29, 11568($10)
	sw $29, 12060($10)
	sw $29, 13072($10)
	sw $29, 11492($10)
	sw $29, 12020($10)
	sw $29, 13032($10)
	sw $29, 13076($10)
	sw $29, 10008($10)
	sw $29, 10964($10)
	sw $29, 12504($10)
	sw $29, 12548($10)
	sw $29, 12508($10)
	sw $29, 9968($10)
	sw $29, 11572($10)
	sw $29, 12584($10)
	sw $29, 13036($10)
	sw $29, 10004($10)
	sw $29, 10960($10)
	sw $29, 11532($10)
	sw $29, 11576($10)
	sw $29, 12544($10)
	sw $29, 12588($10)
####################################################################################################################################	
	#Cinza escuro
	addi $29, $0, 0x333333
	sw $29, 13040($10)
	sw $29, 13084($10)
	sw $29, 9980($10)
	sw $29, 12072($10)
	sw $29, 13044($10)
	sw $29, 13088($10)
	sw $29, 9940($10)
	sw $29, 12032($10)
	sw $29, 13080($10)
	sw $29, 10976($10)
	sw $29, 11504($10)
	sw $29, 11988($10)
	sw $29, 12516($10)
	sw $29, 11540($10)
	sw $29, 13004($10)
	sw $29, 13048($10)
	sw $29, 10012($10)
	sw $29, 12552($10)
	sw $29, 14136($10)
	sw $29, 10972($10)
	sw $29, 11500($10)
	sw $29, 11544($10)
	sw $29, 11984($10)
	sw $29, 10016($10)
	sw $29, 11028($10)
	sw $29, 12512($10)
	sw $29, 12556($10)
	sw $29, 12084($10)
	sw $29, 9992($10)
	sw $29, 12560($10)
	sw $29, 14540($10)
	sw $29, 10020($10)
	sw $29, 11032($10)
	sw $29, 12044($10)
	sw $29, 9952($10)
	sw $29, 9996($10)
	sw $29, 10988($10)
	sw $29, 11516($10)
	sw $29, 12520($10)
	sw $29, 11036($10)
	sw $29, 11476($10)
	sw $29, 12004($10)
	sw $29, 12048($10)
	sw $29, 11992($10)
	sw $29, 12008($10)
	sw $29, 11556($10)
	sw $29, 12600($10)
	sw $29, 9960($10)
	sw $29, 13060($10)
	sw $29, 11480($10)
	sw $29, 12052($10)
	sw $29, 12572($10)
	sw $29, 11560($10)
	sw $29, 12492($10)
	sw $29, 13020($10)
	sw $29, 13064($10)
	sw $29, 15160($10)
	sw $29, 11008($10)
	sw $29, 10956($10)
	sw $29, 10032($10)
	sw $29, 11484($10)
	sw $29, 12012($10)
	sw $29, 12532($10)
	sw $29, 12576($10)
	sw $29, 10992($10)
	sw $29, 11520($10)
	sw $29, 11564($10)
	sw $29, 13024($10)
	sw $29, 13068($10)
	sw $29, 9956($10)
	sw $29, 11048($10)
	sw $29, 12536($10)
	sw $29, 10996($10)
	sw $29, 11524($10)
	sw $29, 13028($10)
	sw $29, 9972($10)
	sw $29, 15052($10)
	sw $29, 11052($10)
	sw $29, 12064($10)
	sw $29, 9976($10)
	sw $29, 12580($10)
	sw $29, 11536($10)
	sw $29, 10968($10)
	sw $29, 10000($10)
	sw $29, 11012($10)
	sw $29, 11056($10)
	sw $29, 11496($10)
	sw $29, 12024($10)
	sw $29, 12068($10)
	sw $29, 12540($10)
	sw $29, 13112($10)
	sw $29, 11016($10)
	sw $29, 12028($10)
	sw $29, 14580($10)
	sw $29, 14584($10)
	sw $29, 14552($10)
	sw $29, 14560($10)
	sw $29, 14572($10)
	sw $29, 14608($10)
	sw $29, 14616($10)
	sw $29, 14628($10)
	sw $29, 14632($10)
	sw $29, 14556($10)
	sw $29, 14564($10)
	sw $29, 14576($10)
	sw $29, 14620($10)
	sw $29, 14636($10)
	sw $29, 14604($10)
	sw $29, 14568($10)
	sw $29, 14612($10)
	sw $29, 14624($10)

####################################################################################################################################	
	#Cinza
	addi $29, $0, 0x696969
	sw $29, 18696($10)
	sw $29, 19224($10)
	sw $29, 16592($10)
	sw $29, 16152($10)
	sw $29, 19188($10)
	sw $29, 19220($10)
	sw $29, 16112($10)
	sw $29, 16156($10)
	sw $29, 19184($10)
	sw $29, 18172($10)
	sw $29, 17160($10)
	sw $29, 19180($10)
	sw $29, 16116($10)
	sw $29, 17204($10)
	sw $29, 19228($10)
	sw $29, 16636($10)
	sw $29, 16088($10)
	sw $29, 18740($10)
	sw $29, 19236($10)
	sw $29, 16120($10)
	sw $29, 16164($10)
	sw $29, 19232($10)
	sw $29, 16124($10)
	sw $29, 16168($10)
	sw $29, 12088($10)
	sw $29, 15672($10)
	sw $29, 16640($10)
	sw $29, 19156($10)
	sw $29, 16080($10)
	sw $29, 18184($10)
	sw $29, 19152($10)
	sw $29, 19196($10)
	sw $29, 16084($10)
	sw $29, 16160($10)
	sw $29, 19192($10)
	sw $29, 14028($10)
	sw $29, 17616($10)
	sw $29, 16644($10)
	sw $29, 18228($10)
	sw $29, 16648($10)
	sw $29, 16176($10)
	sw $29, 16692($10)
	sw $29, 16096($10)
	sw $29, 17104($10)
	sw $29, 17148($10)
	sw $29, 19248($10)
	sw $29, 16136($10)
	sw $29, 19168($10)
	sw $29, 17660($10)
	sw $29, 19244($10)
	sw $29, 19164($10)
	sw $29, 19240($10)
	sw $29, 16172($10)
	sw $29, 19160($10)
	sw $29, 16092($10)
	sw $29, 19208($10)
	sw $29, 17156($10)
	sw $29, 19216($10)
	sw $29, 16140($10)
	sw $29, 17152($10)
	sw $29, 19176($10)
	sw $29, 19212($10)
	sw $29, 16100($10)
	sw $29, 18640($10)
	sw $29, 18684($10)
	sw $29, 17672($10)
	sw $29, 16144($10)
	sw $29, 19172($10)
	sw $29, 19252($10)
	sw $29, 16180($10)
	sw $29, 13516($10)
	sw $29, 17716($10)
	sw $29, 16104($10)
	sw $29, 16148($10)
	sw $29, 18128($10)
	sw $29, 16108($10)
	sw $29, 14136($10)
	sw $29, 13624($10)
	sw $29, 14648($10)

####################################################################################################################################	
	#Cor de Cappa
	addi $29, $0, 0xffa07a
	sw $29, 22756($10)
	sw $29, 18136($10)
	sw $29, 17168($10)
	sw $29, 20212($10)
	sw $29, 20696($10)
	sw $29, 24816($10)
	sw $29, 21300($10)
	sw $29, 23848($10)
	sw $29, 18132($10)
	sw $29, 17164($10)
	sw $29, 20692($10)
	sw $29, 23840($10)
	sw $29, 22752($10)
	sw $29, 20216($10)
	sw $29, 24812($10)
	sw $29, 23844($10)
	sw $29, 23856($10)
	sw $29, 20224($10)
	sw $29, 24824($10)
	sw $29, 21796($10)
	sw $29, 20220($10)
	sw $29, 24828($10)
	sw $29, 21792($10)
	sw $29, 22760($10)
	sw $29, 17172($10)
	sw $29, 23852($10)
	sw $29, 20228($10)
	sw $29, 24820($10)
	sw $29, 23824($10)
	sw $29, 22736($10)
	sw $29, 15084($10)
	sw $29, 19204($10)
	sw $29, 19688($10)
	sw $29, 23828($10)
	sw $29, 15088($10)
	sw $29, 17144($10)
	sw $29, 19200($10)
	sw $29, 19684($10)
	sw $29, 17140($10)
	sw $29, 19680($10)
	sw $29, 23820($10)
	sw $29, 15080($10)
	sw $29, 15096($10)
	sw $29, 23836($10)
	sw $29, 20200($10)
	sw $29, 22748($10)
	sw $29, 24804($10)
	sw $29, 19696($10)
	sw $29, 24808($10)
	sw $29, 19692($10)
	sw $29, 20208($10)
	sw $29, 22740($10)
	sw $29, 15092($10)
	sw $29, 23832($10)
	sw $29, 20204($10)
	sw $29, 20688($10)
	sw $29, 22744($10)
	sw $29, 24800($10)
	sw $29, 14096($10)
	sw $29, 15064($10)
	sw $29, 19664($10)
	sw $29, 20772($10)
	sw $29, 22836($10)
	sw $29, 23804($10)
	sw $29, 18692($10)
	sw $29, 15068($10)
	sw $29, 23808($10)
	sw $29, 14092($10)
	sw $29, 15060($10)
	sw $29, 20776($10)
	sw $29, 22832($10)
	sw $29, 23800($10)
	sw $29, 19668($10)
	sw $29, 15076($10)
	sw $29, 19676($10)
	sw $29, 23812($10)
	sw $29, 18224($10)
	sw $29, 17136($10)
	sw $29, 20784($10)
	sw $29, 19672($10)
	sw $29, 23816($10)
	sw $29, 18220($10)
	sw $29, 20780($10)
	sw $29, 15072($10)
	sw $29, 20788($10)
	sw $29, 16132($10)
	sw $29, 19764($10)
	sw $29, 20752($10)
	sw $29, 21720($10)
	sw $29, 22812($10)
	sw $29, 14072($10)
	sw $29, 18676($10)
	sw $29, 19760($10)
	sw $29, 22816($10)
	sw $29, 14076($10)
	sw $29, 18672($10)
	sw $29, 21728($10)
	sw $29, 20756($10)
	sw $29, 21724($10)
	sw $29, 17108($10)
	sw $29, 17112($10)
	sw $29, 20764($10)
	sw $29, 21732($10)
	sw $29, 22824($10)
	sw $29, 14084($10)
	sw $29, 18688($10)
	sw $29, 20760($10)
	sw $29, 15056($10)
	sw $29, 22828($10)
	sw $29, 14088($10)
	sw $29, 18680($10)
	sw $29, 20768($10)
	sw $29, 22820($10)
	sw $29, 14080($10)
	sw $29, 23328($10)
	sw $29, 21268($10)
	sw $29, 20176($10)
	sw $29, 21264($10)
	sw $29, 23320($10)
	sw $29, 23324($10)
	sw $29, 13528($10)
	sw $29, 21260($10)
	sw $29, 13520($10)
	sw $29, 13524($10)
	sw $29, 24308($10)
	sw $29, 20188($10)
	sw $29, 21276($10)
	sw $29, 23332($10)
	sw $29, 24300($10)
	sw $29, 23336($10)
	sw $29, 24304($10)
	sw $29, 13532($10)
	sw $29, 20184($10)
	sw $29, 21272($10)
	sw $29, 13536($10)
	sw $29, 20180($10)
	sw $29, 21248($10)
	sw $29, 23308($10)
	sw $29, 20276($10)
	sw $29, 21244($10)
	sw $29, 24872($10)
	sw $29, 23300($10)
	sw $29, 23784($10)
	sw $29, 18196($10)
	sw $29, 24876($10)
	sw $29, 23304($10)
	sw $29, 23788($10)
	sw $29, 18192($10)
	sw $29, 23780($10)
	sw $29, 13620($10)
	sw $29, 20272($10)
	sw $29, 21240($10)
	sw $29, 21256($10)
	sw $29, 21252($10)
	sw $29, 23312($10)
	sw $29, 23796($10)
	sw $29, 23316($10)
	sw $29, 23792($10)
	sw $29, 14600($10)
	sw $29, 22316($10)
	sw $29, 23768($10)
	sw $29, 20256($10)
	sw $29, 21224($10)
	sw $29, 18176($10)
	sw $29, 20252($10)
	sw $29, 21220($10)
	sw $29, 23760($10)
	sw $29, 24852($10)
	sw $29, 22312($10)
	sw $29, 23764($10)
	sw $29, 21228($10)
	sw $29, 24856($10)
	sw $29, 13604($10)
	sw $29, 13608($10)
	sw $29, 13600($10)
	sw $29, 20268($10)
	sw $29, 21236($10)
	sw $29, 24868($10)
	sw $29, 20264($10)
	sw $29, 21232($10)
	sw $29, 18188($10)
	sw $29, 22320($10)
	sw $29, 23772($10)
	sw $29, 24860($10)
	sw $29, 22324($10)
	sw $29, 23776($10)
	sw $29, 24864($10)
	sw $29, 18180($10)
	sw $29, 13616($10)
	sw $29, 20260($10)
	sw $29, 13612($10)
	sw $29, 20236($10)
	sw $29, 21204($10)
	sw $29, 24836($10)
	sw $29, 20232($10)
	sw $29, 21200($10)
	sw $29, 23860($10)
	sw $29, 21208($10)
	sw $29, 24832($10)
	sw $29, 18168($10)
	sw $29, 20244($10)
	sw $29, 21212($10)
	sw $29, 22308($10)
	sw $29, 24848($10)
	sw $29, 18164($10)
	sw $29, 17196($10)
	sw $29, 20240($10)
	sw $29, 18160($10)
	sw $29, 24840($10)
	sw $29, 20248($10)
	sw $29, 21216($10)
	sw $29, 22304($10)
	sw $29, 24844($10)
	sw $29, 12500($10)
	sw $29, 15660($10)
	sw $29, 23288($10)
	sw $29, 23280($10)
	sw $29, 23284($10)
	sw $29, 15664($10)
	sw $29, 16632($10)
	sw $29, 13008($10)
	sw $29, 15668($10)
	sw $29, 14100($10)
	sw $29, 13012($10)
	sw $29, 23292($10)
	sw $29, 18708($10)
	sw $29, 23296($10)
	sw $29, 14104($10)
	sw $29, 14588($10)
	sw $29, 18704($10)
	sw $29, 13016($10)
	sw $29, 14108($10)
	sw $29, 18700($10)
	sw $29, 13580($10)
	sw $29, 13100($10)
	sw $29, 13584($10)
	sw $29, 15640($10)
	sw $29, 23268($10)
	sw $29, 24356($10)
	sw $29, 23260($10)
	sw $29, 17708($10)
	sw $29, 23264($10)
	sw $29, 24352($10)
	sw $29, 13104($10)
	sw $29, 13588($10)
	sw $29, 15644($10)
	sw $29, 12496($10)
	sw $29, 13108($10)
	sw $29, 15648($10)
	sw $29, 15652($10)
	sw $29, 13592($10)
	sw $29, 23276($10)
	sw $29, 24368($10)
	sw $29, 24360($10)
	sw $29, 23272($10)
	sw $29, 24364($10)
	sw $29, 15656($10)
	sw $29, 16624($10)
	sw $29, 13596($10)
	sw $29, 16628($10)
	sw $29, 17712($10)
	sw $29, 12592($10)
	sw $29, 13560($10)
	sw $29, 24332($10)
	sw $29, 23248($10)
	sw $29, 24336($10)
	sw $29, 15628($10)
	sw $29, 12596($10)
	sw $29, 13564($10)
	sw $29, 15620($10)
	sw $29, 13568($10)
	sw $29, 15624($10)
	sw $29, 13572($10)
	sw $29, 24344($10)
	sw $29, 23256($10)
	sw $29, 24348($10)
	sw $29, 24340($10)
	sw $29, 23252($10)
	sw $29, 13576($10)
	sw $29, 14544($10)
	sw $29, 15632($10)
	sw $29, 16600($10)
	sw $29, 14548($10)
	sw $29, 15636($10)
	sw $29, 21288($10)
	sw $29, 13540($10)
	sw $29, 20196($10)
	sw $29, 23344($10)
	sw $29, 24312($10)
	sw $29, 24796($10)
	sw $29, 23348($10)
	sw $29, 24316($10)
	sw $29, 15608($10)
	sw $29, 23340($10)
	sw $29, 24792($10)
	sw $29, 21284($10)
	sw $29, 13544($10)
	sw $29, 15600($10)
	sw $29, 20192($10)
	sw $29, 21280($10)
	sw $29, 13548($10)
	sw $29, 15604($10)
	sw $29, 14640($10)
	sw $29, 21296($10)
	sw $29, 24324($10)
	sw $29, 24328($10)
	sw $29, 24320($10)
	sw $29, 15612($10)
	sw $29, 14644($10)
	sw $29, 13552($10)
	sw $29, 21292($10)
	sw $29, 15616($10)
	sw $29, 13556($10)
	sw $29, 14052($10)
	sw $29, 17684($10)
	sw $29, 17200($10)
	sw $29, 15140($10)
	sw $29, 19744($10)
	sw $29, 14056($10)
	sw $29, 17680($10)
	sw $29, 15144($10)
	sw $29, 16596($10)
	sw $29, 19740($10)
	sw $29, 20736($10)
	sw $29, 20732($10)
	sw $29, 15148($10)
	sw $29, 19748($10)
	sw $29, 14064($10)
	sw $29, 15152($10)
	sw $29, 19752($10)
	sw $29, 20740($10)
	sw $29, 14068($10)
	sw $29, 15156($10)
	sw $29, 20748($10)
	sw $29, 21716($10)
	sw $29, 14060($10)
	sw $29, 20744($10)
	sw $29, 21712($10)
	sw $29, 16128($10)
	sw $29, 19756($10)
	sw $29, 15120($10)
	sw $29, 19720($10)
	sw $29, 17664($10)
	sw $29, 15124($10)
	sw $29, 14032($10)
	sw $29, 20716($10)
	sw $29, 21804($10)
	sw $29, 20712($10)
	sw $29, 21800($10)
	sw $29, 20708($10)
	sw $29, 15128($10)
	sw $29, 19728($10)
	sw $29, 14036($10)
	sw $29, 19724($10)
	sw $29, 17668($10)
	sw $29, 20720($10)
	sw $29, 14040($10)
	sw $29, 18644($10)
	sw $29, 17676($10)
	sw $29, 19732($10)
	sw $29, 14044($10)
	sw $29, 15132($10)
	sw $29, 20728($10)
	sw $29, 20724($10)
	sw $29, 21812($10)
	sw $29, 21808($10)
	sw $29, 14048($10)
	sw $29, 15136($10)
	sw $29, 18648($10)
	sw $29, 19736($10)
	sw $29, 15580($10)
	sw $29, 19700($10)
	sw $29, 18732($10)
	sw $29, 15100($10)
	sw $29, 15584($10)
	sw $29, 14132($10)
	sw $29, 24292($10)
	sw $29, 24296($10)
	sw $29, 17648($10)
	sw $29, 15104($10)
	sw $29, 15588($10)
	sw $29, 19708($10)
	sw $29, 15108($10)
	sw $29, 19704($10)
	sw $29, 18736($10)
	sw $29, 15592($10)
	sw $29, 17652($10)
	sw $29, 15112($10)
	sw $29, 15596($10)
	sw $29, 16684($10)
	sw $29, 20704($10)
	sw $29, 20700($10)
	sw $29, 15116($10)
	sw $29, 19716($10)
	sw $29, 16688($10)
	sw $29, 17656($10)
	sw $29, 19712($10)
	sw $29, 14592($10)
	sw $29, 17620($10)
	sw $29, 14112($10)
	sw $29, 14596($10)
	sw $29, 16652($10)
	sw $29, 24276($10)
	sw $29, 15568($10)
	sw $29, 14116($10)
	sw $29, 16656($10)
	sw $29, 17624($10)
	sw $29, 16660($10)
	sw $29, 14120($10)
	sw $29, 15572($10)
	sw $29, 24288($10)
	sw $29, 24280($10)
	sw $29, 24284($10)
	sw $29, 14124($10)
	sw $29, 15576($10)
	sw $29, 14128($10)
####################################################################################################################################	
	#Preto
	addi $29, $0, 0x000000
	sw $29, 18652($10)
	sw $29, 13000($10)
	sw $29, 11580($10)
	sw $29, 10492($10)
	sw $29, 22232($10)
	sw $29, 22236($10)
	sw $29, 10536($10)
	sw $29, 20172($10)
	sw $29, 11464($10)
	sw $29, 10496($10)
	sw $29, 11068($10)
	sw $29, 18656($10)
	sw $29, 17688($10)
	sw $29, 10532($10)
	sw $29, 18664($10)
	sw $29, 17696($10)
	sw $29, 22768($10)
	sw $29, 18148($10)
	sw $29, 18660($10)
	sw $29, 17692($10)
	sw $29, 18144($10)
	sw $29, 17176($10)
	sw $29, 18140($10)
	sw $29, 22244($10)
	sw $29, 22764($10)
	sw $29, 22248($10)
	sw $29, 10548($10)
	sw $29, 12604($10)
	sw $29, 22240($10)
	sw $29, 21708($10)
	sw $29, 15676($10)
	sw $29, 10540($10)
	sw $29, 18668($10)
	sw $29, 10544($10)
	sw $29, 12092($10)
	sw $29, 13628($10)
	sw $29, 10516($10)
	sw $29, 16612($10)
	sw $29, 17704($10)
	sw $29, 10472($10)
	sw $29, 16616($10)
	sw $29, 17700($10)
	sw $29, 10476($10)
	sw $29, 10512($10)
	sw $29, 22228($10)
	sw $29, 20684($10)
	sw $29, 16620($10)
	sw $29, 10480($10)
	sw $29, 22220($10)
	sw $29, 22224($10)
	sw $29, 11976($10)
	sw $29, 10524($10)
	sw $29, 10528($10)
	sw $29, 10484($10)
	sw $29, 10488($10)
	sw $29, 10520($10)
	sw $29, 13512($10)
	sw $29, 13116($10)
	sw $29, 17640($10)
	sw $29, 18212($10)
	sw $29, 17124($10)
	sw $29, 21740($10)
	sw $29, 17120($10)
	sw $29, 19660($10)
	sw $29, 16672($10)
	sw $29, 21744($10)
	sw $29, 14652($10)
	sw $29, 16676($10)
	sw $29, 10452($10)
	sw $29, 17644($10)
	sw $29, 18216($10)
	sw $29, 17128($10)
	sw $29, 14536($10)
	sw $29, 10456($10)
	sw $29, 14140($10)
	sw $29, 16680($10)
	sw $29, 14024($10)
	sw $29, 17132($10)
	sw $29, 10460($10)
	sw $29, 16608($10)
	sw $29, 10504($10)
	sw $29, 10508($10)
	sw $29, 21196($10)
	sw $29, 12488($10)
	sw $29, 10464($10)
	sw $29, 16604($10)
	sw $29, 10468($10)
	sw $29, 10500($10)
	sw $29, 15560($10)
	sw $29, 15164($10)
	sw $29, 18156($10)
	sw $29, 17188($10)
	sw $29, 18152($10)
	sw $29, 17184($10)
	sw $29, 22256($10)
	sw $29, 17180($10)
	sw $29, 22252($10)
	sw $29, 18716($10)
	sw $29, 17628($10)
	sw $29, 10552($10)
	sw $29, 15048($10)
	sw $29, 18712($10)
	sw $29, 10952($10)
	sw $29, 10556($10)
	sw $29, 18720($10)
	sw $29, 17632($10)
	sw $29, 18204($10)
	sw $29, 16664($10)
	sw $29, 18200($10)
	sw $29, 17192($10)
	sw $29, 10448($10)
	sw $29, 16668($10)
	sw $29, 10440($10)
	sw $29, 18728($10)
	sw $29, 17116($10)
	sw $29, 10444($10)
	sw $29, 18724($10)
	sw $29, 17636($10)
	sw $29, 18208($10)
####################################################################################################################################	
	#Branco
	addi $29, $0, 0xffffff
	sw $29, 21764($10)
	sw $29, 21784($10)
	sw $29, 21760($10)
	sw $29, 21780($10)
	sw $29, 22792($10)
	sw $29, 22276($10)
	sw $29, 22772($10)
	sw $29, 21748($10)
	sw $29, 22796($10)
	sw $29, 21768($10)
	sw $29, 22776($10)
	sw $29, 21788($10)
	sw $29, 22292($10)
	sw $29, 22272($10)
	sw $29, 22296($10)
	sw $29, 22808($10)
	sw $29, 21776($10)
	sw $29, 22800($10)
	sw $29, 21752($10)
	sw $29, 21772($10)
	sw $29, 22804($10)
	sw $29, 22264($10)
	sw $29, 22288($10)
	sw $29, 22300($10)
	sw $29, 22784($10)
	sw $29, 21736($10)
	sw $29, 22268($10)
	sw $29, 21756($10)
	sw $29, 22788($10)
	sw $29, 22280($10)
	sw $29, 22260($10)
	sw $29, 22284($10)
	sw $29, 22780($10)
####################################################################################################################################	
	#Vermelho
	addi $29, $0, 0xff0000
	sw $29, 19148($10)
	sw $29, 16076($10)
	sw $29, 17720($10)
	sw $29, 19144($10)
	sw $29, 19264($10)
	sw $29, 17088($10)
	sw $29, 19140($10)
	sw $29, 19260($10)
	sw $29, 16072($10)
	sw $29, 16192($10)
	sw $29, 17608($10)
	sw $29, 17604($10)
	sw $29, 17208($10)
	sw $29, 17728($10)
	sw $29, 17600($10)
	sw $29, 17724($10)
	sw $29, 17212($10)
	sw $29, 17096($10)
	sw $29, 17092($10)
	sw $29, 18748($10)
	sw $29, 18628($10)
	sw $29, 18744($10)
	sw $29, 17732($10)
	sw $29, 17612($10)
	sw $29, 18624($10)
	sw $29, 17216($10)
	sw $29, 18752($10)
	sw $29, 18632($10)
	sw $29, 18236($10)
	sw $29, 18116($10)
	sw $29, 16576($10)
	sw $29, 16696($10)
	sw $29, 18232($10)
	sw $29, 17220($10)
	sw $29, 17100($10)
	sw $29, 18112($10)
	sw $29, 18756($10)
	sw $29, 18636($10)
	sw $29, 18124($10)
	sw $29, 16580($10)
	sw $29, 16184($10)
	sw $29, 18120($10)
	sw $29, 16068($10)
	sw $29, 19256($10)
	sw $29, 16584($10)
	sw $29, 16188($10)
	sw $29, 18244($10)
	sw $29, 18240($10)
	sw $29, 16708($10)
	sw $29, 16700($10)
	sw $29, 16588($10)
	sw $29, 16704($10)




	
	jr $31
	
	
#.data
#MARROM: 		.word 0x663300
#VERDE_ESCURO: 		.word 0x006600
#VERMELHO_SANGUE: 	.word 0xff0000
#CINZA_ESCURO: 		.word 0x333333
#CINZA_CLARO: 		.word 0x999999
#CINZA: 			.word 0x696969
#AZUL_ESCURO: 		.word 0x000080
#AMARELO: 		.word 0xffff00
#AZUL_CLARO: 		.word 0x4682b4
#ROSINHA: 		.word 0xff7256
#PRETO: 			.word 0x000000
#COR_CAPPA: 		.word 0xffa07a
#BRANCO: 		.word 0xffffff
	
	
