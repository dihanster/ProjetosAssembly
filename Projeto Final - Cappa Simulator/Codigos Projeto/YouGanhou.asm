.globl YouGanhou
YouGanhou:
	#addi $7, $0, 0x663300 		#MARROM
	#addi $16, $0, 0x006600 	#VERDE ESCURO
	#addi $17, $0, 0xFF0000		#VERMELHO SANGUE
	#addi $18, $0, 0x333333		#CINZA ESCURO CABELO CAPPA
	#addi $19, $0, 0x999999		#CINZA CLARO CABELO CAPPA
	#addi $20, $0, 0x696969		#CINZA	
	#addi $21, $0, 0x000080		#AZUL ESCURO
	#addi $23, $0, 0xFFFF00		#AMARELO MINION
	#addi $29, $0, 0x4682B4		#AZUL CLARO
	#addi $29, $0, 0xFF7256		#ROSINHA BOCHECHAS
	#addi $29, $0, 0x000000		#PRETO
	#addi $29, $0, 0xFFA07A		#COR DO CAPPA
	#addi $29, $0, 0xFFFFFF		#BRANCO
	
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho � 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001	
	
	#Placa Branca
	addi $29, $0, 0xFFFFFF		#BRANCO
	sw $29, 23968($10)
	sw $29, 21300($10)
	sw $29, 21784($10)
	sw $29, 25904($10)
	sw $29, 21780($10)
	sw $29, 25908($10)
	sw $29, 23960($10)
	sw $29, 21308($10)
	sw $29, 22872($10)
	sw $29, 23964($10)
	sw $29, 21304($10)
	sw $29, 21788($10)
	sw $29, 22876($10)
	sw $29, 25900($10)
	sw $29, 29024($10)
	sw $29, 27088($10)
	sw $29, 29028($10)
	sw $29, 27080($10)
	sw $29, 29020($10)
	sw $29, 27084($10)
	sw $29, 22404($10)
	sw $29, 22888($10)
	sw $29, 24824($10)
	sw $29, 21312($10)
	sw $29, 21796($10)
	sw $29, 25916($10)
	sw $29, 22408($10)
	sw $29, 24828($10)
	sw $29, 21792($10)
	sw $29, 22880($10)
	sw $29, 23972($10)
	sw $29, 22400($10)
	sw $29, 22884($10)
	sw $29, 21316($10)
	sw $29, 25912($10)
	sw $29, 23976($10)
	sw $29, 29032($10)
	sw $29, 29036($10)
	sw $29, 23944($10)
	sw $29, 21764($10)
	sw $29, 22856($10)
	sw $29, 23948($10)
	sw $29, 21760($10)
	sw $29, 29008($10)
	sw $29, 23940($10)
	sw $29, 21768($10)
	sw $29, 22852($10)
	sw $29, 29000($10)
	sw $29, 29484($10)
	sw $29, 27064($10)
	sw $29, 29004($10)
	sw $29, 29488($10)
	sw $29, 27068($10)
	sw $29, 29480($10)
	sw $29, 27060($10)
	sw $29, 21776($10)
	sw $29, 23956($10)
	sw $29, 22868($10)
	sw $29, 21772($10)
	sw $29, 22860($10)
	sw $29, 23952($10)
	sw $29, 22864($10)
	sw $29, 27076($10)
	sw $29, 29012($10)
	sw $29, 29496($10)
	sw $29, 29016($10)
	sw $29, 27072($10)
	sw $29, 29492($10)
	sw $29, 20896($10)
	sw $29, 23924($10)
	sw $29, 22836($10)
	sw $29, 20892($10)
	sw $29, 23928($10)
	sw $29, 23920($10)
	sw $29, 22832($10)
	sw $29, 29464($10)
	sw $29, 27044($10)
	sw $29, 29468($10)
	sw $29, 27048($10)
	sw $29, 29460($10)
	sw $29, 27040($10)
	sw $29, 22844($10)
	sw $29, 21752($10)
	sw $29, 23936($10)
	sw $29, 22848($10)
	sw $29, 22840($10)
	sw $29, 21756($10)
	sw $29, 23932($10)
	sw $29, 27052($10)
	sw $29, 29472($10)
	sw $29, 27056($10)
	sw $29, 29476($10)
	sw $29, 23900($10)
	sw $29, 22812($10)
	sw $29, 20872($10)
	sw $29, 21960($10)
	sw $29, 23904($10)
	sw $29, 22816($10)
	sw $29, 29448($10)
	sw $29, 21968($10)
	sw $29, 27028($10)
	sw $29, 20876($10)
	sw $29, 21964($10)
	sw $29, 28592($10)
	sw $29, 29440($10)
	sw $29, 27020($10)
	sw $29, 28112($10)
	sw $29, 28596($10)
	sw $29, 29444($10)
	sw $29, 27024($10)
	sw $29, 22808($10)
	sw $29, 20884($10)
	sw $29, 23912($10)
	sw $29, 22824($10)
	sw $29, 20880($10)
	sw $29, 23916($10)
	sw $29, 22828($10)
	sw $29, 20888($10)
	sw $29, 22820($10)
	sw $29, 27032($10)
	sw $29, 29452($10)
	sw $29, 27036($10)
	sw $29, 29456($10)
	sw $29, 23908($10)
	sw $29, 23328($10)
	sw $29, 27928($10)
	sw $29, 21388($10)
	sw $29, 25508($10)
	sw $29, 21384($10)
	sw $29, 23320($10)
	sw $29, 27920($10)
	sw $29, 24412($10)
	sw $29, 24896($10)
	sw $29, 22476($10)
	sw $29, 25500($10)
	sw $29, 25984($10)
	sw $29, 23324($10)
	sw $29, 27924($10)
	sw $29, 24416($10)
	sw $29, 25504($10)
	sw $29, 25988($10)
	sw $29, 24892($10)
	sw $29, 22472($10)
	sw $29, 25980($10)
	sw $29, 21380($10)
	sw $29, 24428($10)
	sw $29, 21396($10)
	sw $29, 23332($10)
	sw $29, 24420($10)
	sw $29, 27932($10)
	sw $29, 25512($10)
	sw $29, 25996($10)
	sw $29, 23336($10)
	sw $29, 24424($10)
	sw $29, 27936($10)
	sw $29, 25516($10)
	sw $29, 22480($10)
	sw $29, 25992($10)
	sw $29, 21392($10)
	sw $29, 21368($10)
	sw $29, 25968($10)
	sw $29, 23308($10)
	sw $29, 27904($10)
	sw $29, 21364($10)
	sw $29, 27908($10)
	sw $29, 24872($10)
	sw $29, 22452($10)
	sw $29, 25960($10)
	sw $29, 23300($10)
	sw $29, 24876($10)
	sw $29, 22456($10)
	sw $29, 25964($10)
	sw $29, 23304($10)
	sw $29, 27900($10)
	sw $29, 29088($10)
	sw $29, 21360($10)
	sw $29, 29080($10)
	sw $29, 29084($10)
	sw $29, 24408($10)
	sw $29, 27916($10)
	sw $29, 21376($10)
	sw $29, 25972($10)
	sw $29, 22464($10)
	sw $29, 23312($10)
	sw $29, 24400($10)
	sw $29, 24884($10)
	sw $29, 25976($10)
	sw $29, 22468($10)
	sw $29, 23316($10)
	sw $29, 24404($10)
	sw $29, 24888($10)
	sw $29, 27912($10)
	sw $29, 22460($10)
	sw $29, 24880($10)
	sw $29, 21372($10)
	sw $29, 29092($10)
	sw $29, 29096($10)
	sw $29, 21344($10)
	sw $29, 25948($10)
	sw $29, 21340($10)
	sw $29, 24852($10)
	sw $29, 22432($10)
	sw $29, 25940($10)
	sw $29, 24856($10)
	sw $29, 21348($10)
	sw $29, 22436($10)
	sw $29, 25944($10)
	sw $29, 29068($10)
	sw $29, 29060($10)
	sw $29, 29064($10)
	sw $29, 22448($10)
	sw $29, 24868($10)
	sw $29, 21356($10)
	sw $29, 21352($10)
	sw $29, 22440($10)
	sw $29, 24860($10)
	sw $29, 25952($10)
	sw $29, 22444($10)
	sw $29, 24864($10)
	sw $29, 25956($10)
	sw $29, 29076($10)
	sw $29, 29072($10)
	sw $29, 23504($10)
	sw $29, 23988($10)
	sw $29, 24836($10)
	sw $29, 21324($10)
	sw $29, 22416($10)
	sw $29, 25924($10)
	sw $29, 21320($10)
	sw $29, 25928($10)
	sw $29, 23980($10)
	sw $29, 22892($10)
	sw $29, 23500($10)
	sw $29, 23984($10)
	sw $29, 24832($10)
	sw $29, 21328($10)
	sw $29, 22412($10)
	sw $29, 22896($10)
	sw $29, 25920($10)
	sw $29, 29044($10)
	sw $29, 29048($10)
	sw $29, 29040($10)
	sw $29, 21336($10)
	sw $29, 25936($10)
	sw $29, 22428($10)
	sw $29, 24848($10)
	sw $29, 21332($10)
	sw $29, 23992($10)
	sw $29, 22420($10)
	sw $29, 24840($10)
	sw $29, 25932($10)
	sw $29, 23996($10)
	sw $29, 22424($10)
	sw $29, 24844($10)
	sw $29, 29056($10)
	sw $29, 29052($10)
	sw $29, 28976($10)
	sw $29, 23288($10)
	sw $29, 24376($10)
	sw $29, 27404($10)
	sw $29, 25468($10)
	sw $29, 26556($10)
	sw $29, 27408($10)
	sw $29, 25460($10)
	sw $29, 28972($10)
	sw $29, 24372($10)
	sw $29, 27400($10)
	sw $29, 25464($10)
	sw $29, 26552($10)
	sw $29, 24388($10)
	sw $29, 25476($10)
	sw $29, 28504($10)
	sw $29, 28988($10)
	sw $29, 26568($10)
	sw $29, 27412($10)
	sw $29, 27896($10)
	sw $29, 28508($10)
	sw $29, 27416($10)
	sw $29, 24380($10)
	sw $29, 28980($10)
	sw $29, 23292($10)
	sw $29, 26560($10)
	sw $29, 24384($10)
	sw $29, 25472($10)
	sw $29, 28500($10)
	sw $29, 28984($10)
	sw $29, 23296($10)
	sw $29, 26564($10)
	sw $29, 25444($10)
	sw $29, 26532($10)
	sw $29, 28952($10)
	sw $29, 24356($10)
	sw $29, 25448($10)
	sw $29, 26536($10)
	sw $29, 28956($10)
	sw $29, 25440($10)
	sw $29, 24352($10)
	sw $29, 26544($10)
	sw $29, 24368($10)
	sw $29, 25456($10)
	sw $29, 28964($10)
	sw $29, 26548($10)
	sw $29, 28968($10)
	sw $29, 24360($10)
	sw $29, 26540($10)
	sw $29, 24364($10)
	sw $29, 25452($10)
	sw $29, 28960($10)
	sw $29, 22396($10)
	sw $29, 26996($10)
	sw $29, 28932($10)
	sw $29, 24332($10)
	sw $29, 25424($10)
	sw $29, 23488($10)
	sw $29, 26512($10)
	sw $29, 27600($10)
	sw $29, 28936($10)
	sw $29, 24336($10)
	sw $29, 25428($10)
	sw $29, 26516($10)
	sw $29, 23480($10)
	sw $29, 22392($10)
	sw $29, 26992($10)
	sw $29, 25420($10)
	sw $29, 23484($10)
	sw $29, 23496($10)
	sw $29, 24344($10)
	sw $29, 25432($10)
	sw $29, 28944($10)
	sw $29, 26524($10)
	sw $29, 24348($10)
	sw $29, 25436($10)
	sw $29, 28948($10)
	sw $29, 26528($10)
	sw $29, 23492($10)
	sw $29, 24340($10)
	sw $29, 28940($10)
	sw $29, 26520($10)
	sw $29, 25408($10)
	sw $29, 21288($10)
	sw $29, 25400($10)
	sw $29, 25884($10)
	sw $29, 23464($10)
	sw $29, 22376($10)
	sw $29, 26972($10)
	sw $29, 24312($10)
	sw $29, 25404($10)
	sw $29, 25888($10)
	sw $29, 23468($10)
	sw $29, 26976($10)
	sw $29, 24316($10)
	sw $29, 25880($10)
	sw $29, 23460($10)
	sw $29, 22372($10)
	sw $29, 21284($10)
	sw $29, 21280($10)
	sw $29, 26508($10)
	sw $29, 28928($10)
	sw $29, 21296($10)
	sw $29, 26500($10)
	sw $29, 23476($10)
	sw $29, 24324($10)
	sw $29, 22388($10)
	sw $29, 25412($10)
	sw $29, 25896($10)
	sw $29, 26984($10)
	sw $29, 28920($10)
	sw $29, 26504($10)
	sw $29, 24328($10)
	sw $29, 25416($10)
	sw $29, 26988($10)
	sw $29, 28924($10)
	sw $29, 22380($10)
	sw $29, 23472($10)
	sw $29, 24320($10)
	sw $29, 22384($10)
	sw $29, 25892($10)
	sw $29, 26980($10)
	sw $29, 21292($10)
	sw $29, 20852($10)
	sw $29, 21940($10)
	sw $29, 21948($10)
	sw $29, 27008($10)
	sw $29, 20856($10)
	sw $29, 21944($10)
	sw $29, 28572($10)
	sw $29, 26392($10)
	sw $29, 27000($10)
	sw $29, 27484($10)
	sw $29, 28576($10)
	sw $29, 26396($10)
	sw $29, 27004($10)
	sw $29, 27488($10)
	sw $29, 27480($10)
	sw $29, 21952($10)
	sw $29, 22800($10)
	sw $29, 20860($10)
	sw $29, 22804($10)
	sw $29, 28108($10)
	sw $29, 27016($10)
	sw $29, 20868($10)
	sw $29, 29436($10)
	sw $29, 21956($10)
	sw $29, 20864($10)
	sw $29, 28100($10)
	sw $29, 28584($10)
	sw $29, 27492($10)
	sw $29, 28104($10)
	sw $29, 28588($10)
	sw $29, 27012($10)
	sw $29, 27496($10)
	sw $29, 29432($10)
	sw $29, 28580($10)
	sw $29, 29648($10)
	sw $29, 20836($10)
	sw $29, 28556($10)
	sw $29, 21924($10)
	sw $29, 27468($10)
	sw $29, 20832($10)
	sw $29, 21920($10)
	sw $29, 25040($10)
	sw $29, 29640($10)
	sw $29, 26372($10)
	sw $29, 27460($10)
	sw $29, 29644($10)
	sw $29, 28552($10)
	sw $29, 20828($10)
	sw $29, 26376($10)
	sw $29, 27464($10)
	sw $29, 20840($10)
	sw $29, 20848($10)
	sw $29, 21936($10)
	sw $29, 28568($10)
	sw $29, 20844($10)
	sw $29, 21932($10)
	sw $29, 27472($10)
	sw $29, 26384($10)
	sw $29, 28560($10)
	sw $29, 27476($10)
	sw $29, 26388($10)
	sw $29, 21928($10)
	sw $29, 28564($10)
	sw $29, 26380($10)
	sw $29, 20816($10)
	sw $29, 28536($10)
	sw $29, 21904($10)
	sw $29, 27448($10)
	sw $29, 25028($10)
	sw $29, 29624($10)
	sw $29, 20812($10)
	sw $29, 21900($10)
	sw $29, 29628($10)
	sw $29, 27440($10)
	sw $29, 25020($10)
	sw $29, 28532($10)
	sw $29, 20808($10)
	sw $29, 27444($10)
	sw $29, 25024($10)
	sw $29, 29620($10)
	sw $29, 21916($10)
	sw $29, 26368($10)
	sw $29, 25036($10)
	sw $29, 28548($10)
	sw $29, 29636($10)
	sw $29, 27456($10)
	sw $29, 20824($10)
	sw $29, 21912($10)
	sw $29, 20820($10)
	sw $29, 26360($10)
	sw $29, 28540($10)
	sw $29, 26364($10)
	sw $29, 21908($10)
	sw $29, 25032($10)
	sw $29, 28544($10)
	sw $29, 29632($10)
	sw $29, 27452($10)
	sw $29, 25004($10)
	sw $29, 25488($10)
	sw $29, 29604($10)
	sw $29, 26576($10)
	sw $29, 28512($10)
	sw $29, 28996($10)
	sw $29, 27424($10)
	sw $29, 25008($10)
	sw $29, 29608($10)
	sw $29, 28516($10)
	sw $29, 27428($10)
	sw $29, 25480($10)
	sw $29, 24392($10)
	sw $29, 25000($10)
	sw $29, 25484($10)
	sw $29, 29600($10)
	sw $29, 26572($10)
	sw $29, 28992($10)
	sw $29, 24396($10)
	sw $29, 27420($10)
	sw $29, 27436($10)
	sw $29, 20804($10)
	sw $29, 25016($10)
	sw $29, 28524($10)
	sw $29, 29612($10)
	sw $29, 20800($10)
	sw $29, 28528($10)
	sw $29, 29616($10)
	sw $29, 25492($10)
	sw $29, 27432($10)
	sw $29, 25012($10)
	sw $29, 25496($10)
	sw $29, 28520($10)
	sw $29, 21424($10)
	sw $29, 23848($10)
	sw $29, 24936($10)
	sw $29, 21420($10)
	sw $29, 22992($10)
	sw $29, 23840($10)
	sw $29, 21428($10)
	sw $29, 23844($10)
	sw $29, 24932($10)
	sw $29, 28056($10)
	sw $29, 28052($10)
	sw $29, 23856($10)
	sw $29, 24948($10)
	sw $29, 21432($10)
	sw $29, 24940($10)
	sw $29, 23852($10)
	sw $29, 24944($10)
	sw $29, 21436($10)
	sw $29, 28064($10)
	sw $29, 28068($10)
	sw $29, 28060($10)
	sw $29, 22976($10)
	sw $29, 20796($10)
	sw $29, 23824($10)
	sw $29, 24912($10)
	sw $29, 21400($10)
	sw $29, 21884($10)
	sw $29, 20792($10)
	sw $29, 23828($10)
	sw $29, 24916($10)
	sw $29, 21880($10)
	sw $29, 21408($10)
	sw $29, 29128($10)
	sw $29, 22972($10)
	sw $29, 23820($10)
	sw $29, 21404($10)
	sw $29, 21888($10)
	sw $29, 28032($10)
	sw $29, 29120($10)
	sw $29, 28036($10)
	sw $29, 29124($10)
	sw $29, 24924($10)
	sw $29, 21412($10)
	sw $29, 21896($10)
	sw $29, 22988($10)
	sw $29, 23836($10)
	sw $29, 24928($10)
	sw $29, 21892($10)
	sw $29, 22980($10)
	sw $29, 24920($10)
	sw $29, 21416($10)
	sw $29, 22984($10)
	sw $29, 23832($10)
	sw $29, 28044($10)
	sw $29, 29132($10)
	sw $29, 28048($10)
	sw $29, 29136($10)
	sw $29, 28040($10)
	sw $29, 21864($10)
	sw $29, 22956($10)
	sw $29, 20772($10)
	sw $29, 23804($10)
	sw $29, 21860($10)
	sw $29, 23808($10)
	sw $29, 29108($10)
	sw $29, 21868($10)
	sw $29, 22952($10)
	sw $29, 20776($10)
	sw $29, 23800($10)
	sw $29, 28012($10)
	sw $29, 28496($10)
	sw $29, 29100($10)
	sw $29, 29584($10)
	sw $29, 28016($10)
	sw $29, 29104($10)
	sw $29, 29588($10)
	sw $29, 28492($10)
	sw $29, 29580($10)
	sw $29, 23812($10)
	sw $29, 20784($10)
	sw $29, 24904($10)
	sw $29, 21872($10)
	sw $29, 22968($10)
	sw $29, 23816($10)
	sw $29, 20780($10)
	sw $29, 24908($10)
	sw $29, 28028($10)
	sw $29, 22960($10)
	sw $29, 20788($10)
	sw $29, 24900($10)
	sw $29, 21876($10)
	sw $29, 22964($10)
	sw $29, 29112($10)
	sw $29, 29596($10)
	sw $29, 28020($10)
	sw $29, 29116($10)
	sw $29, 28024($10)
	sw $29, 29592($10)
	sw $29, 22932($10)
	sw $29, 20752($10)
	sw $29, 21840($10)
	sw $29, 22936($10)
	sw $29, 21848($10)
	sw $29, 29568($10)
	sw $29, 20756($10)
	sw $29, 21844($10)
	sw $29, 26052($10)
	sw $29, 27384($10)
	sw $29, 28472($10)
	sw $29, 29560($10)
	sw $29, 26056($10)
	sw $29, 27388($10)
	sw $29, 28476($10)
	sw $29, 29564($10)
	sw $29, 20764($10)
	sw $29, 21852($10)
	sw $29, 22944($10)
	sw $29, 20760($10)
	sw $29, 22948($10)
	sw $29, 28008($10)
	sw $29, 20768($10)
	sw $29, 21856($10)
	sw $29, 22940($10)
	sw $29, 28000($10)
	sw $29, 28484($10)
	sw $29, 27396($10)
	sw $29, 29572($10)
	sw $29, 26064($10)
	sw $29, 28004($10)
	sw $29, 28488($10)
	sw $29, 29576($10)
	sw $29, 28480($10)
	sw $29, 27392($10)
	sw $29, 26060($10)
	sw $29, 21268($10)
	sw $29, 21264($10)
	sw $29, 22352($10)
	sw $29, 25864($10)
	sw $29, 23444($10)
	sw $29, 26952($10)
	sw $29, 22356($10)
	sw $29, 25868($10)
	sw $29, 23448($10)
	sw $29, 26956($10)
	sw $29, 25860($10)
	sw $29, 23440($10)
	sw $29, 21260($10)
	sw $29, 21276($10)
	sw $29, 23452($10)
	sw $29, 22364($10)
	sw $29, 25872($10)
	sw $29, 26964($10)
	sw $29, 23456($10)
	sw $29, 22368($10)
	sw $29, 25876($10)
	sw $29, 26968($10)
	sw $29, 22360($10)
	sw $29, 26960($10)
	sw $29, 21272($10)
	sw $29, 21248($10)
	sw $29, 25848($10)
	sw $29, 23428($10)
	sw $29, 24516($10)
	sw $29, 26936($10)
	sw $29, 21244($10)
	sw $29, 23420($10)
	sw $29, 24992($10)
	sw $29, 22332($10)
	sw $29, 23424($10)
	sw $29, 24512($10)
	sw $29, 24996($10)
	sw $29, 26932($10)
	sw $29, 22336($10)
	sw $29, 21240($10)
	sw $29, 24528($10)
	sw $29, 26948($10)
	sw $29, 21256($10)
	sw $29, 21252($10)
	sw $29, 24520($10)
	sw $29, 26940($10)
	sw $29, 23432($10)
	sw $29, 22344($10)
	sw $29, 25852($10)
	sw $29, 24524($10)
	sw $29, 26944($10)
	sw $29, 23436($10)
	sw $29, 22348($10)
	sw $29, 25856($10)
	sw $29, 22340($10)
	sw $29, 22316($10)
	sw $29, 23408($10)
	sw $29, 26916($10)
	sw $29, 22792($10)
	sw $29, 23400($10)
	sw $29, 23884($10)
	sw $29, 24972($10)
	sw $29, 22312($10)
	sw $29, 22796($10)
	sw $29, 23404($10)
	sw $29, 23888($10)
	sw $29, 24976($10)
	sw $29, 26912($10)
	sw $29, 23880($10)
	sw $29, 28092($10)
	sw $29, 28096($10)
	sw $29, 23416($10)
	sw $29, 22328($10)
	sw $29, 24508($10)
	sw $29, 26928($10)
	sw $29, 23892($10)
	sw $29, 22320($10)
	sw $29, 24500($10)
	sw $29, 24984($10)
	sw $29, 26920($10)
	sw $29, 23412($10)
	sw $29, 23896($10)
	sw $29, 22324($10)
	sw $29, 24504($10)
	sw $29, 24988($10)
	sw $29, 26924($10)
	sw $29, 24980($10)
	sw $29, 23868($10)
	sw $29, 24956($10)
	sw $29, 21444($10)
	sw $29, 21440($10)
	sw $29, 23860($10)
	sw $29, 23864($10)
	sw $29, 24952($10)
	sw $29, 21448($10)
	sw $29, 22776($10)
	sw $29, 28076($10)
	sw $29, 28072($10)
	sw $29, 24968($10)
	sw $29, 26904($10)
	sw $29, 21456($10)
	sw $29, 22308($10)
	sw $29, 26908($10)
	sw $29, 21452($10)
	sw $29, 24960($10)
	sw $29, 23872($10)
	sw $29, 22300($10)
	sw $29, 22784($10)
	sw $29, 24964($10)
	sw $29, 26900($10)
	sw $29, 23876($10)
	sw $29, 22304($10)
	sw $29, 22788($10)
	sw $29, 28088($10)
	sw $29, 22780($10)
	sw $29, 28080($10)
	sw $29, 28084($10)
	sw $29, 27524($10)
	sw $29, 25344($10)
	sw $29, 26436($10)
	sw $29, 24016($10)
	sw $29, 28612($10)
	sw $29, 27528($10)
	sw $29, 25348($10)
	sw $29, 28616($10)
	sw $29, 24492($10)
	sw $29, 27520($10)
	sw $29, 25340($10)
	sw $29, 24496($10)
	sw $29, 26432($10)
	sw $29, 24012($10)
	sw $29, 20904($10)
	sw $29, 25356($10)
	sw $29, 28624($10)
	sw $29, 26444($10)
	sw $29, 27536($10)
	sw $29, 20900($10)
	sw $29, 26448($10)
	sw $29, 25352($10)
	sw $29, 28620($10)
	sw $29, 26440($10)
	sw $29, 27532($10)
	sw $29, 27508($10)
	sw $29, 24476($10)
	sw $29, 26412($10)
	sw $29, 26896($10)
	sw $29, 23388($10)
	sw $29, 27500($10)
	sw $29, 27984($10)
	sw $29, 26416($10)
	sw $29, 27504($10)
	sw $29, 27988($10)
	sw $29, 23380($10)
	sw $29, 22292($10)
	sw $29, 24472($10)
	sw $29, 26892($10)
	sw $29, 23384($10)
	sw $29, 27980($10)
	sw $29, 22296($10)
	sw $29, 28608($10)
	sw $29, 24004($10)
	sw $29, 25336($10)
	sw $29, 28600($10)
	sw $29, 24488($10)
	sw $29, 26424($10)
	sw $29, 27512($10)
	sw $29, 27996($10)
	sw $29, 24008($10)
	sw $29, 28604($10)
	sw $29, 26428($10)
	sw $29, 27516($10)
	sw $29, 23392($10)
	sw $29, 24480($10)
	sw $29, 24000($10)
	sw $29, 23396($10)
	sw $29, 24484($10)
	sw $29, 26420($10)
	sw $29, 27992($10)
	sw $29, 23364($10)
	sw $29, 27964($10)
	sw $29, 22276($10)
	sw $29, 24456($10)
	sw $29, 26876($10)
	sw $29, 25544($10)
	sw $29, 23368($10)
	sw $29, 27968($10)
	sw $29, 25548($10)
	sw $29, 23360($10)
	sw $29, 27960($10)
	sw $29, 22272($10)
	sw $29, 24452($10)
	sw $29, 26872($10)
	sw $29, 25540($10)
	sw $29, 26408($10)
	sw $29, 23376($10)
	sw $29, 24464($10)
	sw $29, 26400($10)
	sw $29, 26884($10)
	sw $29, 27976($10)
	sw $29, 22288($10)
	sw $29, 24468($10)
	sw $29, 26404($10)
	sw $29, 26888($10)
	sw $29, 22280($10)
	sw $29, 23372($10)
	sw $29, 24460($10)
	sw $29, 26880($10)
	sw $29, 27972($10)
	sw $29, 22284($10)
	sw $29, 25552($10)
	sw $29, 25528($10)
	sw $29, 27948($10)
	sw $29, 24432($10)
	sw $29, 25520($10)
	sw $29, 23344($10)
	sw $29, 27940($10)
	sw $29, 24436($10)
	sw $29, 25524($10)
	sw $29, 23348($10)
	sw $29, 27944($10)
	sw $29, 23340($10)
	sw $29, 22264($10)
	sw $29, 25532($10)
	sw $29, 23356($10)
	sw $29, 24444($10)
	sw $29, 27952($10)
	sw $29, 22268($10)
	sw $29, 25536($10)
	sw $29, 24448($10)
	sw $29, 27956($10)
	sw $29, 23352($10)
	sw $29, 24440($10)
	sw $29, 21820($10)
	sw $29, 22912($10)
	sw $29, 22916($10)
	sw $29, 21828($10)
	sw $29, 29548($10)
	sw $29, 20736($10)
	sw $29, 21824($10)
	sw $29, 20732($10)
	sw $29, 28452($10)
	sw $29, 29540($10)
	sw $29, 26032($10)
	sw $29, 28456($10)
	sw $29, 29544($10)
	sw $29, 26036($10)
	sw $29, 22908($10)
	sw $29, 20740($10)
	sw $29, 22924($10)
	sw $29, 22928($10)
	sw $29, 26048($10)
	sw $29, 20748($10)
	sw $29, 28468($10)
	sw $29, 21836($10)
	sw $29, 20744($10)
	sw $29, 21832($10)
	sw $29, 22920($10)
	sw $29, 29552($10)
	sw $29, 26040($10)
	sw $29, 28460($10)
	sw $29, 29556($10)
	sw $29, 26044($10)
	sw $29, 28464($10)
	sw $29, 26016($10)
	sw $29, 21804($10)
	sw $29, 27588($10)
	sw $29, 28436($10)
	sw $29, 29524($10)
	sw $29, 21800($10)
	sw $29, 29528($10)
	sw $29, 26492($10)
	sw $29, 27580($10)
	sw $29, 26012($10)
	sw $29, 26496($10)
	sw $29, 27584($10)
	sw $29, 28432($10)
	sw $29, 29520($10)
	sw $29, 22900($10)
	sw $29, 22904($10)
	sw $29, 20728($10)
	sw $29, 28448($10)
	sw $29, 21816($10)
	sw $29, 29536($10)
	sw $29, 26028($10)
	sw $29, 21812($10)
	sw $29, 28440($10)
	sw $29, 26020($10)
	sw $29, 27592($10)
	sw $29, 28444($10)
	sw $29, 21808($10)
	sw $29, 29532($10)
	sw $29, 26024($10)
	sw $29, 27596($10)
	sw $29, 27568($10)
	sw $29, 20936($10)
	sw $29, 25388($10)
	sw $29, 28416($10)
	sw $29, 29504($10)
	sw $29, 20932($10)
	sw $29, 29508($10)
	sw $29, 27560($10)
	sw $29, 25380($10)
	sw $29, 26472($10)
	sw $29, 27564($10)
	sw $29, 25384($10)
	sw $29, 28412($10)
	sw $29, 29500($10)
	sw $29, 20928($10)
	sw $29, 26476($10)
	sw $29, 20940($10)
	sw $29, 29516($10)
	sw $29, 26004($10)
	sw $29, 26488($10)
	sw $29, 28424($10)
	sw $29, 20944($10)
	sw $29, 26008($10)
	sw $29, 28428($10)
	sw $29, 25392($10)
	sw $29, 26480($10)
	sw $29, 27572($10)
	sw $29, 25396($10)
	sw $29, 29512($10)
	sw $29, 26000($10)
	sw $29, 26484($10)
	sw $29, 27576($10)
	sw $29, 28420($10)
	sw $29, 26456($10)
	sw $29, 27544($10)
	sw $29, 20912($10)
	sw $29, 25368($10)
	sw $29, 27548($10)
	sw $29, 25360($10)
	sw $29, 20908($10)
	sw $29, 26452($10)
	sw $29, 27540($10)
	sw $29, 25364($10)
	sw $29, 20924($10)
	sw $29, 26468($10)
	sw $29, 27556($10)
	sw $29, 28408($10)
	sw $29, 20920($10)
	sw $29, 25372($10)
	sw $29, 26460($10)
	sw $29, 25376($10)
	sw $29, 20916($10)
	sw $29, 26464($10)
	sw $29, 27552($10)
	
	#Preto
	addi $29, $0, 0x000000		#PRETO
	sw $29, 23968($10)
	sw $29, 21784($10)
	sw $29, 23848($10)
	sw $29, 25904($10)
	sw $29, 24936($10)
	sw $29, 25508($10)
	sw $29, 21780($10)
	sw $29, 25908($10)
	sw $29, 23320($10)
	sw $29, 24896($10)
	sw $29, 25468($10)
	sw $29, 23444($10)
	sw $29, 23448($10)
	sw $29, 25504($10)
	sw $29, 24492($10)
	sw $29, 26032($10)
	sw $29, 26396($10)
	sw $29, 24372($10)
	sw $29, 26432($10)
	sw $29, 26036($10)
	sw $29, 25980($10)
	sw $29, 26552($10)
	sw $29, 23856($10)
	sw $29, 22888($10)
	sw $29, 24428($10)
	sw $29, 22924($10)
	sw $29, 22804($10)
	sw $29, 24940($10)
	sw $29, 25996($10)
	sw $29, 23972($10)
	sw $29, 23456($10)
	sw $29, 23336($10)
	sw $29, 24424($10)
	sw $29, 25516($10)
	sw $29, 23976($10)
	sw $29, 26040($10)
	sw $29, 24384($10)
	sw $29, 27012($10)
	sw $29, 26936($10)
	sw $29, 23948($10)
	sw $29, 23828($10)
	sw $29, 26016($10)
	sw $29, 25960($10)
	sw $29, 24992($10)
	sw $29, 26532($10)
	sw $29, 24356($10)
	sw $29, 26416($10)
	sw $29, 25448($10)
	sw $29, 26932($10)
	sw $29, 25964($10)
	sw $29, 24996($10)
	sw $29, 21800($10)
	sw $29, 22292($10)
	sw $29, 27064($10)
	sw $29, 26496($10)
	sw $29, 24472($10)
	sw $29, 22296($10)
	sw $29, 27060($10)
	sw $29, 26940($10)
	sw $29, 24368($10)
	sw $29, 24884($10)
	sw $29, 24488($10)
	sw $29, 26944($10)
	sw $29, 26548($10)
	sw $29, 23832($10)
	sw $29, 23436($10)
	sw $29, 23316($10)
	sw $29, 24480($10)
	sw $29, 26020($10)
	sw $29, 24880($10)
	sw $29, 26420($10)
	sw $29, 25452($10)
	sw $29, 24484($10)
	sw $29, 21864($10)
	sw $29, 26996($10)
	sw $29, 23400($10)
	sw $29, 24972($10)
	sw $29, 22312($10)
	sw $29, 21868($10)
	sw $29, 21900($10)
	sw $29, 26912($10)
	sw $29, 23404($10)
	sw $29, 26516($10)
	sw $29, 27044($10)
	sw $29, 23480($10)
	sw $29, 26992($10)
	sw $29, 26476($10)
	sw $29, 27040($10)
	sw $29, 26928($10)
	sw $29, 22968($10)
	sw $29, 24344($10)
	sw $29, 24860($10)
	sw $29, 26400($10)
	sw $29, 26488($10)
	sw $29, 26004($10)
	sw $29, 24984($10)
	sw $29, 24348($10)
	sw $29, 24864($10)
	sw $29, 24468($10)
	sw $29, 26008($10)
	sw $29, 26528($10)
	sw $29, 24504($10)
	sw $29, 25392($10)
	sw $29, 26480($10)
	sw $29, 25396($10)
	sw $29, 24460($10)
	sw $29, 24980($10)
	sw $29, 26520($10)
	sw $29, 25408($10)
	sw $29, 22932($10)
	sw $29, 23868($10)
	sw $29, 24956($10)
	sw $29, 25528($10)
	sw $29, 22936($10)
	sw $29, 25884($10)
	sw $29, 25004($10)
	sw $29, 23860($10)
	sw $29, 22892($10)
	sw $29, 23464($10)
	sw $29, 25520($10)
	sw $29, 22376($10)
	sw $29, 27028($10)
	sw $29, 25888($10)
	sw $29, 23864($10)
	sw $29, 25920($10)
	sw $29, 22412($10)
	sw $29, 25484($10)
	sw $29, 23460($10)
	sw $29, 22808($10)
	sw $29, 23912($10)
	sw $29, 22824($10)
	sw $29, 26908($10)
	sw $29, 23916($10)
	sw $29, 23992($10)
	sw $29, 23872($10)
	sw $29, 24444($10)
	sw $29, 25016($10)
	sw $29, 26504($10)
	sw $29, 27032($10)
	sw $29, 25372($10)
	sw $29, 22380($10)
	sw $29, 25492($10)
	sw $29, 25376($10)
	sw $29, 25496($10)
	sw $29, 24904($10)
	sw $29, 24408($10)
	sw $29, 25928($10)
	sw $29, 24908($10)
	sw $29, 26456($10)
	sw $29, 26444($10)
	sw $29, 25432($10)
	sw $29, 26964($10)
	sw $29, 23884($10)
	sw $29, 26952($10)
	sw $29, 25932($10)
	sw $29, 23896($10)
	sw $29, 24920($10)
	sw $29, 26968($10)
	sw $29, 25416($10)
	sw $29, 26956($10)
	sw $29, 25944($10)
	sw $29, 24392($10)
	sw $29, 26440($10)
	sw $29, 25420($10)
	sw $29, 26960($10)
	sw $29, 23880($10)
	sw $29, 24396($10)
	
	jr $31
