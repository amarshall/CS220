# CS220 Lab #7
# grades.s
# @author John Marshall (jmarsha6)

# ===== VARIABLE MEMORY DEFS =====
	.data

# --- end variable memory defs ---

grade:	.int	0,0,0,0

# ===== READ-ONLY MEMORY DEFS =====
	.section	.rodata

quiz1:	.int	90,75,80,85
quiz2:	.int	60,80,90,90
quiz3:	.int	100,90,50,75
quiz4:	.int	70,75,80,100
quiz5:	.int	50,90,80,75
quiz6:	.int	90,85,85,100
quiz7:	.int	90,80,60,75
prj1:	.int	100,100,100,0
prj2:	.int	98,95,100,80
prj3:	.int	80,100,95,75
prj4:	.int	100,100,100,95
prj5:	.int	90,95,97,98
prj6:	.int	86,35,75,80
prj7:	.int	100,85,95,98
midtrm:	.int	86,69,93,78
finprj:	.int	98,89,90,95

# --- end read-only memory defs ---

	.text



# ===== MAIN =====
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp	# This number ($40) may need to be changed.
				# Depending on how large a frame main needs.



	leave
	ret
	.size	main, .-main
# --- end main ---


# !!!!! DO NOT MODIFY BELOW !!!!!
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"

