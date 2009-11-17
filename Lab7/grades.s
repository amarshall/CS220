# CS220 Lab #7
# PartA.s
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
quiz4:	.int	
quiz5:	.int	
quiz6:	.int	
quiz7:	.int	
prj1:	.int	100,100,100,0
prj2:	.int	
prj3:	.int	
prj4:	.int	
prj5:	.int	
prj6:	.int	
prj7:	.int	
midtrm:	.int	86,69,93,78
finprj:	.int	

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

