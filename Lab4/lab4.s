# CS220 Lab #4
# @author John Marshall (jmarsha6)



# ===== VARIABLE MEMORY DEFS =====
	.data

vals3:	.long	0,0,0,0,0,0,0,0
	.size	vals3, .-vals3
vals4:	.long	0,0,0,0,0,0,0,0
	.size	vals4, .-vals4
vals05:	.long	0,0,0,0,0,0,0,0,0,0
	.size	vals03, .-vals03
vals06:	.long	0,0,0,0,0
	.size	vals04, .-vals04

vals5:	.long	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.size	vals5, 128
vals6:	.long	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.size	vals6, 128
vals7:	.long	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.size	vals7, 128
v5size:	.long	0
	.size	v5size, .-v5size
v6size:	.long	0
	.size	v6size, .-v6size
v7size:	.long	0
	.size	v7size, .-v7size
nullst:	.string	""
	.size	nullst, .-nullst

# --- end variable memory defs ---



# ===== READ-ONLY MEMORY DEFS =====
	.section	.rodata

vals1:	.long	24,75,64,18,25,32,57,18
	.size	vals1, .-vals1
vals2:	.long	72,01,49,35,65,17,96,42
	.size	vals2, .-vals2
vals01:	.long	4235,45,532,5,432,54,5,432,54
	.size	vals01, .-vals01
vals02:	.long	324,34,5,3244,5453,3,43,56,32
	.size	vals02, .-vals02
vals03:	.long	23,43,5432,43,54
	.size	vals03, .-vals03
vals04:	.long	34,32,54345,43,217
	.size	vals04, .-vals04
formst:	.string	"%d\n"
	.size	formst, .-formst
instr:	.string	"%d"
	.size	instr, .-instr
clrstr:	.string	"%*s"
	.size	clrstr, .-clrstr
S_INPUT_SIZE:	.string	"Please enter number of items [1-128]: "
	.size	S_INPUT_SIZE, .-S_INPUT_SIZE
S_INPUT_ITEM:	.string	"Item #%d? "
	.size	S_INPUT_ITEM, .-S_INPUT_ITEM
S_INVALID_INPUT:	.string	"\*\*Invalid input, please try again\*\*\n"
	.size	S_INVALID_INPUT, .-S_INVALID_INPUT
S_PRINTING:	.string	"--Printing list:\n"
	.size	S_PRINTING, .-S_PRINTING
S_PRINTED:	.string	"--Done printing list\n\n"
	.size	S_PRINTED, .-S_PRINTED
# --- end read-only memory defs ---

	.text

# ===== MAIN =====

.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp	# This number ($40) may need to be changed.
				# Depending on how large a frame main needs.

	# Print vals1
	pushl	$vals1	# List to print
	pushl	$8	# Size of list
	call	listprint
	popl	%eax
	popl	%eax
	
	# Evaluate iteratively vals3=vals1+vals2
	pushl	$vals3	# Address of output
	pushl	$vals2	# Address of input 2
	pushl	$vals1	# Address of input 1
	pushl	$8	# Size of lists
	call	addlists
	popl	%eax
	popl	%eax
	popl	%eax
	popl	%eax
	
	# Outputted added lists
	pushl	$vals3
	pushl	$8
	call	listprint
	popl	%eax
	popl	%eax

	pushl	$vals05	# Address of output
	pushl	$vals02	# Address of input 2
	pushl	$vals01	# Address of input 1
	pushl	$9	# Size of lists
	call	addlists
	popl	%eax
	popl	%eax
	popl	%eax
	popl	%eax
	
	# Outputted added lists
	pushl	$vals05
	pushl	$9
	call	listprint
	popl	%eax
	popl	%eax

	pushl	$vals06	# Address of output
	pushl	$vals04	# Address of input 2
	pushl	$vals03	# Address of input 1
	pushl	$5	# Size of lists
	call	addlists
	popl	%eax
	popl	%eax
	popl	%eax
	popl	%eax
	
	# Outputted added lists
	pushl	$vals06
	pushl	$5
	call	listprint
	popl	%eax
	popl	%eax


	# Have user input list 1
	pushl	$vals5
	pushl	$v5size
	call	scanlist
	popl	%eax
	popl	%eax

	# Have user input list 2
	pushl	$vals6
	pushl	$v6size
	call	scanlist
	popl	%eax
	popl	%eax

	# Add two user-inputed lists
	movl	v5size, %eax
	cmp	v6size, %eax
	jge	v5big		# If vals5 is bigger, jump
	movl	v6size, %eax	# Otherwise use size of vals6
v5big:	movl	%eax, v7size
	pushl	$vals7
	pushl	$vals6
	pushl	$vals5
	pushl	%eax
	call	addlists
	popl	%eax
	popl	%eax
	popl	%eax
	popl	%eax

	# Print computed sum of user-inputed lists
	pushl	$vals7
	pushl	v7size
	call	listprint
	popl	%eax
	popl	%eax

	leave
	ret
	.size	main, .-main
# --- end main ---



# ===== LISTPRINT =====

	.type	listprint, @function
