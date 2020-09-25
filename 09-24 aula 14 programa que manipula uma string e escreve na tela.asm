main
	ldi r1,0
rep

	ldi r5,mensagem

; na manipulacao do vetor da string só precisa adicionar r5 uma vez
	add r5,r5,r1

; carrega a letra em r4
	ldb r4,r5

; imprime na tela
	stw r4,0xf000

	add r1,1
	bnz r4,rep
	hcf

mensagem	"Lorem ipsum dolor"