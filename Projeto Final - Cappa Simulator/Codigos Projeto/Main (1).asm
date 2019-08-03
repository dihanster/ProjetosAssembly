####################################################################################################################################
# 			~~~~~~~~~~~~~~~~~~~ Cappa Simulator ~~~~~~~~~~~~~~~~~~~~						   
#
# Jogo desenvolvido para a disciplina de Arquitetura e Organizacao de Computadores ministrada pelo Prof. Fabio Cappabianco
# por: 	Felipe Hikari Kawahama			RA: 112197
#    	Natália Araujo dos Reis 		RA: 112247
#    	Vitor Costa Carvalho			RA: 111840
#     	Willian Dihanster Gomes de Oliveira 	RA: 112269
#
# 		       ~~~~~~~~~~~~~~~~~~~~ Instrucoes ~~~~~~~~~~~~~~~~~~~~~~~~
# Hello, player!
# O jogo eh um idle/clicker baseado na historia de vida do professor Fabio Cappabianco.
# O objetivo eh reunir eh contar sua historia, conquistando as curtidas e ao final, quando o usuario chegar
# a 2000000000 curtidas, um novo Bebê Cappa nascerá, criando assim um exercito de Cappabiancos para conquistar o mundo.
# As curtidas podem ser obtidas manualmente atraves do clique do jogador, pela tecla 'c'. 
# Ou ainda, de acordo com uma taxa, variavel de acordo com o nivel desbloqueado e os upgrades, a cada segundo.
# O jogo conta ainda com 10 niveis, que representam a vida do professor. Para desbloquear um nivel, eh necessario ter saldo 
# suficiente e ter desbloqueado o niveis anteriores ao desejado. Quando o icone lateral estiver colorido, significa que ja eh
# possivel comprar o upgrade. Basta apertar a tecla numerica correspondente ao icone do nivel.
# O usuario pode consultar o preco de cada upgrade pressionando a tecla 'm' para acessar o menu. Tambem, eh possivel consultar
# o quanto um certo upgrade adicionar na taxa de aumento, pressionando a tecla 't'.
# Alem disso, o jogo conta com alguns mini-games. Um deles, eh o CappaVegas, onde o Cappa Magico sorteia um numero de um dado e o 
# jogador deve  tentar adivinhar qual o numero, digitando um numero de 1-6 que corresponde aos numeros do dado, se o jogador 
# acertar, ganha 6x o seu score atual, caso erre, perde tudo.
# CappaJanken, tambem conhecido como Pedra-Papel-e-Tesoura, o usuario joga contra a cpu, para escolher pedra, digitamos 'r',
# tesoura, 't' e para papel 'p'.
# E o CappaTruco, em que o jogador deve escolher entre a carta 1 ou a 2, pressionando a tecla correspondente.
# O jogador ganha o dobro do seu numero de curtidas atual se selecionou a maior carta, caso contrario, perde tudo. 
# O criterio de ordem das cartas eh dado por: A<1<2<3<4<5<6<7<8<9<10<J<Q<K
#			~~~~~~~~~~~~~~~~~~~ Configuracoes MIPS ~~~~~~~~~~~~~~~~~~~~
# Para rodar o jogo, eh necessario o Bitmap Display e o Keyboard and Display MMIO Simulator. 
# Use unit width pixels = unit height pixels = 4, display width = 512 e display = height = 256 e 
# base adress for display = 0x10010000 (static data)
#			~~~~~~~~~~~~~~~~~~~ Divirta-se ~~~~~~~~~~~~~~~~~~~~
####################################################################################################################################
.eqv Cte0 0
.eqv Cte1 1
.eqv Cte2 2
.eqv Cte3 3
.eqv Cte4 4
.eqv Cte5 5
.eqv Cte6 6
.eqv Cte7 7
.eqv Cte8 8
.eqv Cte9 9
.eqv Preco0 10
.eqv Preco1 50
.eqv Preco2 250
.eqv Preco3 1250
.eqv Preco4 6250
.eqv Preco5 30000
.eqv Preco6 155000
.eqv Preco7 7500000
.eqv Preco8 40000000
.eqv Preco9 200000000
.eqv Taxa0 1
.eqv Taxa1 2
.eqv Taxa2 10
.eqv Taxa3 25
.eqv Taxa4 70
.eqv Taxa5 200
.eqv Taxa6 500
.eqv Taxa7 1200
.eqv Taxa8 2500
.eqv Taxa9 10000
.eqv Aux 4242564
.eqv Aux2 999999

.data
#SaldoInsuficiente: .asciiz "Likes Insuficientes!"
Instruções: .asciiz "Pressione c para conseguir Curtidas.\nPressione os números para comprar os upgrades correspondentes.\nPressione m para abrir o Menu de Preços e ver a taxa de aumento.\nPressione t para abrir o Menu de Taxas.\nPressione v para abrir o CappaVegas.\nPressione j para abrir o CappaJanken.\nPressione b para abrir o CappaTruco.\nPara sair de qualquer menu/mini-game, aperte e.\nAtive o som do seu computador!"
.text

main:
	la $a0, Instruções
	li $a1, 1
	li $v0, 55
	syscall
 	li $t7, 0xffff0000	
	jal defineFundo
	jal fundo
	jal LogoCentralizado
	jal CappaDealWithIt
	jal Mensagem
	jal ChecaTecla

ChecaTecla:
	lw $t6, ($t7)			#Leitura do teclado
	andi $t6, $t6, 0x0001
	beq $t6, $0, ChecaTecla		#Se n leu algo, faz laco de novo
	
	jal defineFundo #Limpa a Tela
	jal fundo
	
	jal LogoCentralizado	#Inicia a tela principal do jogo
	jal MenuTudoPreto
	jal CappaBebe
	
	#Reiniciando as variaveis
	move $t0, $0
	move $t1, $0
	move $t2, $0
	move $t3, $0			
	move $t4, $0
	move $t5, $0
	move $t6, $0
	move $t7, $0
	li $t7, 0xffff0000	
	move $t8, $0
	move $t9, $0
	move $v1, $0
	
	#t0 = Contador de Curtidas
	#t1 = Backup do contador pq eh dividido no printanumero, tbm para representar os milis e o $9
	#t2 = o $10
 	#t3 = Contador de seg, se t3 = 10 => passou 1 seg
	#t4 = Taxa da Soma
	#t5 = Contador de iteracao para o printa digito
	#t6 e t7 para leitura do registrador
	#t8 = Contador de Nivel
	#t9 = Resultado da leitura para checar a tecla
	#s0 = Contador da 'Fase'
	#s1 = Preço dos upgrades
	#s2 = Aux pros branches
	#a3 = #No do upgrade - Contador
	#a2 = Taxa do upgrade
	#a1 = Fase
	
LacoPrincipal: 
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001		#Marca inicio da tela
	
	addi $t1, $0, 100	#Qtd do Delay 1000mils = 1 seg
	move $a0, $t1		#Movendo o valor para a0
	li $v0, 32		#Carregando na funcao de delay
	syscall	 

	addi $t3, $t3, 1 
	
	lw $t6, ($t7)			#Leitura do teclado
	andi $t6, $t6, 0x0001
	bne $t6, $0, ChecaLeitura	#Se leu algo
	
	blt $t3, 10, LacoPrincipal
	
	move $t3, $0			#Zera o contador de seg
	
	bge $t0, 2000000000, FimDeJogo
	
	bge $t4, 147000000, TesteSaldo	#Se Saldo for >= (2B - 147000000) vai dar mais de 2B, entao passa o limite
	
	add $t0, $t0, $t4		#Att contador de acordo com a taxa de seg + $t4
	addi $t3, $t3, 1		#Contador de 0.1 seg
	
	bge $t0, 2000000000, FimDeJogo
	
	move $t5, $0			#Guardar o 10 pra iteracao
	addi $t5, $t5, 10
	
	move $t1, $t0			#Guardando ''backup'' pro t1 pq la cremeneta


	jal apagaNumeros
	jal PrintaNumero
	
backFromPrintaNumero:
	j DecideMenu
	j LacoPrincipal 
	
