# CS220 Lab #6
# show5.s
# @author John Marshall (jmarsha6)



# ===== VARIABLE MEMORY DEFS =====
	.data

newstr:
	.int 0x00000000

# --- end variable memory defs ---



# ===== READ-ONLY MEMORY DEFS =====
	.section	.rodata

prntcharstr:
	.string	"%c"
ones:
	.int 0x01010101

# --- end read-only memory defs ---

	.text



# ===== SHOW_STRING =====
	.global show_string
	.type	show_string, @function
show_string:
	pushl	%ebp
	movl	%esp, %ebp

	movl	$1, %eax	# Start num of chunks processed at zero
	movl	8(%ebp), %esi

nextchunk:
	movq	(%esi), %mm0
	movq	ones, %mm1
	movq	ones, %mm2
	punpckldq	%mm2, %mm1	# Put bottom half of %mm2 into top half of %mm1
	paddb	%mm1, %mm0	# Add one to each byte
	movq	%mm0, newstr	# Moves new values into memory for printing
	
	movl	$0, %edx
prntchar:
	cmpb	$1, newstr(, %edx) # Check if current character is NULL (aka NULL+1)
	je	EOS	# If current character is null, we're done; jump.
	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	pushl	newstr(, %edx)	# Push memory address of current char to print
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
	incl	%edx
	cmpl	$8, %edx	# Checks if we've printed 8 characters yet
	jl	prntchar	# If not, jumps to print the next

	incl	%eax	# Add 1 to size, since we're about to process another chunk
	addl	$8, %esi	# Move to next chunk in string (+8 bytes)
	jmp	nextchunk	# Go process the next chunk

EOS:				#"End Of String"
	emms	# Clears MMX state to restore FPU operation
	leave
	ret
	.size	show_string, .-show_string
# --- end show_string ---


# !!!!! DO NOT MODIFY BELOW !!!!!
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"

