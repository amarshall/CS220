# CS220 Lab #6
# show3.s
# @author John Marshall (jmarsha6)



# ===== VARIABLE MEMORY DEFS =====
	.data


# --- end variable memory defs ---



# ===== READ-ONLY MEMORY DEFS =====
	.section	.rodata

prntchar:
	.string	"%c"

# --- end read-only memory defs ---

	.text



# ===== SHOW_STRING =====
	.global show_string
	.type	show_string, @function
show_string:
	pushl	%ebp
	movl	%esp, %ebp

	movl	$0, %eax	# Start string size at zero
	movl	8(%ebp), %esi

nextchar:
	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	pushl	(%esi)	# Push memory address of current char to print
	pushl	$prntchar
	call	printf
	popl	%esi
	popl	%esi
	popl	%edi
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	popf

	cmpb	$65, (%esi)
	je	isvowel
	cmpb	$69, (%esi)
	je	isvowel
	cmpb	$73, (%esi)
	je	isvowel
	cmpb	$79, (%esi)
	je	isvowel
	cmpb	$85, (%esi)
	je	isvowel
	cmpb	$97, (%esi)
	je	isvowel
	cmpb	$101, (%esi)
	je	isvowel
	cmpb	$105, (%esi)
	je	isvowel
	cmpb	$111, (%esi)
	je	isvowel
	cmpb	$117, (%esi)
	je	isvowel
	
	jmp	notvowel

isvowel:
	incl	%eax	# Add 1 to size
notvowel:
	incl	%esi	# Move to next char in string (+1 byte)
	
	cmpb	$0, (%esi)	# Equal if char is NULL, ie: end of string
	jne	nextchar	# Loops if not yet end of string

	
	leave
	ret
	.size	show_string, .-show_string
# --- end show_string ---


# !!!!! DO NOT MODIFY BELOW !!!!!
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"