ChecaLeitura: #Chega que tecla foi pressionada
	lw $v0, 4($t7)			#Chegando a Tecla pressionada
	lbu $a0, 0xffff0004
	move $t9, $a0
	
	beq $t9, 99, IncrementaContador		#Se foi 99 = c, incrementa
	
	beq $t9, 48, BebeCappa		#Tecla 0
	beq $t9, 49, CriancaCappa	#Tecla 1
	beq $t9, 50, FormadoCappa	#Tecla 2
	beq $t9, 51, ReggaeCappa	#Tecla 3
	beq $t9, 52, ComputeiroCappa	#Tecla 4
	beq $t9, 53, ProfessorCappa	#Tecla 5
	beq $t9, 54, YoutuberCappa	#Tecla 6
	beq $t9, 55, ChinaCappa		#Tecla 7
	beq $t9, 56, AstronautaCappa	#Tecla 8
	beq $t9, 57, ReiCappa		#Tecla 9
	beq $t9, 118, CappaVegas	#Digitou v => CappaVegas
	beq $t9, 98, CappaTruco		#Digitou b => CappaTruco
	beq $t9, 109, MenuPrecos	#digitou m => Menu de preço
	beq $t9, 116, MenuTaxas		#digitou t => Menu de taxas
	beq $t9, 106, CappaJanken		#digitou p => CappaJanKenPo
	jr $31	

IncrementaContador:
	addi $t0, $t0, 1		#Contador de curtidas
	bge $t0, 2000000000, FimDeJogo
	
	jr $31
	
BebeCappa:
	li $s1, Preco0	
	li $s5, Taxa0
	li $s4, Cte0
	j VerificaSaldo
	
CriancaCappa:
	li $s1, Preco1	
	li $s5, Taxa1
	li $s4, Cte1
	j VerificaSaldo
	
FormadoCappa:
	li $s1, Preco2	
	li $s5, Taxa2
	li $s4, Cte2
	j VerificaSaldo
	
ReggaeCappa:
	li $s1, Preco3	
	li $s5, Taxa3
	li $s4, Cte3
	j VerificaSaldo
	
ComputeiroCappa:
	li $s1, Preco4
	li $s5, Taxa4
	li $s4, Cte4
	j VerificaSaldo
	
ProfessorCappa:
	li $s1, Preco5	
	li $s5, Taxa5
	li $s4, Cte5
	j VerificaSaldo
	
YoutuberCappa:
	li $s1, Preco6
	li $s5, Taxa6
	li $s4, Cte6
	j VerificaSaldo
	
ChinaCappa:
	li $s1, Preco7
	li $s5, Taxa7
	li $s4, Cte7
	j VerificaSaldo
		
AstronautaCappa:
	li $s1, Preco8
	li $s5, Taxa8
	li $s4, Cte8
	j VerificaSaldo
	
ReiCappa:
	li $s1, Preco9	
	li $s5, Taxa9
	li $s4, Cte9
	j VerificaSaldo
##################################################################################################################################	
MenuPrecos:
	jal defineFundo
	jal fundo
	jal CappaDealWithIt
	
	jal MenuPreco
	addi $t5, $0, 7
	move $t1, $t4
	bgt $t4, 9999999, PrintaTaxaM
	j PrintaTaxa

PrintaTaxaM:
	jal DigitoMTaxa
	addi $t5, $0, 7
	j PrintaDigitoM

backFromMenuPreco:
	lw $t6, ($t7)			#Leitura do teclado
	andi $t6, $t6, 0x0001
	beq $t6, $0, backFromMenuPreco	
	lw $v0, 4($t7)			#Chegando a Tecla pressionada
	lbu $a0, 0xffff0004
	move $s7, $a0
	beq $s7, 101, ExitVegas		#Pressione E para sair
	
PrintaTaxa:	
	blez $t5, backFromMenuPreco
	rem $s0, $t1, 10						 	#$t4 = t0 mod 10 (é o dígito)
	div $t1, $t1, 10	
	jal decideDigitoTaxa
							#t0 = t0 div 10
backFromDecideDigitoTaxa:
	jal printacomDesloc
	subi $t5, $t5, 1
	j PrintaTaxa
	
decideDigitoTaxa:
	beq $s0, 0, printa0Taxa
	beq $s0, 1, printa1Taxa
	beq $s0, 2, printa2Taxa
	beq $s0, 3, printa3Taxa
	beq $s0, 4, printa4Taxa
	beq $s0, 5, printa5Taxa
	beq $s0, 6, printa6Taxa
	beq $s0, 7, printa7Taxa
	beq $s0, 8, printa8Taxa
	beq $s0, 9, printa9Taxa
	j backFromDecideDigitoTaxa
	
printa0Taxa:
	jal Digito0Taxa
	j backFromDecideDigitoTaxa

printa1Taxa:
	jal Digito1Taxa
	j backFromDecideDigitoTaxa

printa2Taxa:
	jal Digito2Taxa
	j backFromDecideDigitoTaxa

printa3Taxa:	
	jal Digito3Taxa
	j backFromDecideDigitoTaxa

printa4Taxa:
	jal Digito4Taxa
	j backFromDecideDigitoTaxa

printa5Taxa:
	jal Digito5Taxa
	j backFromDecideDigitoTaxa

printa6Taxa:
	jal Digito6Taxa
	j backFromDecideDigitoTaxa

printa7Taxa:
	jal Digito7Taxa
	j backFromDecideDigitoTaxa

printa8Taxa:
	jal Digito8Taxa
	j backFromDecideDigitoTaxa

printa9Taxa:
	jal Digito9Taxa
	j backFromDecideDigitoTaxa
	
PrintaDigitoM:
	div $t1, $t1, 1000000							#t0 = t0 div 10
	jal backFromDecideDigitoTaxa

####################################################################################################################################
CappaVegas: 
	jal defineFundoCappaVegas
	jal fundoVegas
	jal CappaMagico
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	
	jal DadoApaga
	
	addi $10, $10, 120
	
	jal DadoApaga
	jal PtoInterrog
	jal CappaVegasLogo
	
	li $a1, Cte7			#Valor Maximo para o syscall é 6 (dado de jogar mesmo)
	
	li $v0, 42			#gera um valor entre 1 e 6, está em $a0
	syscall
	
	move $s3, $a0 			#Salvando a0 em s3
	
	
	beqz $s3, Muda1
	
backFromMuda1:	
	lw $t6, ($t7)			#Leitura do teclado
	andi $t6, $t6, 0x0001
	beq $t6, $0, backFromMuda1
	
	lw $v0, 4($t7)			#Chegando a Tecla pressionada
	lbu $a0, 0xffff0004
	move $t9, $a0
	
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	
	beq $t9, 101, ExitVegas	#e = EXIT
	beq $t9, 49, PrintaNumero1DadoE
	beq $t9, 50, PrintaNumero2DadoE			
	beq $t9, 51, PrintaNumero3DadoE
	beq $t9, 52, PrintaNumero4DadoE
	beq $t9, 53, PrintaNumero5DadoE
	beq $t9, 54, PrintaNumero6DadoE
	j backFromMuda1

backFromDadoE:
	## DELAY DE 2s ##
	li $a0, 2000
	li $v0, 32
	syscall
	
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	addi $10, $10, 120 	###############
	
	jal DadoApaga
	
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	addi $10, $10, 120 	###############
	
	beq $s3, 1, PrintaNumero1DadoD
	beq $s3, 2, PrintaNumero2DadoD
	beq $s3, 3, PrintaNumero3DadoD
	beq $s3, 4, PrintaNumero4DadoD
	beq $s3, 5, PrintaNumero5DadoD
	beq $s3, 6, PrintaNumero6DadoD
	
backFromDadoD:	
	beq $t9, $s3, YouWin
	j YouLose
	
Muda1: 
	li $s3, 1	
	j backFromMuda1

PrintaNumero1DadoE:
	jal Dado1
	li $t9, Cte1
	j backFromDadoE

PrintaNumero2DadoE:
	jal Dado2
	li $t9, Cte2
	j backFromDadoE

PrintaNumero3DadoE:
	jal Dado3
	li $t9, Cte3
	j backFromDadoE

PrintaNumero4DadoE:
	jal Dado4
	li $t9, Cte4
	j backFromDadoE

PrintaNumero5DadoE:
	jal Dado5
	li $t9, Cte5
	j backFromDadoE

