	.data

#	Define your variable (changeable) data here.

	.section	.rodata

#	Define your constant (read-only) data here.
#	(Things like printf format strings, etc...).

	.text

.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp	# This number ($40) may need to be changed.
				# Depending on how large a frame main needs.

#	Insert your main function assembly code here.

	leave
	ret
	.size	main, .-main

#	Insert other functions here.

	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"
