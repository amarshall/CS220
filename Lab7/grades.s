# CS220 Lab #7
# grades.s
# @author John Marshall (jmarsha6)

# ===== VARIABLE MEMORY DEFS =====
	.data

worstgrades:	.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
bestgrades:	.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

temp:		.byte	0
templ:		.long	0
tempf:		.float	0

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
gradeA:		.string	"A ("
		.size gradeA, .-gradeA
gradeAm:	.string	"A- ("
		.size gradeAm, .-gradeAm
gradeBp:	.string	"B+ ("
		.size gradeBp, .-gradeBp
gradeB:		.string	"B ("
		.size gradeB, .-gradeB
gradeBm:	.string	"B- ("
		.size gradeBm, .-gradeBm
gradeCp:	.string	"C+ ("
		.size gradeCp, .-gradeCp
gradeC:		.string	"C ("
		.size gradeC, .-gradeC
gradeCm:	.string	"C- ("
		.size gradeCm, .-gradeCm
gradeD:		.string	"D ("
		.size gradeD, .-gradeD
gradeF:		.string	"F ("
		.size gradeF, .-gradeF

student1str:	.string	"\n\n### STUDENT 1 ###\n"
		.size student1, .-student1
student2str:	.string	"\n\n### STUDENT 2 ###\n"
		.size student2, .-student2
student3str:	.string	"\n\n### STUDENT 3 ###\n"
		.size student3, .-student3
student4str:	.string	"\n\n### STUDENT 4 ###\n"
		.size student4, .-student4
student5str:	.string	"\n\n### STUDENT 5 (WORST) ###\n"
		.size student4, .-student4
student6str:	.string	"\n\n### STUDENT 6 (BEST) ###\n"
		.size student4, .-student4


quizstr:	.string "Quizzes (1-7):\n"
		.size quizstr, .-quizstr
labstr:		.string "Labs (1-7):\n"
		.size labstr, .-labstr
midstr:		.string "Midterm: "
		.size midstr, .-midstr
finstr:		.string "Final Project: "
		.size finstr, .-finstr
fingrstr:	.string "Final Grade: "
		.size fingrstr, .-fingrstr


floatstr:	.string	"%.2f\%)\n"
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
	pushl	$student1str
	call	print_string
	popl	%ebx
	pushl	$student1
	call	print_grades
	call	compute_grade
	pushl	$fingrstr
	call	print_string
	popl	%ebx
	call	get_letter
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
	pushl	$student2str
	call	print_string
	popl	%ebx
	pushl	$student2
	call	print_grades
	call	compute_grade
	pushl	$fingrstr
	call	print_string
	popl	%ebx
	call	get_letter
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
	pushl	$student3str
	call	print_string
	popl	%ebx
	pushl	$student3
	call	print_grades
	call	compute_grade
	pushl	$fingrstr
	call	print_string
	popl	%ebx
	call	get_letter
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
	pushl	$student4str
	call	print_string
	popl	%ebx
	pushl	$student4
	call	print_grades
	call	compute_grade
	pushl	$fingrstr
	call	print_string
	popl	%ebx
	call	get_letter
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
	pushl	$student5str
	call	print_string
	popl	%ebx
	pushl	$worstgrades
	call	print_grades
	call	compute_grade
	pushl	$fingrstr
	call	print_string
	popl	%ebx
	call	get_letter
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
	pushl	$student6str
	call	print_string
	popl	%ebx
	pushl	$bestgrades
	call	print_grades
	call	compute_grade
	pushl	$fingrstr
	call	print_string
	popl	%ebx
	call	get_letter
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
	.type	compute_worst, @function
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
	.type	compute_best, @function
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
# @returns The original argument in %st(0)
	.type	get_letter, @function
get_letter:
	pushl	%ebp
	movl	%esp, %ebp

	movl	$0, %esi

	filds	thresholds(,%esi,4)
	fcomi	%st(1)
	ja	let1
	pushl	$gradeA
	call	print_string
	popl	%ebx
	jmp	letdone
	