PrintaNumero6DadoE:
	jal Dado6
	li $t9, Cte6
	j backFromDadoE
	
PrintaNumero1DadoD:
	jal Dado1
	j backFromDadoD

PrintaNumero2DadoD:
	jal Dado2
	j backFromDadoD

PrintaNumero3DadoD:
	jal Dado3
	j backFromDadoD

PrintaNumero4DadoD:
	jal Dado4
	j backFromDadoD

PrintaNumero5DadoD:
	jal Dado5
	j backFromDadoD

PrintaNumero6DadoD:
	jal Dado6
	j backFromDadoD

YouWin:
	#### PRINTA MSG COM JAL #####
	bge $t0, 333333333, FimDeJogo	 	#Pq se multiplicar por 6, vai passar o limite
	
	mul $t0, $t0, 6			#ATUALIZA CONTADOR
	jal YouGanhou
	#### DELAY ####
	li $a0, 5000
	li $v0, 32
	syscall
	jal defineFundo
	jal fundo
	jal LogoCentralizado
	j AtualizaDesenho
	j DecideMenu

	#### volta pro laço ####
	
YouLose:
	#### PRINTA MSG COM JAL #####
	sub $t0, $t0, $t0
	jal YouPerdeu
	#### DELAY ####
	li $a0, 5000
	li $v0, 32
	syscall
	jal defineFundo
	jal fundo
	jal LogoCentralizado
	j AtualizaDesenho
	j DecideMenu

	#### volta pro laço #####	
	
ExitVegas:
	jal defineFundo
	jal fundo
	jal LogoCentralizado
	j AtualizaDesenho
	j DecideMenu
####################################################################################################################################
MenuTaxas: 
	jal defineFundo
	jal fundo
	jal Sergio
	jal MenuTaxa
	
backFromMenuTaxa:
	lw $t6, ($t7)			#Leitura do teclado
	andi $t6, $t6, 0x0001
	beq $t6, $0, backFromMenuTaxa	
	lw $v0, 4($t7)			#Chegando a Tecla pressionada
	lbu $a0, 0xffff0004
	move $s7, $a0
	beq $s7, 101, ExitVegas		#Pressione E para sair
	j backFromMenuTaxa 
####################################################################################################################################
CappaTruco:
	jal defineFundoCappaVegas
	jal fundoVegas
	jal CappaMagico
	jal LogoCappaTruco
	jal TrucoMenu
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	
	jal SlotCarta2
	addi $10, $10, -120			##############################################################
	jal SlotCarta2
	
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	jal FundoCarta
	addi $10, $10, -120
	jal FundoCarta
	
	#Gera valor aleatorio para a carta1, vai estar em a0
	li $a1, 13
	li $v0, 42
	syscall
	addi $a0, $a0, 1	#Pro zero nao ser uma opção
	move $s1, $a0		#s1 é o numero da carta1
	
	li $a1, 2
	li $v0, 42
	syscall
	move $s4, $a0		#s4 é o naipe da carta1. Preto = 1, Vermelho = 0
	
	#Gera valor aleatorio para a carta 2, vai estar em a0
	li $a1, 13
	li $v0, 42
	syscall
	addi $a0, $a0, 1	#Pro zero nao ser uma opcao
	move $s5, $a0		#s5 é o numero da carta2
	
	
	li $a1, 2
	li $v0, 42
	syscall
	move $s6, $a0		#s6 é o naipe da carta2. Preto = 1, Vermelho = 0
	
	
ChecaEscolhaCarta:
	lw $t6, ($t7)				#Leitura do teclado
	andi $t6, $t6, 0x0001
	beq $t6, $0, ChecaEscolhaCarta
	
	lw $v0, 4($t7)				#Chegando a Tecla pressionada
	lbu $a0, 0xffff0004
	move $t9, $a0				#Está em $t9

	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	beq $t9, 101, ExitVegas	#e = EXIT
	beq $t9, 49, CartaEscolhida1	
	beq $t9, 50, CartaEscolhida2
	j ChecaEscolhaCarta		#Nao foi um comando valido, volta pro menu principal

CartaEscolhida1:
	addi $10, $10, -120
	jal Retangulo
	bgt $s1, $s5, YouWinTruco		#Ganhou
	beq $s1, $s5, ComparaIgualdade1		#Empate: Temos q checar a cor
	j YouLoseTruco
	
CartaEscolhida2:
	jal Retangulo
	bgt $s5, $s1, YouWinTruco
	beq $s5, $s1, ComparaIgualdade2
	j YouLoseTruco	
	
YouWinTruco:
	jal YouGanhou
	bge $t0, 1000000000, FimDeJogo
	mul $t0, $t0, 2
	j DesenhaCartas
	
YouLoseTruco:
	jal YouPerdeu
	sub $t0, $t0, $t0
	j DesenhaCartas
	
YouTieTruco:
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	jal TieMessage
	j DesenhaCartas

ComparaIgualdade1:
	bgt $s4, $s6, YouWinTruco
	beq $s4, $s6, YouTieTruco
	j YouLoseTruco
	
ComparaIgualdade2:
	bgt $s6, $s4, YouWinTruco
	beq $s4, $s6, YouTieTruco
	j YouLoseTruco
	
DesenhaCartas:
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	jal FormatoCarta
	addi $10, $10, -120
	jal FormatoCarta
	j DesenhaCartaE

backFromDesenhaCartaE:
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	move $s1, $s5
	move $s4, $s6
	j DesenhaCartaD

backFromDesenhaCartaD:
	li $a0, 5000
	li $v0, 32
	syscall
	j ExitVegas

DesenhaCartaE:
	beq $s1, 1, PrintaCarta1E
	beq $s1, 2, PrintaCarta2E
	beq $s1, 3, PrintaCarta3E
	beq $s1, 4, PrintaCarta4E
	beq $s1, 5, PrintaCarta5E
	beq $s1, 6, PrintaCarta6E
	beq $s1, 7, PrintaCarta7E
	beq $s1, 8, PrintaCarta8E
	beq $s1, 9, PrintaCarta9E
	beq $s1, 10, PrintaCarta10E
	beq $s1, 11, PrintaCarta11E
	beq $s1, 12, PrintaCarta12E
	beq $s1, 13, PrintaCarta13E
	
PrintaCarta1E:
	beq $s4, 0, ehCarta1VermelhaE
	beq $s4, 1, ehCarta1PretaE

PrintaCarta2E:
	beq $s4, 0, ehCarta2VermelhaE
	beq $s4, 1, ehCarta2PretaE

PrintaCarta3E:
	beq $s4, 0, ehCarta3VermelhaE
	beq $s4, 1, ehCarta3PretaE

PrintaCarta4E:
	beq $s4, 0, ehCarta4VermelhaE
	beq $s4, 1, ehCarta4PretaE

PrintaCarta5E:
	beq $s4, 0, ehCarta5VermelhaE
	beq $s4, 1, ehCarta5PretaE

PrintaCarta6E:
	beq $s4, 0, ehCarta6VermelhaE
	beq $s4, 1, ehCarta6PretaE

PrintaCarta7E:
	beq $s4, 0, ehCarta7VermelhaE
	beq $s4, 1, ehCarta7PretaE

PrintaCarta8E:
	beq $s4, 0, ehCarta8VermelhaE
	beq $s4, 1, ehCarta8PretaE

PrintaCarta9E:
	beq $s4, 0, ehCarta9VermelhaE
	beq $s4, 1, ehCarta9PretaE

PrintaCarta10E:
	beq $s4, 0, ehCarta10VermelhaE
	beq $s4, 1, ehCarta10PretaE

PrintaCarta11E:
	beq $s4, 0, ehCarta11VermelhaE
	beq $s4, 1, ehCarta11PretaE

PrintaCarta12E:
	beq $s4, 0, ehCarta12VermelhaE
	beq $s4, 1, ehCarta12PretaE

PrintaCarta13E:
	beq $s4, 0, ehCarta13VermelhaE
	beq $s4, 1, ehCarta13PretaE

	
ehCarta1VermelhaE:
	addi $29, $0, 0xFF0000
	jal CartaA
	j backFromDesenhaCartaE
	
