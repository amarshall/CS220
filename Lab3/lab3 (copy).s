	.section	.rodata
	.align 32
.LC0:
	.string	"eax: 0x%.8X\tebx: 0x%.8X\tecx: 0x%.8X\tedx: 0x%.8X\nesi: 0x%.8X\tedi: 0x%.8X\n"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	andl	$-16, %esp

#############################################
# BU CS220 Lab 3
# @author: John Marshall (jmarsha6)
# Lovingly hand-coded in vim :)
#############################################

# begin code
# Part B
	# Addition 1
	movl	$0xe9492903, %ebx	# A bottom
	addl	$0x94aeff72, %ebx	# B bottom + A bottom
	movl	$0xa4259929, %eax	# A top
	adcl	$0x2013ad24, %eax	# B top + A top + carry
	
	# Addition 2
	movl	$0x49290322, %ebx	# A bottom
	addl	$0x29AF72E2, %ebx	# B bottom + A bottom
	movl	$0x24252929, %eax	# A top
	adcl	$0x20224745, %eax	# B top + A top + carry

	# Addition 3
	movl	$0x423fa823, %ebx	# A bottom
	addl	$0xB35D619D, %ebx	# B bottom + A bottom
	movl	$0x6C4EC2E5, %eax	# A top
	adcl	$0xEF99287a, %eax	# B top + A top + carry

	# Addition 4
	movl	$0x0435B4BD, %ebx	# A bottom
	addl	$0x1563A964, %ebx	# B bottom + A bottom
	movl	$0x2A0CCA0C, %eax	# A top
	adcl	$0xC84B7193, %eax	# B top + A top + carry

	# Division 1
	movl	$0x00000000, %edx	# Ensure remainder starts zero
	movl	$0x182341aa, %esi	# Value to divide by
	movl	$0xa241a35f, %eax
	divl	%esi
	pushl	%eax
	movl	$0xe34383e4, %eax
	divl	%esi
	pushl	%eax
	movl	$0xaf4563ea, %eax
	divl	%esi
	pushl	%eax
	movl	$0xdbcb47ef, %eax
	divl	%esi
	movl	%edx, %esi
	movl	%eax, %edx
	popl	%ecx
	popl	%ebx
	popl	%eax

	# Division 2
	movl	$0x00000000, %edx	# Ensure remainder starts zero
	movl	$0xCB928F6D, %esi	# Value to divide by
	movl	$0x4DC14D8B, %eax
	divl	%esi
	pushl	%eax
	movl	$0x56206A66, %eax
	divl	%esi
	pushl	%eax
	movl	$0x0DFCC495, %eax
	divl	%esi
	pushl	%eax
	movl	$0xFA570770, %eax
	divl	%esi
	movl	%edx, %esi
	movl	%eax, %edx
	popl	%ecx
	popl	%ebx
	popl	%eax

	# Division 3
	movl	$0x00000000, %edx	# Ensure remainder starts zero
	movl	$0x0414ED81, %esi	# Value to divide by
	movl	$0xA7C8BDD2, %eax
	divl	%esi
	pushl	%eax
	movl	$0xE21F5613, %eax
	divl	%esi
	pushl	%eax
	movl	$0x2935BA8A, %eax
	divl	%esi
	pushl	%eax
	movl	$0x97900B88, %eax
	divl	%esi
	movl	%edx, %esi
	movl	%eax, %edx
	popl	%ecx
	popl	%ebx
	popl	%eax

	# Division 4
	movl	$0x00000000, %edx	# Ensure remainder starts zero
	movl	$0x12D8E7F6, %esi	# Value to divide by
	movl	$0x953AB8C9, %eax
	divl	%esi
	pushl	%eax
	movl	$0xE89FA164, %eax
	divl	%esi
	pushl	%eax
	movl	$0x89E8FDFA, %eax
	divl	%esi
	pushl	%eax
	movl	$0x3E11F64C, %eax
	divl	%esi
	movl	%edx, %esi
	movl	%eax, %edx
	popl	%ecx
	popl	%ebx
	popl	%eax

	# Multiplication 1
	# AB*CD

	movl	$0x49290322, %eax	# B
	movl	$0x94aeff72, %ebx	# D
	mull	%ebx			# B*D
	pushl	%eax			# Bottom of B*D (result 1)
	pushl	%edx			# Top of B*D
	movl	$0x24252929, %eax	# A
	movl	$0x94aeff72, %ebx	# D
	mull	%ebx			# A*D
	pushl	%eax			# Bottom of A*D
	pushl	%edx			# Top of A*D
	movl	$0x2013ad24, %eax	# C
	movl	$0x49290322, %ebx	# B
	mull	%ebx			# C*B
	popl	%esi			# Top of A*D
	popl	%edi			# Bottom of A*D
	popl	%ecx			# Top of B*D
	addl	%edi, %eax		# A*D bottom + C*B bottom
	addl	%ecx, %eax		# (A*D bottom + C*B bottom) + B*D top
	pushl	%eax			# Result 2
	pushl	%edx			# Top of C*B
	movl	$0x24252929, %eax	# A
	movl	$0x2013ad24, %ebx	# C
	mull	%ebx			# A*C
	popl	%edi			# Top of C*B
	adcl	%esi, %eax		# A*D top + A*C bottom
	adcl	%edi, %eax		# (A*D top + A*C bottom) + C*B top
	pushl	%eax			# Result 3
	adcl	$0x00000000, %edx	# A*C top + carry
	movl	%edx, %eax		# Result 4
	popl	%ebx			# Result 3
	popl	%ecx			# Result 2
	popl	%edx			# Result 1
	
	
	# Multiplication 2
	# AB*CD
	# A F9AAC674
	# B 5812D947
	# C 8ECC6B11
	# D 4F7A899A

	movl	$0x5812D947, %eax	# B
	movl	$0x4F7A899A, %ebx	# D
	mull	%ebx			# B*D
	pushl	%eax			# Bottom of B*D (result 1)
	pushl	%edx			# Top of B*D
	movl	$0xF9AAC674, %eax	# A
	movl	$0x4F7A899A, %ebx	# D
	mull	%ebx			# A*D
	pushl	%eax			# Bottom of A*D
	pushl	%edx			# Top of A*D
	movl	$0x8ECC6B11, %eax	# C
	movl	$0x5812D947, %ebx	# B
	mull	%ebx			# C*B
	popl	%esi			# Top of A*D
	popl	%edi			# Bottom of A*D
	popl	%ecx			# Top of B*D
	addl	%edi, %eax		# A*D bottom + C*B bottom
	addl	%ecx, %eax		# (A*D bottom + C*B bottom) + B*D top
	pushl	%eax			# Result 2
	pushl	%edx			# Top of C*B
	movl	$0xF9AAC674, %eax	# A
	movl	$0x8ECC6B11, %ebx	# C
	mull	%ebx			# A*C
	popl	%edi			# Top of C*B
	adcl	%esi, %eax		# A*D top + A*C bottom
	adcl	%edi, %eax		# (A*D top + A*C bottom) + C*B top
	pushl	%eax			# Result 3
	adcl	$0x00000000, %edx	# A*C top + carry
	movl	%edx, %eax		# Result 4
	popl	%ebx			# Result 3
	popl	%ecx			# Result 2
	popl	%edx			# Result 1
	

	# Multiplication 3
	# AB*CD
	# A 0A104C26
	# B 8EE489AB
	# C C18795F2
	# D A81F57F4

	movl	$0x8EE489AB, %eax	# B
	movl	$0xA81F57F4, %ebx	# D
	mull	%ebx			# B*D
	pushl	%eax			# Bottom of B*D (result 1)
	pushl	%edx			# Top of B*D
	movl	$0x0A104C26, %eax	# A
	movl	$0xA81F57F4, %ebx	# D
	mull	%ebx			# A*D
	pushl	%eax			# Bottom of A*D
	pushl	%edx			# Top of A*D
	movl	$0xC18795F2, %eax	# C
	movl	$0x8EE489AB, %ebx	# B
	mull	%ebx			# C*B
	popl	%esi			# Top of A*D
	popl	%edi			# Bottom of A*D
	popl	%ecx			# Top of B*D
	addl	%edi, %eax		# A*D bottom + C*B bottom
	addl	%ecx, %eax		# (A*D bottom + C*B bottom) + B*D top
	pushl	%eax			# Result 2
	pushl	%edx			# Top of C*B
	movl	$0x0A104C26, %eax	# A
	movl	$0xC18795F2, %ebx	# C
	mull	%ebx			# A*C
	popl	%edi			# Top of C*B
	adcl	%esi, %eax		# A*D top + A*C bottom
	adcl	%edi, %eax		# (A*D top + A*C bottom) + C*B top
	pushl	%eax			# Result 3
	adcl	$0x00000000, %edx	# A*C top + carry
	movl	%edx, %eax		# Result 4
	popl	%ebx			# Result 3
	popl	%ecx			# Result 2
	popl	%edx			# Result 1
	
	
	# Multiplication 4
	# AB*CD
	# A 9E266228
	# B B076BFC7
	# C 893C5CA7
	# D C8974F14

	movl	$0xB076BFC7, %eax	# B
	movl	$0xC8974F14, %ebx	# D
	mull	%ebx			# B*D
	pushl	%eax			# Bottom of B*D (result 1)
	pushl	%edx			# Top of B*D
	movl	$0x9E266228, %eax	# A
	movl	$0xC8974F14, %ebx	# D
	mull	%ebx			# A*D
	pushl	%eax			# Bottom of A*D
	pushl	%edx			# Top of A*D
	movl	$0x893C5CA7, %eax	# C
	movl	$0xB076BFC7, %ebx	# B
	mull	%ebx			# C*B
	popl	%esi			# Top of A*D
	popl	%edi			# Bottom of A*D
	popl	%ecx			# Top of B*D
	addl	%edi, %eax		# A*D bottom + C*B bottom
	addl	%ecx, %eax		# (A*D bottom + C*B bottom) + B*D top
	pushl	%eax			# Result 2
	pushl	%edx			# Top of C*B
	movl	$0x9E266228, %eax	# A
	movl	$0x893C5CA7, %ebx	# C
	mull	%ebx			# A*C
	popl	%edi			# Top of C*B
	adcl	%esi, %eax		# A*D top + A*C bottom
	adcl	%edi, %eax		# (A*D top + A*C bottom) + C*B top
	pushl	%eax			# Result 3
	adcl	$0x00000000, %edx	# A*C top + carry
	movl	%edx, %eax		# Result 4
	popl	%ebx			# Result 3
	popl	%ecx			# Result 2
	popl	%edx			# Result 1

