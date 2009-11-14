# CS220 Lab #6
# show4.s
# @author John Marshall (jmarsha6)



# ===== VARIABLE MEMORY DEFS =====
	.data


# --- end variable memory defs ---



# ===== READ-ONLY MEMORY DEFS =====
	.section	.rodata

prntcharstr:
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
	cmpb	$65, (%esi)
	jl	isother
	cmpb	$122, (%esi)
	jg	isother
	cmpb	$90, (%esi)
	jle	isupper
	cmpb	$97, (%esi)
	jge	islower
	jmp	isother	# Shouldn't really be needed, but just to be safe

isupper:
	addb	$32, (%esi)	# Make uppercase lowercase
	jmp	prntchar
islower:
	subb	$32, (%esi)	# Make lowercase uppercase
#	jmp	prntchar	# Unneeded, left in for clarity
isother:
				# Don't do anything to non-numeric chars
prntchar:
	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	pushl	(%esi)	# Push memory address of current char to print
	pushl	$prntcharstr
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

	incl	%eax	# Add 1 to size
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