ehCarta2VermelhaE:
	addi $29, $0, 0xFF0000
	jal Carta2
	j backFromDesenhaCartaE
	
ehCarta3VermelhaE:
	addi $29, $0, 0xFF0000
	jal Carta3
	j backFromDesenhaCartaE

ehCarta4VermelhaE:
	addi $29, $0, 0xFF0000
	jal Carta4
	j backFromDesenhaCartaE

ehCarta5VermelhaE:
	addi $29, $0, 0xFF0000
	jal Carta5
	j backFromDesenhaCartaE

ehCarta6VermelhaE:
	addi $29, $0, 0xFF0000
	jal Carta6
	j backFromDesenhaCartaE

ehCarta7VermelhaE:
	addi $29, $0, 0xFF0000
	jal Carta7
	j backFromDesenhaCartaE

ehCarta8VermelhaE:
	addi $29, $0, 0xFF0000
	jal Carta8
	j backFromDesenhaCartaE

ehCarta9VermelhaE:
	addi $29, $0, 0xFF0000
	jal Carta9
	j backFromDesenhaCartaE

ehCarta10VermelhaE:
	addi $29, $0, 0xFF0000
	jal Carta10
	j backFromDesenhaCartaE

ehCarta11VermelhaE:
	addi $29, $0, 0xFF0000
	jal CartaJ
	j backFromDesenhaCartaE

ehCarta12VermelhaE:
	addi $29, $0, 0xFF0000
	jal CartaQ
	j backFromDesenhaCartaE

ehCarta13VermelhaE:
	addi $29, $0, 0xFF0000
	jal CartaK
	j backFromDesenhaCartaE

ehCarta1PretaE:
	addi $29, $0, 0x00000
	jal CartaA
	j backFromDesenhaCartaE

ehCarta2PretaE:
	addi $29, $0, 0x00000
	jal Carta2
	j backFromDesenhaCartaE

ehCarta3PretaE:
	addi $29, $0, 0x00000
	jal Carta3
	j backFromDesenhaCartaE

ehCarta4PretaE:
	addi $29, $0, 0x00000
	jal Carta4
	j backFromDesenhaCartaE

ehCarta5PretaE:
	addi $29, $0, 0x00000
	jal Carta5
	j backFromDesenhaCartaE

ehCarta6PretaE:
	addi $29, $0, 0x00000
	jal Carta6
	j backFromDesenhaCartaE

ehCarta7PretaE:
	addi $29, $0, 0x00000
	jal Carta7
	j backFromDesenhaCartaE

ehCarta8PretaE:
	addi $29, $0, 0x00000
	jal Carta8
	j backFromDesenhaCartaE

ehCarta9PretaE:
	addi $29, $0, 0x00000
	jal Carta9
	j backFromDesenhaCartaE

ehCarta10PretaE:
	addi $29, $0, 0x00000
	jal Carta10
	j backFromDesenhaCartaE

ehCarta11PretaE:
	addi $29, $0, 0x00000
	jal CartaJ
	j backFromDesenhaCartaE

ehCarta12PretaE:
	addi $29, $0, 0x00000
	jal CartaQ
	j backFromDesenhaCartaE

ehCarta13PretaE:
	addi $29, $0, 0x00000
	jal CartaK
	j backFromDesenhaCartaE

DesenhaCartaD:
	beq $s1, 1, PrintaCarta1D
	beq $s1, 2, PrintaCarta2D
	beq $s1, 3, PrintaCarta3D
	beq $s1, 4, PrintaCarta4D
	beq $s1, 5, PrintaCarta5D
	beq $s1, 6, PrintaCarta6D
	beq $s1, 7, PrintaCarta7D
	beq $s1, 8, PrintaCarta8D
	beq $s1, 9, PrintaCarta9D
	beq $s1, 10, PrintaCarta10D
	beq $s1, 11, PrintaCarta11D
	beq $s1, 12, PrintaCarta12D
	beq $s1, 13, PrintaCarta13D
	
PrintaCarta1D:
	beq $s4, 0, ehCarta1VermelhaD
	beq $s4, 1, ehCarta1PretaD

PrintaCarta2D:
	beq $s4, 0, ehCarta2VermelhaD
	beq $s4, 1, ehCarta2PretaD

PrintaCarta3D:
	beq $s4, 0, ehCarta3VermelhaD
	beq $s4, 1, ehCarta3PretaD

PrintaCarta4D:
	beq $s4, 0, ehCarta4VermelhaD
	beq $s4, 1, ehCarta4PretaD

PrintaCarta5D:
	beq $s4, 0, ehCarta5VermelhaD
	beq $s4, 1, ehCarta5PretaD

PrintaCarta6D:
	beq $s4, 0, ehCarta6VermelhaD
	beq $s4, 1, ehCarta6PretaD

PrintaCarta7D:
	beq $s4, 0, ehCarta7VermelhaD
	beq $s4, 1, ehCarta7PretaD

PrintaCarta8D:
	beq $s4, 0, ehCarta8VermelhaD
	beq $s4, 1, ehCarta8PretaD

PrintaCarta9D:
	beq $s4, 0, ehCarta9VermelhaD
	beq $s4, 1, ehCarta9PretaD

PrintaCarta10D:
	beq $s4, 0, ehCarta10VermelhaD
	beq $s4, 1, ehCarta10PretaD

PrintaCarta11D:
	beq $s4, 0, ehCarta11VermelhaD
	beq $s4, 1, ehCarta11PretaD

PrintaCarta12D:
	beq $s4, 0, ehCarta12VermelhaD
	beq $s4, 1, ehCarta12PretaD

PrintaCarta13D:
	beq $s4, 0, ehCarta13VermelhaD
	beq $s4, 1, ehCarta13PretaD

	
ehCarta1VermelhaD:
	addi $29, $0, 0xFF0000
	jal CartaA
	j backFromDesenhaCartaD
	
ehCarta2VermelhaD:
	addi $29, $0, 0xFF0000
	jal Carta2
	j backFromDesenhaCartaD
	
ehCarta3VermelhaD:
	addi $29, $0, 0xFF0000
	jal Carta3
	j backFromDesenhaCartaD

ehCarta4VermelhaD:
	addi $29, $0, 0xFF0000
	jal Carta4
	j backFromDesenhaCartaD

ehCarta5VermelhaD:
	addi $29, $0, 0xFF0000
	jal Carta5
	j backFromDesenhaCartaD

ehCarta6VermelhaD:
	addi $29, $0, 0xFF0000
	jal Carta6
	j backFromDesenhaCartaD

ehCarta7VermelhaD:
	addi $29, $0, 0xFF0000
	jal Carta7
	j backFromDesenhaCartaD

ehCarta8VermelhaD:
	addi $29, $0, 0xFF0000
	jal Carta8
	j backFromDesenhaCartaD

ehCarta9VermelhaD:
	addi $29, $0, 0xFF0000
	jal Carta9
	j backFromDesenhaCartaD

ehCarta10VermelhaD:
	addi $29, $0, 0xFF0000
	jal Carta10
	j backFromDesenhaCartaD

ehCarta11VermelhaD:
	addi $29, $0, 0xFF0000
	jal CartaJ
	j backFromDesenhaCartaD

ehCarta12VermelhaD:
	addi $29, $0, 0xFF0000
	jal CartaQ
	j backFromDesenhaCartaD

ehCarta13VermelhaD:
	addi $29, $0, 0xFF0000
	jal CartaK
	j backFromDesenhaCartaD

ehCarta1PretaD:
	addi $29, $0, 0x00000
	jal CartaA
	j backFromDesenhaCartaD

ehCarta2PretaD:
	addi $29, $0, 0x00000
	jal Carta2
	j backFromDesenhaCartaD

ehCarta3PretaD:
	addi $29, $0, 0x00000
	jal Carta3
	j backFromDesenhaCartaD

ehCarta4PretaD:
	addi $29, $0, 0x00000
	jal Carta4
	j backFromDesenhaCartaD

ehCarta5PretaD:
	addi $29, $0, 0x00000
	jal Carta5
	j backFromDesenhaCartaD

ehCarta6PretaD:
	addi $29, $0, 0x00000
	jal Carta6
	j backFromDesenhaCartaD

ehCarta7PretaD:
	addi $29, $0, 0x00000
	jal Carta7
	j backFromDesenhaCartaD