# Part C

	# Unpack 1
	movl	$0, %eax
	movl	$0, %ebx
	movl	$0, %ecx
	movl	$0, %edx
	movw	$34927, %ax
	pushw	%ax
	movw	%ax, %bx
	andw	$0b0000000000011111, %bx
	shrw	$5, %ax
	movw	%ax, %cx
	andw	$0b0000000000111111, %cx
	shrw	$6, %ax
	movw	%ax, %dx
	andw	$0b0000000000011111, %dx
	popw	%ax

	# Unpack 2
	movl	$0, %eax
	movl	$0, %ebx
	movl	$0, %ecx
	movl	$0, %edx
	movw	$14753, %ax
	pushw	%ax
	movw	%ax, %bx
	andw	$0b0000000000011111, %bx
	shrw	$5, %ax
	movw	%ax, %cx
	andw	$0b0000000000111111, %cx
	shrw	$6, %ax
	movw	%ax, %dx
	andw	$0b0000000000011111, %dx
	popw	%ax

	# Unpack 3
	movl	$0, %eax
	movl	$0, %ebx
	movl	$0, %ecx
	movl	$0, %edx
	movw	$28724, %ax
	pushw	%ax
	movw	%ax, %bx
	andw	$0b0000000000011111, %bx
	shrw	$5, %ax
	movw	%ax, %cx
	andw	$0b0000000000111111, %cx
	shrw	$6, %ax
	movw	%ax, %dx
	andw	$0b0000000000011111, %dx
	popw	%ax

	# Pack 1
	movl	$0, %eax
	movl	$0, %ebx
	movl	$0, %ecx
	movl	$0, %edx
	movw	$13, %ax
	shlw	$6, %ax
	addw	$25, %ax
	shlw	$5, %ax
	addw	$11, %ax

	# Pack 2
	movl	$0, %eax
	movl	$0, %ebx
	movl	$0, %ecx
	movl	$0, %edx
	movw	$8, %ax
	shlw	$6, %ax
	addw	$10, %ax
	shlw	$5, %ax
	addw	$7, %ax

	# Pack 3
	movl	$0, %eax
	movl	$0, %ebx
	movl	$0, %ecx
	movl	$0, %edx
	movw	$12, %ax
	shlw	$6, %ax
	addw	$16, %ax
	shlw	$5, %ax
	addw	$9, %ax

	# begin register print-out
	# @author: Steaphan Greene
	pushf
	pushl	%edi
	pushl	%esi
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	pushl	$.LC0
	call	printf
	popl	%eax
	popl	%eax
	popl	%ebx
	popl	%ecx
	popl	%edx
	popl	%esi
	popl	%edi
	popf
	# end register print-out

# end code
	leave
	ret
	.size	main, .-main
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.3.5"
