# CS220 Lab #5 Part A
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

	call func1

	leave
	ret
	.size	main, .-main
# --- end main ---



# ===== FUNC1 =====

func1:
	pushl	%ebp
	movl	%esp, %ebp

	call func2

	leave
	ret
	.size	func1, .-func1
# --- end func1 ----



# ===== FUNC2 =====

func2:
	pushl	%ebp
	movl	%esp, %ebp

	call func3

	leave
	ret
	.size	func2, .-func2
# --- end func2 ----



# ===== FUNC3 =====

func3:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$4, %esp
	fld1
	fldpi
	fdivr	%st(1), %st(0)
	fstps	-4(%ebp)

	leave
	ret
	.size	func3, .-func3
# --- end func3 ----

# !!!!! DO NOT MODIFY BELOW !!!!!
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"

