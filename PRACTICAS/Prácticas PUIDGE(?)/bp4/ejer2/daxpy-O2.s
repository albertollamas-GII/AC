	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta num\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Tiempo(seg): %f\ny[0]=%d, y[N-1]=%d \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
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
	jle	.L15
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, %r12
	cltq
	leaq	18(,%rax,4), %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %r15
	subq	%rax, %rsp
	leaq	3(%rsp), %r13
	shrq	$2, %r13
	testl	%r12d, %r12d
	leaq	0(,%r13,4), %r14
	jle	.L3
	leal	-1(%r12), %eax
	movl	$1, %ebx
	movq	%rax, %r12
	addq	$2, %rax
	.p2align 4,,10
	.p2align 3
.L4:
	movl	%ebx, (%r15,%rbx,4)
	movl	%ebx, (%r14,%rbx,4)
	addq	$1, %rbx
	cmpq	%rax, %rbx
	jne	.L4
	leaq	-96(%rbp), %rsi
	xorl	%edi, %edi
	salq	$2, %rbx
	call	clock_gettime@PLT
	movl	$4, %edx
	.p2align 4,,10
	.p2align 3
.L6:
	imull	$47, (%r15,%rdx), %eax
	addl	%eax, (%r14,%rdx)
	addq	$4, %rdx
	cmpq	%rdx, %rbx
	jne	.L6
.L7:
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	movslq	%r12d, %r12
	call	clock_gettime@PLT
	movq	-72(%rbp), %rax
	subq	-88(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	(%r14,%r12,4), %ecx
	pxor	%xmm1, %xmm1
	movl	0(,%r13,4), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	-80(%rbp), %rax
	subq	-96(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L16
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
.L3:
	.cfi_restore_state
	leaq	-96(%rbp), %rsi
	xorl	%edi, %edi
	subl	$1, %r12d
	call	clock_gettime@PLT
	jmp	.L7
.L16:
	call	__stack_chk_fail@PLT
.L15:
	movq	stderr(%rip), %rcx
	leaq	.LC0(%rip), %rdi
	movl	$10, %edx
	movl	$1, %esi
	call	fwrite@PLT
	orl	$-1, %edi
	call	exit@PLT
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