ehCarta8PretaD:
	addi $29, $0, 0x00000
	jal Carta8
	j backFromDesenhaCartaD

ehCarta9PretaD:
	addi $29, $0, 0x00000
	jal Carta9
	j backFromDesenhaCartaD

ehCarta10PretaD:
	addi $29, $0, 0x00000
	jal Carta10
	j backFromDesenhaCartaD

ehCarta11PretaD:
	addi $29, $0, 0x00000
	jal CartaJ
	j backFromDesenhaCartaD

ehCarta12PretaD:
	addi $29, $0, 0x00000
	jal CartaQ
	j backFromDesenhaCartaD

ehCarta13PretaD:
	addi $29, $0, 0x00000
	jal CartaK
	j backFromDesenhaCartaD

####################################################################################################################################
CappaJanken:
	jal defineFundoCappaVegas
	jal fundoVegas
	jal SlotMenu
	jal MenuCappaJanken

	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	jal LogoCappaJanken
	
	jal DadoApaga
	addi $10, $10, 120			##############################################################
	jal DadoApaga
	
	#Gera valor aleatorio entre 0 e 2, que representa a escolha da CPU
	li $a1, 3				
	li $v0, 42
	syscall
	addi $a0, $a0, 1
	move $s6, $a0	

	#1: Pedra
	#2: Tesoura
	#3: Papel
		
ChecaEscolhaJanken:
	lw $t6, ($t7)				#Leitura do teclado
	andi $t6, $t6, 0x0001
	beq $t6, $0, ChecaEscolhaJanken
	
	lw $v0, 4($t7)				#Chegando a Tecla pressionada
	lbu $a0, 0xffff0004
	move $t9, $a0				#Está em $t9
	
	beq $t9, 114, DesenhaAdversario			#Digitou r => Rock
	beq $t9, 116, DesenhaAdversario			#Digitou t => Tesoura
	beq $t9, 112, DesenhaAdversario			#Digitou p => Paper
	beq $t9, 101, ExitVegas
	j ChecaEscolhaJanken
	
DesenhaAdversario:
	beq $s6, 1, DesenhaPedraAdversaria
	beq $s6, 2, DesenhaTesouraAdversaria
	beq $s6, 3, DesenhaPapelAdversaria
	
backFromDesenhaAdversario:
	addi $10, $10, 120
	beq $t9, 114, Pedra			#Digitou r => Rock
	beq $t9, 116, Tesoura			#Digitou t => Tesoura
	beq $t9, 112, Papel			#Digitou p => Paper
	beq $t9, 101, ExitVegas

	
Pedra:	
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	jal DesenhaPedra
	beq $s6, 1, Draw
	beq $s6, 2, Win
	beq $s6, 3, Loss
	
Tesoura:
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	jal DesenhaTesoura
	beq $s6, 1, Loss
	beq $s6, 2, Draw
	beq $s6, 3, Win
	
Papel:
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001
	jal DesenhaPapel
	beq $s6, 1, Win
	beq $s6, 2, Loss
	beq $s6, 3, Draw
	
DesenhaPedraAdversaria:
	jal DesenhaPedra
	j backFromDesenhaAdversario
	
DesenhaTesouraAdversaria:
	jal DesenhaTesoura
	j backFromDesenhaAdversario
	
DesenhaPapelAdversaria:
	jal DesenhaPapel
	j backFromDesenhaAdversario
	
Win:
	jal YouGanhou
	
	bge $t0, 1000000000, FimDeJogo
	
	mul $t0, $t0, 2
	li $a0, 5000
	li $v0, 32
	syscall
	j ExitVegas
	
Loss:
	jal YouPerdeu
	sub $t0, $t0, $t0
	li $a0, 5000
	li $v0, 32
	syscall
	j ExitVegas
	
Draw:
	jal TieMessage
	li $a0, 5000
	li $v0, 32
	syscall
	j ExitVegas

####################################################################################################################################
DecideMenu:
	beq $v1, 0, OpcaoMenu0
	beq $v1, 1, OpcaoMenu1
	beq $v1, 2, OpcaoMenu2
	beq $v1, 3, OpcaoMenu3
	beq $v1, 4, OpcaoMenu4
	beq $v1, 5, OpcaoMenu5
	beq $v1, 6, OpcaoMenu6
	beq $v1, 7, OpcaoMenu7
	beq $v1, 8, OpcaoMenu8
	beq $v1, 9, OpcaoMenu9
	j LacoPrincipal
	
OpcaoMenu0:
	bge $t0, Preco1, PrintaMenu1
	bge $t0, Preco0, PrintaMenu0
	jal MenuTudoPreto
	j LacoPrincipal
	
OpcaoMenu1:
	bge $t0, Preco2, PrintaMenu2
	bge $t0, Preco1, PrintaMenu1
	bge $t0, Preco0, PrintaMenu0
	jal MenuTudoPreto
	j LacoPrincipal

OpcaoMenu2:
	bge $t0, Preco3, PrintaMenu3
	bge $t0, Preco2, PrintaMenu2
	bge $t0, Preco1, PrintaMenu1
	bge $t0, Preco0, PrintaMenu0
	jal MenuTudoPreto
	j LacoPrincipal

OpcaoMenu3:
	bge $t0, Preco4, PrintaMenu4
	bge $t0, Preco3, PrintaMenu3
	bge $t0, Preco2, PrintaMenu2
	bge $t0, Preco1, PrintaMenu1
	bge $t0, Preco0, PrintaMenu0
	jal MenuTudoPreto
	j LacoPrincipal

OpcaoMenu4:
	bge $t0, Preco5, PrintaMenu5
	bge $t0, Preco4, PrintaMenu4
	bge $t0, Preco3, PrintaMenu3
	bge $t0, Preco2, PrintaMenu2
	bge $t0, Preco1, PrintaMenu1
	bge $t0, Preco0, PrintaMenu0
	jal MenuTudoPreto
	j LacoPrincipal

OpcaoMenu5:
	bge $t0, Preco6, PrintaMenu6
	bge $t0, Preco5, PrintaMenu5
	bge $t0, Preco4, PrintaMenu4
	bge $t0, Preco3, PrintaMenu3
	bge $t0, Preco2, PrintaMenu2
	bge $t0, Preco1, PrintaMenu1
	bge $t0, Preco0, PrintaMenu0
	jal MenuTudoPreto
	j LacoPrincipal

OpcaoMenu6:
	bge $t0, Preco7, PrintaMenu7
	bge $t0, Preco6, PrintaMenu6
	bge $t0, Preco5, PrintaMenu5
	bge $t0, Preco4, PrintaMenu4
	bge $t0, Preco3, PrintaMenu3
	bge $t0, Preco2, PrintaMenu2
	bge $t0, Preco1, PrintaMenu1
	bge $t0, Preco0, PrintaMenu0
	jal MenuTudoPreto
	j LacoPrincipal

OpcaoMenu7:
	bge $t0, Preco8, PrintaMenu8
	bge $t0, Preco7, PrintaMenu7
	bge $t0, Preco6, PrintaMenu6
	bge $t0, Preco5, PrintaMenu5
	bge $t0, Preco4, PrintaMenu4
	bge $t0, Preco3, PrintaMenu3
	bge $t0, Preco2, PrintaMenu2
	bge $t0, Preco1, PrintaMenu1
	bge $t0, Preco0, PrintaMenu0
	jal MenuTudoPreto
	j LacoPrincipal

OpcaoMenu8: 
	bge $t0, Preco9, PrintaMenu9	
	bge $t0, Preco8, PrintaMenu8
	bge $t0, Preco7, PrintaMenu7
	bge $t0, Preco6, PrintaMenu6
	bge $t0, Preco5, PrintaMenu5
	bge $t0, Preco4, PrintaMenu4
	bge $t0, Preco3, PrintaMenu3
	bge $t0, Preco2, PrintaMenu2
	bge $t0, Preco1, PrintaMenu1
	bge $t0, Preco0, PrintaMenu0
	jal MenuTudoPreto
	j LacoPrincipal

