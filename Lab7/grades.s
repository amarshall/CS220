# CS220 Lab #7
# grades.s
# @author John Marshall (jmarsha6)

# ===== VARIABLE MEMORY DEFS =====
	.data

worstgrades:	.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
bestgrades:	.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

temp:		.byte	0
templ:		.long	0

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

#			 A,A-,B+, B,B-,C+, C,C+, D,0
thresholds:	.int	93,90,87,83,80,77,73,70,65,0
gradeA:		.string	"A"
		.size gradeA, .-gradeA
gradeAm:	.string	"A-"
		.size gradeAm, .-gradeAm
gradeBp:	.string	"B+"
		.size gradeBp, .-gradeBp
gradeB:		.string	"B"
		.size gradeB, .-gradeB
gradeBm:	.string	"B-"
		.size gradeBm, .-gradeBm
gradeCp:	.string	"C+"
		.size gradeCp, .-gradeCp
gradeC:		.string	"C"
		.size gradeC, .-gradeC
gradeCm:	.string	"C-"
		.size gradeCm, .-gradeCm
gradeD:		.string	"D"
		.size gradeD, .-gradeD


floatstr:	.string	"%.2f\n"
		.size floatstr, .-floatstr
decstr:		.string	"%hhd\n"
		.size decstr, .-decstr

# --- end read-only memory defs ---

	.text



# ===== MAIN =====
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$40, %esp
	
	
	# Compute & print student one
	pushl	$student1
	call	compute_grade
	popl	%ebx

	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	fstpl	(%esp)
	pushl	$floatstr
	call	printf
	popl	%ebx
	popl	%edi
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	popf
	
	
	# Compute & print student two
	pushl	$student2
	call	compute_grade
	popl	%ebx

	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	fstpl	(%esp)
	pushl	$floatstr
	call	printf
	popl	%ebx
	popl	%edi
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	popf
	
	
	# Compute & print student three
	pushl	$student3
	call	compute_grade
	popl	%ebx

	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	fstpl	(%esp)
	pushl	$floatstr
	call	printf
	popl	%ebx
	popl	%edi
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	popf
	
	
	# Compute & print student four
	pushl	$student4
	call	compute_grade
	popl	%ebx

	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	fstpl	(%esp)
	pushl	$floatstr
	call	printf
	popl	%ebx
	popl	%edi
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	popf


	# Compute & print student "five" (worst)
	call	compute_worst
	pushl	$worstgrades
	call	compute_grade
	popl	%ebx

	pushl	$worstgrades
	call	print_grades
	popl	%ebx

	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	fstpl	(%esp)
	pushl	$floatstr
	call	printf
	popl	%ebx
	popl	%edi
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	popf

	# Compute & print student "six" (best)
	call	compute_best
	pushl	$bestgrades
	call	compute_grade
	popl	%ebx


	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	fstpl	(%esp)
	pushl	$floatstr
	call	printf
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



# ===== COMPUTE_WORST =====
	.type	get_prj_avg, @function
compute_worst:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	%ecx

	movl	$-1, %ecx
cwmmx:
	incl	%ecx
	movq	student1(,%ecx,8), %mm0
	pcmpgtb	student2(,%ecx,8), %mm0
	movq	student1(,%ecx,8), %mm1
	movq	%mm0, %mm2
	pandn	%mm1, %mm0
	pand	student2(,%ecx,8), %mm2
	paddb	%mm2, %mm0

	movq	%mm0, %mm2
	pcmpgtb	student3(,%ecx,8), %mm2
	movq	%mm2, %mm1
	pandn	%mm0, %mm2
	pand	student3(,%ecx,8), %mm1
	paddb	%mm2, %mm1
	movq	%mm1, %mm0

	movq	%mm0, %mm2
	pcmpgtb	student4(,%ecx,8), %mm2
	movq	%mm2, %mm1
	pandn	%mm0, %mm2
	pand	student4(,%ecx,8), %mm1
	paddb	%mm2, %mm1

	movq	%mm1, worstgrades(,%ecx,8)
	cmp	$0, %ecx
	je	cwmmx

	popl	%ecx
	emms

	leave
	ret
	.size	compute_worst, .-compute_worst
# --- end get_prj_avg ---



# ===== COMPUTE_BEST =====
	.type	get_prj_avg, @function
compute_best:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	%ecx

	movl	$-1, %ecx
cbmmx:
	incl	%ecx
	movq	student1(,%ecx,8), %mm0
	pcmpgtb	student2(,%ecx,8), %mm0
	movq	student1(,%ecx,8), %mm1
	pand	%mm0, %mm1
	pandn	student2(,%ecx,8), %mm0
	paddb	%mm1, %mm0

	movq	%mm0, %mm2
	pcmpgtb	student3(,%ecx,8), %mm2
	pand	%mm2, %mm0
	pandn	student3(,%ecx,8), %mm2
	paddb	%mm2, %mm0

	movq	%mm0, %mm2
	pcmpgtb	student4(,%ecx,8), %mm2
	pand	%mm2, %mm0
	pandn	student4(,%ecx,8), %mm2
	paddb	%mm2, %mm0

	movq	%mm0, bestgrades(,%ecx,8)
	cmp	$0, %ecx
	je	cbmmx

	popl	%ecx
	emms

	leave
	ret
	.size	compute_best, .-compute_best
# --- end get_prj_avg ---



# ===== GET_LETTER =====
# @args	The floating point grade in %st(0)
# @returns	Char for letter in %eax
	.type	get_prj_avg, @function
get_letter:
	pushl	%ebp
	movl	%esp, %ebp

	filds	thresholds(,%esi,4)
#	fcomi	%ebx

	leave
	ret
	.size	get_letter, .-get_letter
# --- end get_letter ---



# ===== PRINT_GRADES =====
# Print all individual grades for a given student
# @args Starting memory address for the student's grades
	.type	get_prj_avg, @function
print_grades:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	%eax
	pushl	%ebx
	pushl	%ecx

	movl	$16, %ecx
	movl	8(%ebp), %ebx

prntgrades:
	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	pushl	(%ebx)
	pushl	$decstr
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
	incl	%ebx
	loop	prntgrades

	popl	%ecx
	popl	%ebx
	popl	%eax

	leave
	ret
	.size	print_grades, .-print_grades
# --- end print_grades ---



# !!!!! DO NOT MODIFY BELOW !!!!!
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"

