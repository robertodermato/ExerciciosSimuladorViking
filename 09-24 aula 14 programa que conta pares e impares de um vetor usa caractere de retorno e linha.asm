; conta o número de elementos pares e ímpares de um vetor
; pares terminam por 0 e impares por 1 em binário
; i=0; vet[10]={...}
;
; while (i<tam) {
; 	if (vet[i] & 1) 
;		impares++;
;       else  
;		pares++;
;	i++;
; }

main
	ldi r1,0
	ldw r2,tam

rep
	slt r3,r1,r2
	bez r3,fim

; manejando vetor
	ldi r5,vet
	add r5,r5,r1
	add r5,r5,r1
; sobreescrevendo r5 com valor de vet[i]
	ldw r5,r5

; i++	
	add r1,1

; testando se é par ou impar
; if (vet[i] && 1) !=0)
	and r5,1
	bnz r5,impar

par
	ldw r4,pares
	add r4,1
	stw r4,pares
	bnz r7,rep

impar
	ldw r4,impares
	add r4,1
	stw r4,impares
	bnz r7,rep

fim
	ldw r4,pares
	stw r4,0xf002

; comando de retorno de linha
	ldi r4,10
	stw r4,0xf000

	ldw r4,impares
	stw r4,0xf002
	
	hcf


tam	10
vet	11 67 124 -333 7 2 3 0 6 439
pares	0
impares	0