listprint:
	pushl	%ebp
	movl	%esp, %ebp

	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%edi
	pushl	%esi

	pushl	$S_PRINTING
	call	printitem
	popl	%eax

	movl	$0, %ebx	# Scale for list location
	movl	8(%ebp), %ecx	# Number of items in list
	movl	12(%ebp), %eax	# Memory location of list
prntloop:
	pushf
	pushl	%edi
	pushl	%esi
	pushl	%edx
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	0(%eax, %ebx, 4)	# Current list item
	pushl	$formst		# printf format string
	call	printf
	popl	%edx
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	popl	%edx
	popl	%esi
	popl	%edi
	popf
	incl	%ebx
	loop	prntloop	# Decrements %ecx

	pushl	$S_PRINTED
	call	printitem
	popl	%eax

	popl	%esi
	popl	%edi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	popf
	
	leave
	ret
	.size	listprint, .-listprint
# --- end listprint ---



# ===== ADDLISTS =====
addlists:
	pushl	%ebp
	movl	%esp, %ebp

	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%edi
	pushl	%esi
	
	movl	$0, %esi	# Scale for list location
	movl	8(%ebp), %ecx	# Number of items in list
	movl	12(%ebp), %eax	# Memory location of input 1
	movl	16(%ebp), %ebx	# Memory location of input 2
	movl	20(%ebp), %edx	# Memory location of output
addloop:
	movl	0(%eax, %esi, 4), %edi
	addl	0(%ebx, %esi, 4), %edi
	movl	%edi, 0(%edx, %esi, 4)
	incl	%esi
	loop	addloop	# Decrements %ecx

	popl	%esi
	popl	%edi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	popf

	leave
	ret
	.size	addlists, .-addlists
# --- end addlists ---



# ===== SCANLIST =====

scanlist:
	pushl	%ebp
	movl	%esp, %ebp

	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%edi
	pushl	%esi	

inputsize:
	pushl	$S_INPUT_SIZE
	call	printitem
	popl	%eax

	pushf
	pushl	%edi
	pushl	%esi
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	pushl	8(%ebp)	# Address of number of items in list variable
	pushl	$instr
	call	scanf
	popl	%ebx
	popl	%ebx
	popl	%ebx	# Need %eax, not using in function now anyway
	popl	%ebx
	popl	%ecx
	popl	%edx
	popl	%esi
	popl	%edi
	popf
	subl	$1, %eax
	jne	badsize
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmp	$128, %eax
	jg	badsize2
	cmp	$0, %eax
	jle	badsize2
	jmp	validsize
badsize:
	pushl	$S_INVALID_INPUT
	call	printitem
	popl	%eax
	pushf
	pushl	%edi
	pushl	%esi
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	pushl	8(%ebp)	# Address of number of items in list variable
	pushl	$clrstr
	call	scanf
	popl	%ebx
	popl	%ebx
	popl	%ebx	# Need %eax, not using in function now anyway
	popl	%ebx
	popl	%ecx
	popl	%edx
	popl	%esi
	popl	%edi
	popf
	jmp	inputsize
badsize2:
	pushl	$S_INVALID_INPUT
	call	printitem
	popl	%eax
	jmp	inputsize
validsize:
	movl	$1, %esi
	movl	8(%ebp), %eax
	movl	(%eax), %ecx
	movl	12(%ebp), %edx

getin:
	pushl	%esi
	pushl	$S_INPUT_ITEM
	call	printitem
	popl	%esi
	popl	%esi
	pushf
	pushl	%edi
	pushl	%esi
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	pushl	%edx
	pushl	$instr
	call	scanf
	popl	%edx
	popl	%ebx
	popl	%ebx
	popl	%ebx
	popl	%ecx
	popl	%edx
	popl	%esi
	popl	%edi
	popf

	subl	$1, %eax
	je	validin
	pushl	$S_INVALID_INPUT
	call	printitem
	popl	%eax
	pushf
	pushl	%edi
	pushl	%esi
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	pushl	8(%ebp)	# Address of number of items in list variable
	pushl	$clrstr
	call	scanf
	popl	%ebx
	popl	%ebx
	popl	%ebx	# Need %eax, not using in function now anyway
	popl	%ebx
	popl	%ecx
	popl	%edx
	popl	%esi
	popl	%edi
	popf
	jmp	getin
validin:
	incl	%esi
	addl	$4, %edx
	loop	getin

	popl	%esi
	popl	%edi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	
	movl	8(%ebp), %eax

	leave
	ret
	.size	scanlist, .-scanlist
# --- end scanlist ---


# ===== PRINTITEM =====
# Arguments taken in order printf expects them, with up to two

printitem:
	pushl	%ebp
	movl	%esp, %ebp
	pushfl

	pushf
	pushl	%edi
	pushl	%esi
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	printf
	popl	%eax
	popl	%eax
	popl	%eax
	popl	%ebx
	popl	%ecx
	popl	%edx
	popl	%esi
	popl	%edi
	popf

	leave
	ret
	.size	printitem, .-printitem
# --- end printitem ---

# !!!!! DO NOT MODIFY BELOW !!!!!
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"

