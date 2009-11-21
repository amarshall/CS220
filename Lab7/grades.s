# CS220 Lab #7
# grades.s
# @author John Marshall (jmarsha6)

# ===== VARIABLE MEMORY DEFS =====
	.data

grade1:		.float	0
grade2:		.float	0
grade3:		.float	0
grade4:		.float	0

temp:		.byte	0

# --- end variable memory defs ---



# ===== READ-ONLY MEMORY DEFS =====
	.section	.rodata

#	Format:		Quizzes              Projects             Mid/Fin
#			 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, M, F
student1:	.byte	90,60,100,70,50,90,90,100,98,80,100,90,86,100,86,98
student2:	.byte	75,80,90,75,90,85,80,100,95,100,100,95,35,85,69,89
student3:	.byte	80,90,50,80,80,85,60,100,100,95,100,98,75,95,93,90
student4:	.byte	85,90,75,100,75,100,75,0,80,75,95,98,80,98,78,95

prjmult:	.float	.01, .04, .15, .20, .15, .20, .25
glblmult:	.float	.30, .30, .20, .20


floatstr:	.string	"%.2f\n"
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
	call	compute_grade
	fstps	grade1
	popl	%ebx

	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	pushl	$grade1
	pushl	$floatstr
	call	printf
	popl	%ebx
	popl	%ebx
	popl	%edi
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	popf

	leave
	ret
	.size	main, .-main
# --- end main ---



# ===== COMPUTE_GRADE =====
# @returns Result in %st
	.type	compute_grade, @function
compute_grade:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	%eax
	pushl	%ebx
	pushl	%ecx

	# Compute quizzes
	movl	$0, %ecx
	pushl	8(%ebp)
	call	get_quiz_avg
	fmuls	glblmult(, %ecx, 4)

	# Compute projects
	incl	%ecx
	call	get_prj_avg	# 8(%ebp) still at top of stack
	fmuls	glblmult(, %ecx, 4)
	
	popl	%eax

	# Compute midterm
	incl	%ecx
	movl	8(%ebp), %eax
	movl	$0, %ebx
	movb	14(%eax), %bl
	movb	%bl, temp
	filds	temp
	fmuls	glblmult(, %ecx, 4)

	# Compute final project
	incl	%ecx
	movl	$0, %ebx
	movb	15(%eax), %bl
	movb	%bl, temp
	filds	temp
	fmuls	glblmult(, %ecx, 4)

	# Add up all the computed grades
	faddp
	faddp
	faddp

	popl	%ecx
	popl	%ebx
	popl	%eax

	leave
	ret
	.size compute_grade, .-compute_grade
# --- end compute_grade ---


# ===== GET_QUIZ_AVG =====
# @returns Result in %st
	.type	get_quiz_avg, @function
get_quiz_avg:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	%eax
	pushl	%ebx
	pushl	%ecx

	movl	8(%ebp), %ebx	# Location in memory of student
	movl	$7, %ecx	# Loop through seven quizzes
	fldz			# Load zero to start, then add to it

add_quiz:
	movl	$0, %eax	# Ensure %eax is zero before manipulating
	decl	%ecx		# Counter and offset differ by 1
	movb	(%ebx, %ecx), %al	# Only want a byte
	incl	%ecx		# Correct back for counter
	movb	%al, temp

	fiadd	temp		# Add to total, happens to run backwards,
	loop	add_quiz	#   but addition is commutative, no worries

	movw	$7, temp
	fidiv	temp

	popl	%ecx
	popl	%ebx
	popl	%eax

	leave
	ret
	.size	get_quiz_avg, .-get_quiz_avg
# --- end get_quiz_avg ---



# ===== GET_PRJ_AVG =====
# @returns Result in %st
	.type	get_prj_avg, @function
get_prj_avg:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	%eax
	pushl	%ebx
	pushl	%ecx

	movl	8(%ebp), %ebx	# Location in memory of student
	movl	$7, %ecx	# Loop through seven quizzes
	fldz			# Load zero to start, then add to it

add_prj:
	movl	$0, %eax	# Ensure %eax is zero before manipulating
	addl	$6, %ecx	# Counter and offset differ by 6
	movb	(%ebx, %ecx), %al	# Only want a byte
	subl	$6, %ecx	# Correct back for counter
	movb	%al, temp

	filds	temp		# Load current grade, run backwards
	decl	%ecx
	fmuls	prjmult(, %ecx, 4)	# Multiply by multiplier
	incl	%ecx
	faddp			# Add working to total
	loop	add_prj

	popl	%ecx
	popl	%ebx
	popl	%eax

	leave
	ret
	.size	get_prj_avg, .-get_prj_avg
# --- end get_prj_avg ---



# !!!!! DO NOT MODIFY BELOW !!!!!
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"