OpcaoMenu9:
	bge $t0, Preco9, PrintaMenu9	
	bge $t0, Preco8, PrintaMenu8
	bge $t0, Preco7, PrintaMenu7
	bge $t0, Preco6, PrintaMenu6
	bge $t0, Preco5, PrintaMenu5
	bge $t0, Preco4, PrintaMenu4
	bge $t0, Preco2, PrintaMenu2
	bge $t0, Preco1, PrintaMenu1
	bge $t0, Preco0, PrintaMenu0
	jal MenuTudoPreto
	j LacoPrincipal
	
PrintaMenu0:
	jal Menu0
	j LacoPrincipal

PrintaMenu1:
	jal Menu1
	j LacoPrincipal

PrintaMenu2:
	jal Menu2
	j LacoPrincipal

PrintaMenu3:
	jal Menu3
	j LacoPrincipal

PrintaMenu4:
	jal Menu4
	j LacoPrincipal

PrintaMenu5:
	jal Menu5
	j LacoPrincipal

PrintaMenu6:
	jal Menu6
	j LacoPrincipal

PrintaMenu7:
	jal Menu7
	j LacoPrincipal

PrintaMenu8:
	jal Menu8
	j LacoPrincipal

PrintaMenu9:
	jal Menu9
	j LacoPrincipal
###################################################################################################################################
PrintaNumero:
	blez $t5, backFromPrintaNumero
	rem $s0, $t1, 10						 	#$t4 = t0 mod 10 (é o dígito)
	div $t1, $t1, 10							#t0 = t0 div 10
	jal decideDigito
	jal printacomDesloc
	subi $t5, $t5, 1
	j PrintaNumero
	
defineFundo:
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001		#Marca inicio da tela
	jr $31 

fundo:
	beq $9, $0, defineFundo
	addi $29, $0, 0x6495ed
	sw $29, 0($10)		#exibe pontos da cor salva no registrador
	addi $10, $10, 4	#para ai para os próximos pixels
	addi $9, $9, -1		#para controlar o final
	j fundo
	
defineFundoCappaVegas:
	addi $9, $0, 8192	#qtd de pixels na tela (512x256)/16  pq cada bloquinho é 4x4
	add $10, $0, $9		#Salvando o "backup"
	lui $10, 0x1001		#Marca inicio da tela
	jr $31 

fundoVegas:
	beq $9, $0, defineFundoCappaVegas
	addi $29, $0, 0xFF0000
	sw $29, 0($10)		#exibe pontos da cor salva no registrador
	addi $10, $10, 4	#para ai para os próximos pixels
	addi $9, $9, -1		#para controlar o final
	j fundoVegas
	
decideDigito:
	beq $s0, 0, printa0
	beq $s0, 1, printa1
	beq $s0, 2, printa2
	beq $s0, 3, printa3
	beq $s0, 4, printa4
	beq $s0, 5, printa5
	beq $s0, 6, printa6
	beq $s0, 7, printa7
	beq $s0, 8, printa8
	beq $s0, 9, printa9
	jr $31
	
printa0:
	addi $29, $0, 0xffffff
	sw $29, 27956($10)
	sw $29, 27960($10)
	sw $29, 27964($10)
	sw $29, 27968($10)
	sw $29, 28480($10)
	sw $29, 28992($10)
	sw $29, 29504($10)
	sw $29, 30016($10)
	sw $29, 30528($10)
	sw $29, 31040($10)
	sw $29, 31036($10)
	sw $29, 31032($10)
	sw $29, 31028($10)
	sw $29, 30516($10)
	sw $29, 30004($10)
	sw $29, 29492($10)
	sw $29, 28980($10)
	sw $29, 28468($10)
	jr $31
	
printa1:
	addi $29, $0, 0xffffff
	sw $29, 27968($10)
	sw $29, 28480($10)
	sw $29, 28992($10)
	sw $29, 29504($10)
	sw $29, 30016($10)
	sw $29, 30528($10)
	sw $29, 31040($10)
	jr $31
		
printa2:
	addi $29, $0, 0xffffff
	sw $29, 27956($10)
	sw $29, 27960($10)
	sw $29, 27964($10)
	sw $29, 27968($10)
	sw $29, 28480($10)
	sw $29, 28992($10)
	sw $29, 29504($10)
	sw $29, 29500($10)
	sw $29, 29496($10)
	sw $29, 31028($10)
	sw $29, 30516($10)
	sw $29, 30004($10)
	sw $29, 29492($10)
	sw $29, 31040($10)
	sw $29, 31036($10)
	sw $29, 31032($10)
	jr $31
	
printa3:
	addi $29, $0, 0xffffff
	sw $29, 27956($10)
	sw $29, 27960($10)
	sw $29, 27964($10)
	sw $29, 27968($10)
	sw $29, 28480($10)
	sw $29, 28992($10)
	sw $29, 29504($10)
	sw $29, 29500($10)
	sw $29, 29496($10)
	sw $29, 31028($10)
	sw $29, 29492($10)
	sw $29, 31040($10)
	sw $29, 31036($10)
	sw $29, 31032($10)
	sw $29, 30016($10)
	sw $29, 30528($10)
	jr $31

printa4:
	addi $29, $0, 0xffffff
	sw $29, 27956($10)
	sw $29, 27968($10)
	sw $29, 28480($10)
	sw $29, 28992($10)
	sw $29, 29504($10)
	sw $29, 30016($10)
	sw $29, 30528($10)
	sw $29, 31040($10)
	sw $29, 29492($10)
	sw $29, 28980($10)
	sw $29, 28468($10)
	sw $29, 29496($10)
	sw $29, 29500($10)
	jr $31

printa5:
	addi $29, $0, 0xffffff
	sw $29, 27956($10)
	sw $29, 27960($10)
	sw $29, 27964($10)
	sw $29, 27968($10)
	sw $29, 29504($10)
	sw $29, 30016($10)
	sw $29, 30528($10)
	sw $29, 31040($10)
	sw $29, 31036($10)
	sw $29, 31032($10)
	sw $29, 31028($10)
	sw $29, 29492($10)
	sw $29, 28980($10)
	sw $29, 28468($10)
	sw $29, 29496($10)
	sw $29, 29500($10)
	jr $31

printa6:
	addi $29, $0, 0xffffff
	sw $29, 27956($10)
	sw $29, 27960($10)
	sw $29, 27964($10)
	sw $29, 27968($10)
	sw $29, 29504($10)
	sw $29, 30016($10)
	sw $29, 30528($10)
	sw $29, 31040($10)
	sw $29, 31036($10)
	sw $29, 31032($10)
	sw $29, 31028($10)
	sw $29, 30516($10)
	sw $29, 30004($10)
	sw $29, 29492($10)
	sw $29, 28980($10)
	sw $29, 28468($10)
	sw $29, 29496($10)
	sw $29, 29500($10)
	jr $31

printa7: 
	addi $29, $0, 0xffffff
	sw $29, 27956($10)
	sw $29, 27960($10)
	sw $29, 27964($10)
	sw $29, 27968($10)
	sw $29, 28480($10)
	sw $29, 28992($10)
	sw $29, 29504($10)
	sw $29, 30016($10)
	sw $29, 30528($10)
	sw $29, 31040($10)
	jr $31

printa8:
	addi $29, $0, 0xffffff
	sw $29, 27956($10)
	sw $29, 27960($10)
	sw $29, 27964($10)
	sw $29, 27968($10)
	sw $29, 28480($10)
	sw $29, 28992($10)
	sw $29, 29504($10)
	sw $29, 30016($10)
	sw $29, 30528($10)
	sw $29, 31040($10)
	sw $29, 31036($10)
	sw $29, 31032($10)
	sw $29, 31028($10)
	sw $29, 30516($10)
	sw $29, 30004($10)
	sw $29, 29492($10)
	sw $29, 28980($10)
	sw $29, 28468($10)
	sw $29, 29496($10)
	sw $29, 29500($10)
	jr $31

printa9: 
	addi $29, $0, 0xffffff
	sw $29, 27956($10)
	sw $29, 27960($10)
	sw $29, 27964($10)
	sw $29, 27968($10)
	sw $29, 28480($10)
	sw $29, 28992($10)
	sw $29, 29504($10)
	sw $29, 30016($10)
	sw $29, 30528($10)
	sw $29, 31040($10)
	sw $29, 29492($10)
	sw $29, 28980($10)
	sw $29, 28468($10)
	sw $29, 29496($10)
	sw $29, 29500($10)
	jr $31	

