; Descreva em linguagem de montagem um código que implementa a estrutura de seleção abaixo. Para isso, utilize ; os exemplos encontrados no Moodle em Material Auxiliar/aula12 como referência. Na sua implementação, declare ; as variáveis a, b, c e d na seção de dados e defina valores diferentes para cobertura de testes.
;
; if (a <= b || a == 7) {
; 	d = 1;
; } else {
; 	if (b > c) {
; 		d = 2;
; 	} else {
; 		d = 3;
; 	}
; }

main
; carrega as variaveis nos registradores
	ldw r1,a
	ldw r2,b
	ldw r3,c
	ldw r4,d
; testando se b<a, que é o contrário de a<=b. Entrará no if se isso for falso, ou seja 0
	slt r5,r2,r1
	bez r5,if
; testando se a=7. Entrará no if se for true, ou seja se ficar zero em r1
	sub r1,7
	bez r1,if

; se o if for falso vai para o segundo if, sendo que os ifs começam pelos elses
fimdoif
	bnz r7,else

; coloca 1 em d e termina
if
	ldi r4,1
	stw r4,d
	bnz r7,fim

; else e segundo if, testa se c<b, ou seja, se b>c
else
	slt r5,r3,r2
	bnz r5,if2

; senão d=3
else2
	ldi r4,3
	stw r4,d
	bnz r7,fim

; se c<b chegará aqui e colocará 2 em d e terminará
if2 
	ldi r4,2
	stw r4,d
	bnz r7,fim

; imprime d na tela e termina
fim
	stw r4,0xf002
	hcf

; dados
a	6
b	8
c	1
d       4