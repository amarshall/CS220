# CS220 Lab #7
# grades.s
# @author John Marshall (jmarsha6)

# ===== VARIABLE MEMORY DEFS =====
	.data

# --- end variable memory defs ---

grade:	.byte	0,0,0,0

temp:	.int	0

# ===== READ-ONLY MEMORY DEFS =====
	.section	.rodata

#	Format:		Quizzes              Projects             Mid/Fin
#			 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, M, F
student1:	.byte	90,60,100,70,50,90,90,100,98,80,100,90,86,100,86,98
student2:	.byte	75,80,90,75,90,85,80,100,95,100,100,95,35,85,69,89
student3:	.byte	80,90,50,80,80,85,60,100,100,95,100,98,75,95,93,90
student4:	.byte	85,90,75,100,75,100,75,0,80,75,95,98,80,98,78,95

floatstr:
	.string	"%f\n"
	.size floatstr, .-floatstr


# --- end read-only memory defs ---

	.text



# ===== MAIN =====
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$40, %esp

	pushl	$student1
	call	get_quiz_avg
	popl	%eax

	fstpl	(%esp)
	pushl	$floatstr
	call	printf
	popl	%eax


	leave
	ret
	.size	main, .-main
# --- end main ---



# ===== GET_QUIZ_AVG =====
	.type	get_quiz_avg, @function
get_quiz_avg:
	pushl	%ebp
	movl	%esp, %ebp

	movl	8(%ebp), %ebx	# Location in memory of student
	movl	$7, %ecx	# Loop through seven quizzes
	fldz			# Load zero to start, then add to it

add_quiz:
	movl	$0, %eax	# Ensure %eax is zero before manipulating
	decl	%ecx		# Counter and offset are different by 1
	movb	(%ebx, %ecx), %al
	incl	%ecx		# Correct back for counter
	cbtw			# Need to convert to word to satisfy FPU 
	movw	%ax, temp

	fiadd	temp	# Add them up! This happens to run backwards
	loop	add_quiz	#   but addition is commutative, no worries

	movw	$7, temp
	fidiv	temp

	leave
	ret
	.size	get_quiz_avg, .-get_quiz_avg
# --- end get_quiz_avg ---



# !!!!! DO NOT MODIFY BELOW !!!!!
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"

