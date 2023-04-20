.global lab1
.syntax unified

#define A #1
#define B #5
#define C #6

// Variant 29 mod 5 = 4
lab1:
	push {lr}
// calculate
	mov r0, A
	mov r1, B
	mov r2, C
	mov r3, #10
	bl test_var
	pop {pc}
test_var:
	push { r0, r1, r2, r3, lr }
	mul r4, r0, r1 			
	cmp r4, r3
	ITE GE
	orrGE r5, r0, r1
	andLT r5, r0, r1
	mul r6, r5, r2
	pop { r0, r1, r2, r3, pc }
