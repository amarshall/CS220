	.section	.rodata
	.align 32
.LC0:
	.string	"eax: 0x%.8X\tebx: 0x%.8X\tecx: 0x%.8X\tedx: 0x%.8X\n"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	andl	$-16, %esp

#  @author: John Andrew Marshall (jmarsha6)
#  CS220 Fall 2009, Lab #2
#  Lovingly written in vim :)
#  Begin code
	movl	$232, %eax
	movl	$0x014A, %edx
	xchgl	%eax, %edx
	imull	$3, %eax
	movl	$0x12345678, %ebx
	orw	$0xFFFF, %bx
	andb	$0xDD, %bl
	movb	$0b01110001, %cl
	addl	$0xFEDCBA98, %ebx
	adcl	%edx, %eax
#  End code

	movl	%edx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf

	leave
	ret
	.size	main, .-main
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"
