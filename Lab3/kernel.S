.syntax unified
.cpu cortex-m4
.thumb
#define A #1
#define B #5
#define C #6

// Global memory locations.
.global vtable_kernel
.global __kernel_reset__

.type vtable_kernel, %object
.type __kernel_reset__, %function

.section .interrupt_vector
vtable_kernel:
	.word __stack_start
	.word __kernel_reset__+1
	.size vtable_kernel, .-vtable_kernel
	
.section .rodata
	data: .asciz "kernel started!\n"
	final: .asciz "Value in register #6: "
.section .text
	__kernel_reset__:
	ldr r0, =data
	bl dbgput_line
	
	// calculate
	mov r0, A
	mov r1, B
	mov r2, C
	mov r3, #10

	mul r4, r0, r1 			
	cmp r4, r3
	ITE GE
	orrGE r5, r0, r1
	andLT r5, r0, r1
	mul r6, r5, r2
	
	ldr r0, =final
	bl dbgput
	mov r0, r6
	bl dbgput_num
	
	end:
	b end