printacomDesloc:
	addi $10, $10, -20
	jr $31

apagaNumeros:
	addi $29, $0, 0x6495ed
	sw $29, 28976($10)
	sw $29, 29824($10)
	sw $29, 27888($10)
	sw $29, 28856($10)
	sw $29, 29944($10)
	sw $29, 30380($10)
	sw $29, 29828($10)
	sw $29, 29948($10)
	sw $29, 27880($10)
	sw $29, 28296($10)
	sw $29, 29384($10)
	sw $29, 30388($10)
	sw $29, 28972($10)
	sw $29, 27884($10)
	sw $29, 28852($10)
	sw $29, 29940($10)
	sw $29, 29388($10)
	sw $29, 30384($10)
	sw $29, 30944($10)
	sw $29, 30940($10)
	sw $29, 28292($10)
	sw $29, 29380($10)
	sw $29, 30928($10)
	sw $29, 29956($10)
	sw $29, 28988($10)
	sw $29, 27896($10)
	sw $29, 28864($10)
	sw $29, 27776($10)
	sw $29, 29832($10)
	sw $29, 28868($10)
	sw $29, 29836($10)
	sw $29, 30376($10)
	sw $29, 28980($10)
	sw $29, 30012($10)
	sw $29, 30496($10)
	sw $29, 29396($10)
	sw $29, 29952($10)
	sw $29, 30372($10)
	sw $29, 28984($10)
	sw $29, 30492($10)
	sw $29, 27892($10)
	sw $29, 28860($10)
	sw $29, 30936($10)
	sw $29, 30016($10)
	sw $29, 29392($10)
	sw $29, 30932($10)
	sw $29, 29928($10)
	sw $29, 30916($10)
	sw $29, 28952($10)
	sw $29, 30480($10)
	sw $29, 27864($10)
	sw $29, 28832($10)
	sw $29, 29920($10)
	sw $29, 28956($10)
	sw $29, 27868($10)
	sw $29, 28836($10)
	sw $29, 29924($10)
	sw $29, 28396($10)
	sw $29, 29364($10)
	sw $29, 30364($10)
	sw $29, 29484($10)
	sw $29, 30004($10)
	sw $29, 30488($10)
	sw $29, 29368($10)
	sw $29, 30360($10)
	sw $29, 29488($10)
	sw $29, 30000($10)
	sw $29, 30484($10)
	sw $29, 27860($10)
	sw $29, 30924($10)
	sw $29, 28392($10)
	sw $29, 29360($10)
	sw $29, 30368($10)
	sw $29, 29480($10)
	sw $29, 30008($10)
	sw $29, 30920($10)
	sw $29, 30908($10)
	sw $29, 30904($10)
	sw $29, 27876($10)
	sw $29, 28844($10)
	sw $29, 29932($10)
	sw $29, 28964($10)
	sw $29, 28848($10)
	sw $29, 29936($10)
	sw $29, 28968($10)
	sw $29, 29376($10)
	sw $29, 29496($10)
	sw $29, 30356($10)
	sw $29, 30476($10)
	sw $29, 27872($10)
	sw $29, 28840($10)
	sw $29, 28288($10)
	sw $29, 30352($10)
	sw $29, 28960($10)
	sw $29, 30472($10)
	sw $29, 30912($10)
	sw $29, 29372($10)
	sw $29, 29492($10)
	sw $29, 29908($10)
	sw $29, 27964($10)
	sw $29, 28932($10)
	sw $29, 27844($10)
	sw $29, 28812($10)
	sw $29, 29900($10)
	sw $29, 29348($10)
	sw $29, 27968($10)
	sw $29, 28936($10)
	sw $29, 27848($10)
	sw $29, 28816($10)
	sw $29, 29904($10)
	sw $29, 29464($10)
	sw $29, 30464($10)
	sw $29, 28372($10)
	sw $29, 29340($10)
	sw $29, 30344($10)
	sw $29, 27960($10)
	sw $29, 29468($10)
	sw $29, 30460($10)
	sw $29, 27840($10)
	sw $29, 28376($10)
	sw $29, 29344($10)
	sw $29, 30340($10)
	sw $29, 30900($10)
	sw $29, 29460($10)
	sw $29, 30468($10)
	sw $29, 30348($10)
	sw $29, 28828($10)
	sw $29, 29912($10)
	sw $29, 28944($10)
	sw $29, 27852($10)
	sw $29, 28820($10)
	sw $29, 29916($10)
	sw $29, 28948($10)
	sw $29, 27856($10)
	sw $29, 28824($10)
	sw $29, 30452($10)
	sw $29, 29352($10)
	sw $29, 28384($10)
	sw $29, 29472($10)
	sw $29, 28940($10)
	sw $29, 29356($10)
	sw $29, 28388($10)
	sw $29, 29476($10)
	sw $29, 30336($10)
	sw $29, 30456($10)
	sw $29, 28380($10)
	sw $29, 27948($10)
	sw $29, 28916($10)
	sw $29, 27828($10)
	sw $29, 29328($10)
	sw $29, 27940($10)
	sw $29, 29448($10)
	sw $29, 27820($10)
	sw $29, 27944($10)
	sw $29, 28912($10)
	sw $29, 27824($10)
	sw $29, 28352($10)
	sw $29, 29320($10)
	sw $29, 29440($10)
	sw $29, 30444($10)
	sw $29, 28472($10)
	sw $29, 28356($10)
	sw $29, 29324($10)
	sw $29, 29444($10)
	sw $29, 30440($10)
	sw $29, 28476($10)
	sw $29, 30448($10)
	sw $29, 28808($10)
	sw $29, 28928($10)
	sw $29, 27832($10)
	sw $29, 28800($10)
	sw $29, 27952($10)
	sw $29, 28920($10)
	sw $29, 27836($10)
	sw $29, 28804($10)
	sw $29, 27956($10)
	sw $29, 28924($10)
	sw $29, 29332($10)
	sw $29, 28364($10)
	sw $29, 29452($10)
	sw $29, 30432($10)
	sw $29, 29336($10)
	sw $29, 28368($10)
	sw $29, 29456($10)
	sw $29, 28480($10)
	sw $29, 28360($10)
	sw $29, 30436($10)
	sw $29, 27928($10)
	sw $29, 27808($10)
	sw $29, 27920($10)
	sw $29, 29428($10)
	sw $29, 27800($10)
	sw $29, 28336($10)
	sw $29, 27924($10)
	sw $29, 27804($10)
	sw $29, 29420($10)
	sw $29, 30420($10)
	sw $29, 28452($10)
	sw $29, 29424($10)
	sw $29, 28456($10)
	sw $29, 28332($10)
	sw $29, 30428($10)
	sw $29, 30424($10)
	sw $29, 28908($10)
	sw $29, 27816($10)
	sw $29, 27932($10)
	sw $29, 28900($10)
	sw $29, 28468($10)
	sw $29, 29316($10)
	sw $29, 28348($10)
	sw $29, 29436($10)
	sw $29, 27936($10)
	sw $29, 28904($10)
	sw $29, 27812($10)
	sw $29, 30892($10)
	sw $29, 28460($10)
	sw $29, 28340($10)
	sw $29, 28464($10)
	sw $29, 29312($10)
	sw $29, 28344($10)
	sw $29, 29432($10)
	sw $29, 30416($10)
	sw $29, 30412($10)
	sw $29, 30896($10)
	sw $29, 27904($10)
	sw $29, 27908($10)
	sw $29, 28316($10)
	sw $29, 29404($10)
	sw $29, 29888($10)
	sw $29, 28436($10)
	sw $29, 27900($10)
	sw $29, 29408($10)
	sw $29, 29880($10)
	sw $29, 30400($10)
	sw $29, 30884($10)
	sw $29, 30520($10)
	sw $29, 28312($10)
	sw $29, 29400($10)
	sw $29, 29884($10)
	sw $29, 30880($10)
	sw $29, 28432($10)
	sw $29, 30408($10)
	sw $29, 30528($10)
	sw $29, 30404($10)
	sw $29, 30888($10)
	sw $29, 30524($10)
	sw $29, 27916($10)
	sw $29, 30508($10)
	sw $29, 28448($10)
	sw $29, 28328($10)
	sw $29, 29416($10)
	sw $29, 31040($10)
	sw $29, 27912($10)
	sw $29, 28440($10)
	sw $29, 30992($10)
	sw $29, 28320($10)
	sw $29, 29892($10)
	sw $29, 30872($10)
	sw $29, 28444($10)
	sw $29, 28324($10)
	sw $29, 29412($10)
	sw $29, 29896($10)
	sw $29, 30516($10)
	sw $29, 30512($10)
	sw $29, 30996($10)
	sw $29, 30876($10)
	sw $29, 29868($10)
	sw $29, 28416($10)
	sw $29, 29504($10)
	sw $29, 29988($10)
	sw $29, 29860($10)
	sw $29, 30860($10)
	sw $29, 31036($10)
	sw $29, 28892($10)
	sw $29, 29980($10)
	sw $29, 30980($10)
	sw $29, 29864($10)
	sw $29, 31032($10)
	sw $29, 28412($10)
	sw $29, 28896($10)
	sw $29, 29500($10)
	sw $29, 29984($10)
	sw $29, 30868($10)
	sw $29, 30504($10)
	sw $29, 30988($10)
	sw $29, 30864($10)
	sw $29, 30500($10)
	sw $29, 30984($10)
	sw $29, 28424($10)
	sw $29, 28304($10)
	sw $29, 29876($10)
	sw $29, 28428($10)
	sw $29, 28308($10)
	sw $29, 29992($10)
	sw $29, 31024($10)
	sw $29, 30972($10)
	sw $29, 29996($10)
	sw $29, 31020($10)
	sw $29, 28420($10)
	sw $29, 28300($10)
	sw $29, 29872($10)
	sw $29, 30856($10)
	sw $29, 30852($10)
	sw $29, 31028($10)
	sw $29, 30976($10)
	sw $29, 27788($10)
	sw $29, 29844($10)
	sw $29, 28876($10)
	sw $29, 29964($10)
	sw $29, 29848($10)
	sw $29, 29968($10)
	sw $29, 27780($10)
	sw $29, 31016($10)
	sw $29, 30960($10)
	sw $29, 27784($10)
	sw $29, 28992($10)
	sw $29, 29840($10)
	sw $29, 31012($10)
	sw $29, 28872($10)
	sw $29, 29960($10)
	sw $29, 30848($10)
	sw $29, 30968($10)
	sw $29, 30964($10)
	sw $29, 30948($10)
	sw $29, 28404($10)
	sw $29, 28888($10)
	sw $29, 29856($10)
	sw $29, 29976($10)
	sw $29, 30392($10)
	sw $29, 28408($10)
	sw $29, 28880($10)
	sw $29, 27792($10)
	sw $29, 31004($10)
	sw $29, 28400($10)
	sw $29, 28884($10)
	sw $29, 27796($10)
	sw $29, 29852($10)
	sw $29, 29972($10)
	sw $29, 30396($10)
	sw $29, 31000($10)
	sw $29, 30956($10)
	sw $29, 30952($10)
	sw $29, 31008($10)
	jr $31 