let1:	fstps	tempf
	incl	%esi
	filds	thresholds(,%esi,4)
	fcomi	%st(1)
	ja	let2
	pushl	$gradeAm
	call	print_string
	popl	%ebx
	jmp	letdone

let2:	fstps	tempf
	incl	%esi
	filds	thresholds(,%esi,4)
	fcomi	%st(1)
	ja	let3
	pushl	$gradeBp
	call	print_string
	popl	%ebx
	jmp	letdone

let3:	fstps	tempf
	incl	%esi
	filds	thresholds(,%esi,4)
	fcomi	%st(1)
	ja	let4
	pushl	$gradeB
	call	print_string
	popl	%ebx
	jmp	letdone

let4:	fstps	tempf
	incl	%esi
	filds	thresholds(,%esi,4)
	fcomi	%st(1)
	ja	let5
	pushl	$gradeBm
	call	print_string
	popl	%ebx
	jmp	letdone

let5:	fstps	tempf
	incl	%esi
	filds	thresholds(,%esi,4)
	fcomi	%st(1)
	ja	let6
	pushl	$gradeCp
	call	print_string
	popl	%ebx
	jmp	letdone

let6:	fstps	tempf
	incl	%esi
	filds	thresholds(,%esi,4)
	fcomi	%st(1)
	ja	let7
	pushl	$gradeC
	call	print_string
	popl	%ebx
	jmp	letdone

let7:	fstps	tempf
	incl	%esi
	filds	thresholds(,%esi,4)
	fcomi	%st(1)
	ja	let8
	pushl	$gradeCm
	call	print_string
	popl	%ebx
	jmp	letdone

let8:	fstps	tempf
	incl	%esi
	filds	thresholds(,%esi,4)
	fcomi	%st(1)
	ja	let9
	pushl	$gradeD
	call	print_string
	popl	%ebx
	jmp	letdone

let9:	fstps	tempf
	pushl	$gradeF
	call	print_string
	popl	%ebx

letdone:

	fstps	tempf

	leave
	ret
	.size	get_letter, .-get_letter
# --- end get_letter ---



# ===== PRINT_GRADES =====
# @args	The floating point grade in %st(0)
# @returns	Char for letter in %eax
	.type	print_grades, @function
print_grades:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	%eax
	pushl	%ebx

	movl	8(%ebp), %ebx

	# Print quizzes
	pushl	$quizstr
	call	print_string
	popl	%eax
	pushl	$7
	pushl	%ebx
	call	print_grades_helper
	popl	%eax
	popl	%eax

	# Print labs
	addl	$7, %ebx
	pushl	$labstr
	call	print_string
	popl	%eax
	pushl	$7
	pushl	%ebx
	call	print_grades_helper
	popl	%eax
	popl	%eax

	# Print midterm
	addl	$7, %ebx
	pushl	$midstr
	call	print_string
	popl	%eax
	pushl	$1
	pushl	%ebx
	call	print_grades_helper
	popl	%eax
	popl	%eax

	# Print final project
	incl	%ebx
	pushl	$finstr
	call	print_string
	popl	%eax
	pushl	$1
	pushl	%ebx
	call	print_grades_helper
	popl	%eax
	popl	%eax

	popl	%ebx
	popl	%eax

	leave
	ret
	.size	print_grades, .-print_grades
# --- end print_grades ---



# ===== PRINT_GRADES_HELPER =====
	.type	print_grades_helper, @function
print_grades_helper:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	%eax
	pushl	%ebx
	pushl	%ecx

	movl	12(%ebp), %ecx
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
	.size	print_grades_helper, .-print_grades_helper
# --- end print_grades_helper ---



# ===== PRINT_STRING =====
# Prints a single string from passed memory location
	.type	print_string, @function
print_string:
	pushl	%ebp
	movl	%esp, %ebp

	pushf
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	pushl	8(%ebp)
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
	.size	print_string, .-print_string
# --- end print_string ---



# !!!!! DO NOT MODIFY BELOW !!!!!
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"

