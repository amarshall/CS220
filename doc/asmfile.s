# This is a sample file written by Prof. Greene.

	.section .text
.globl _asm_procedure
_asm_procedure:
.globl asm_procedure
asm_procedure:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %eax
	addl	8(%ebp), %eax
	imull	16(%ebp), %eax
	popl	%ebp
	ret
	.ident	"GCC: (GNU) 4.0.1"