VerificaSaldo:
	sge $s2, $t0, $s1				#Verifica se o contador é maior ou igual ao preço
	beq $s2, Cte1, VerificaFase
	j PrintaSaldoInsuficiente			#COLOCAR MSG TEM QUE TER RETURN PRO LACO
		
VerificaFase:
	sle $s2, $s4, $v1				#Se o upgrade for <= que o contador, s2 = 1
	beq $s2, Cte1, AtualizaLike			#Se s2 = 1, nao precisa atualizar a fase, e ja vai att taxa/saldo direto
	j VerificaTroca

VerificaTroca:
	sub $s6, $s4, $v1
	bne $s6, Cte1, PrintaUpgradeBloqueado		#COLOCAR MSG TEM QUE TER RETURN PRO LACO
	move $v1, $s4					#Atualiza o contador da fase, temos que trocar o desenho
	li $v0, 31
	li $a0, 68
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 63
	syscall
	
	li $v0, 31
	li $a0, 73
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 63
	syscall
	
	li $v0, 31
	li $a0, 78
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 125
	syscall
	
	li $v0, 31
	li $a0, 83
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 32
	syscall
	
	li $v0, 31
	li $a0, 88
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 125
	syscall
	
	li $v0, 31
	li $a0, 93
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall
	
	li $v0, 32
	li $a0, 63
	syscall
	
	li $v0, 31
	li $a0, 98
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall
	
	j AtualizaLikeSemSom
	
AtualizaLike:
	li $v0, 31
	li $a0, 98
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall
	
	li $v0, 31
	li $a0, 100
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall

AtualizaLikeSemSom:
	sub $t0, $t0, $s1				#Atualiza o contador de like
	add $t4, $t4, $s5				#Atualiza a taxa de aumento
	
	j AtualizaDesenho
	
AtualizaDesenho:
	beq $v1, 0, DesenhaBebe
	beq $v1, 1, DesenhaCrianca
	beq $v1, 2, DesenhaFormado
	beq $v1, 3, DesenhaReggae
	beq $v1, 4, DesenhaComputeiro
	beq $v1, 5, DesenhaProfessor
	beq $v1, 6, DesenhaYoutuber
	beq $v1, 7, DesenhaChina
	beq $v1, 8, DesenhaAstronauta
	beq $v1, 9, DesenhaRei

DesenhaBebe:
	jal CappaApaga
	jal CappaBebe
	j DecideMenu

DesenhaCrianca:
	jal CappaApaga
	jal CappaCrianca
	j DecideMenu

DesenhaFormado:
	jal CappaApaga
	jal CappaFormado
	j DecideMenu

DesenhaReggae:
	jal CappaApaga
	jal CappaReggae	
	j DecideMenu

DesenhaComputeiro:
	jal CappaApaga
	jal CappaComputeiro
	j DecideMenu

DesenhaProfessor:
	jal CappaApaga
	jal Cappa
	j DecideMenu

DesenhaYoutuber:
	jal CappaApaga
	jal CappaYoutuber
	j DecideMenu

DesenhaChina:
	jal CappaApaga
	jal CappaChina
	j DecideMenu

DesenhaAstronauta:
	jal CappaApaga
	jal CappaAstronaut
	j DecideMenu

DesenhaRei:
	jal CappaApaga
	jal CappaRei
	j DecideMenu

PrintaSaldoInsuficiente:
	#jal SaldoInsuficienteBox
	li $v0, 31 
	li $a0, 60
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall
	
	li $v0, 31 
	li $a0, 58
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall
	j LacoPrincipal

PrintaUpgradeBloqueado:
	#li $v0, 55 #syscall value for dialog
	#li $a1, 2
	#la $a0, FaseBloqueada #get message
	#syscall
	li $v0, 31 
	li $a0, 60
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall
	
	li $v0, 31 
	li $a0, 58
	li $a1, 750
	li $a2, 121
	li $a3, 127
	syscall
	j LacoPrincipal
	

TesteSaldo:
	bge $t0, 1853000000, FimDeJogo	#Vai Passar o limie, pois taxa eh 147000000
	jr $31				#Volta pra onde parou 

FimDeJogo:
	jal defineFundo
	jal fundo
	jal MensagemTelaFinal
	jal CappaApaga
	jal CappaBebe
	addi $t1, $0, 10000	#Qtd do Delay 1000mils = 1 seg
	move $a0, $t1		#Movendo o valor para a0
	li $v0, 32		#Carregando na funcao de delay
	syscall	 
	j ChecaTecla
#MARROM: 		.word 0x663300
#VERDE_ESCURO: 		.word 0x006600
#VERMELHO_SANGUE: 	.word 0xff0000
#CINZA_ESCURO: 		.word 0x333333
#CINZA_CLARO: 		.word 0x999999
#CINZA: 		.word 0x696969
#AZUL_ESCURO: 		.word 0x000080
#AMARELO: 		.word 0xffff00
#AZUL_CLARO: 		.word 0x4682b4
#ROSINHA: 		.word 0xff7256
#PRETO: 		.word 0x000000
#COR_CAPPA: 		.word 0xffa07a
#BRANCO: 		.word 0xffffff
	
