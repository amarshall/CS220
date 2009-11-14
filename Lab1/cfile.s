	.file	"cfile.c"
	.text
.globl c_procedure
	.type	c_procedure, @function
c_procedure:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	imull	16(%ebp), %eax
	popl	%ebp
	ret
	.size	c_procedure, .-c_procedure
	.section	.rodata
.LC0:
	.string	"From ASM: %d\n"
.LC1:
	.string	"From C: %d\n"
	.text
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$20, %esp
	movl	$6, 8(%esp)
	movl	$5, 4(%esp)
	movl	$3, (%esp)
	call	asm_procedure
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	$6, 8(%esp)
	movl	$5, 4(%esp)
	movl	$3, (%esp)
	call	c_procedure
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	movl	$0, %eax
	addl	$20, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (Debian 4.3.2-1.1) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
