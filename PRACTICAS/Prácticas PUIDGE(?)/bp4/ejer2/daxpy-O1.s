	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta num\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Tiempo(seg): %f\ny[0]=%d, y[N-1]=%d \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L14
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol@PLT
	movq	%rax, %r13
	movl	%eax, %ecx
	cltq
	leaq	18(,%rax,4), %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %r12
	subq	%rax, %rsp
	leaq	3(%rsp), %r14
	shrq	$2, %r14
	leaq	0(,%r14,4), %r15
	movq	%r15, %rbx
	testl	%r13d, %r13d
	jle	.L3
	movl	$1, %eax
.L4:
	movslq	%eax, %rdx
	movl	%eax, (%r12,%rdx,4)
	movl	%eax, (%rbx,%rdx,4)
	addl	$1, %eax
	cmpl	%ecx, %eax
	jle	.L4
	leaq	-96(%rbp), %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	leal	-1(%r13), %eax
	leaq	8(,%rax,4), %rcx
	movl	$4, %eax
.L6:
	imull	$47, (%r12,%rax), %edx
	addl	%edx, (%rbx,%rax)
	addq	$4, %rax
	cmpq	%rcx, %rax
	jne	.L6
.L7:
	leaq	-80(%rbp), %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	subl	$1, %r13d
	movslq	%r13d, %r13
	movl	(%r15,%r13,4), %ecx
	movq	-72(%rbp), %rax
	subq	-88(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC1(%rip), %xmm0
	movq	-80(%rbp), %rax
	subq	-96(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movl	0(,%r14,4), %edx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	movq	-56(%rbp), %rdi
	xorq	%fs:40, %rdi
	jne	.L15
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L14:
	.cfi_restore_state
	movq	stderr(%rip), %rcx
	movl	$10, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movl	$-1, %edi
	call	exit@PLT
.L3:
	leaq	-96(%rbp), %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	jmp	.L7
.L15:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
