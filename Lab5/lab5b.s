# CS220 Lab #5 Part B
# @author John Marshall (jmarsha6)



# ===== VARIABLE MEMORY DEFS =====
	.data


# --- end variable memory defs ---



# ===== READ-ONLY MEMORY DEFS =====
	.section	.rodata


# --- end read-only memory defs ---

	.text

# ===== MAIN =====

.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp

	pushl	$8
	pushl	$6
	call	radd
	popl	%eax
	popl	%eax

	pushl	$5
	pushl	$14
	call	radd
	popl	%eax
	popl	%eax

	pushl	$21
	pushl	$3
	call	radd
	popl	%eax
	popl	%eax

	leave
	ret
	.size	main, .-main
# --- end main ---



# ===== RADD =====

radd:
	pushl	%ebp
	movl	%esp, %ebp

	pushf
	pushl	%eax
	pushl	%ebx	

	movl	8(%ebp), %eax
	movl	12(%ebp), %ebx
	cmp	$0, %ebx
	je	base
	incl	%eax
	decl	%ebx
	pushl	%ebx
	pushl	%eax
	call	radd
	popl	%eax
	popl	%ebx
base:	
	popl	%ebx
	popl	%eax
	popf
	leave
	ret
	.size	radd, .-radd
# --- end radd ----



# !!!!! DO NOT MODIFY BELOW !!!!!
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"

