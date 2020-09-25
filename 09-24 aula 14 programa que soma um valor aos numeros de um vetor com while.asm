; i = 0; vet[10] = {-1000, -550, ... };
; while (i < vetsz) {
; 	vet[i] += 42;
;	i++;
; }

main
	ldi r1,0
while
	ldw r2,vetsz
	slt r3,r1,r2
	bez r3,end

; coloca em r3 vet[i]	
	ldi r5,vet
	add r5,r5,r1
	add r5,r5,r1
	ldw r3,r5
	
	add r3,42
	stw r3,r5
	
	add r1,1
	bnz r7,while
end
	hcf
	
vetsz	10
vet	-1000 -550 -10 150 295 970 1551 1667 2599 6987