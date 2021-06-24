	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta num\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
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
	subq	$72, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L33
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, %r14
	cltq
	leaq	18(,%rax,4), %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	leaq	3(%rsp), %rcx
	subq	%rax, %rsp
	leaq	3(%rsp), %r12
	shrq	$2, %rcx
	shrq	$2, %r12
	testl	%r14d, %r14d
	leaq	0(,%rcx,4), %r15
	leaq	0(,%r12,4), %rbx
	jle	.L3
	leaq	4(%r15), %rax
	leal	-1(%r14), %r13d
	movl	$5, %esi
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %edx
	cmpl	$5, %edx
	cmovb	%esi, %edx
	cmpl	%edx, %r13d
	jb	.L17
	testl	%eax, %eax
	movl	$1, -104(%rbp)
	je	.L5
	cmpl	$1, %eax
	movl	$1, 4(,%rcx,4)
	movl	$1, 4(,%r12,4)
	je	.L19
	cmpl	$3, %eax
	movl	$2, 8(,%rcx,4)
	movl	$2, 8(,%r12,4)
	jne	.L20
	movl	$3, 12(,%rcx,4)
	movl	$3, 12(,%r12,4)
	movl	$4, -104(%rbp)
.L5:
	movd	-104(%rbp), %xmm2
	movl	%r14d, %edi
	leaq	4(,%rax,4), %rsi
	subl	%eax, %edi
	movdqa	.LC2(%rip), %xmm1
	pshufd	$0, %xmm2, %xmm0
	movl	%edi, %r8d
	leaq	(%r15,%rsi), %r9
	shrl	$2, %r8d
	addq	%rbx, %rsi
	xorl	%eax, %eax
	xorl	%edx, %edx
	paddd	.LC1(%rip), %xmm0
	.p2align 4,,10
	.p2align 3
.L7:
	addl	$1, %edx
	movaps	%xmm0, (%r9,%rax)
	movups	%xmm0, (%rsi,%rax)
	paddd	%xmm1, %xmm0
	addq	$16, %rax
	cmpl	%edx, %r8d
	ja	.L7
	movl	%edi, %edx
	movl	-104(%rbp), %eax
	andl	$-4, %edx
	addl	%edx, %eax
	cmpl	%edx, %edi
	je	.L8
.L4:
	movslq	%eax, %rdx
	movl	%eax, (%r15,%rdx,4)
	movl	%eax, (%rbx,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r14d
	jl	.L8
	movslq	%edx, %rsi
	movl	%edx, (%r15,%rsi,4)
	movl	%edx, (%rbx,%rsi,4)
	leal	2(%rax), %edx
	cmpl	%edx, %r14d
	jl	.L8
	movslq	%edx, %rsi
	movl	%edx, (%r15,%rsi,4)
	movl	%edx, (%rbx,%rsi,4)
	leal	3(%rax), %edx
	cmpl	%edx, %r14d
	jl	.L8
	movslq	%edx, %rsi
	movl	%edx, (%r15,%rsi,4)
	movl	%edx, (%rbx,%rsi,4)
	leal	4(%rax), %edx
	cmpl	%edx, %r14d
	jl	.L8
	addl	$5, %eax
	movslq	%edx, %rsi
	cmpl	%eax, %r14d
	movl	%edx, (%r15,%rsi,4)
	movl	%edx, (%rbx,%rsi,4)
	jl	.L8
	movslq	%eax, %rdx
	movl	%eax, (%r15,%rdx,4)
	movl	%eax, (%rbx,%rdx,4)
.L8:
	leaq	-96(%rbp), %rsi
	xorl	%edi, %edi
	movq	%rcx, -104(%rbp)
	call	clock_gettime@PLT
	leaq	4(%rbx), %rax
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	leal	3(%rax), %edx
	cmpl	%r13d, %edx
	ja	.L21
	testl	%eax, %eax
	movl	$1, %esi
	je	.L13
	movq	-104(%rbp), %rcx
	imull	$47, 4(,%rcx,4), %edx
	addl	%edx, 4(%rbx)
	cmpl	$1, %eax
	je	.L23
	imull	$47, 8(,%rcx,4), %edx
	addl	%edx, 8(%rbx)
	cmpl	$3, %eax
	jne	.L24
	imull	$47, 12(,%rcx,4), %edx
	movl	$4, %esi
	addl	%edx, 12(%rbx)
.L13:
	movl	%r14d, %edi
	leaq	4(,%rax,4), %rcx
	xorl	%edx, %edx
	subl	%eax, %edi
	xorl	%eax, %eax
	movl	%edi, %r8d
	leaq	(%r15,%rcx), %r9
	addq	%rbx, %rcx
	shrl	$2, %r8d
	.p2align 4,,10
	.p2align 3
.L10:
	movdqu	(%r9,%rax), %xmm1
	addl	$1, %edx
	movdqa	%xmm1, %xmm0
	pslld	$1, %xmm0
	paddd	%xmm1, %xmm0
	pslld	$4, %xmm0
	psubd	%xmm1, %xmm0
	paddd	(%rcx,%rax), %xmm0
	movaps	%xmm0, (%rcx,%rax)
	addq	$16, %rax
	cmpl	%r8d, %edx
	jb	.L10
	movl	%edi, %edx
	andl	$-4, %edx
	cmpl	%edx, %edi
	leal	(%rdx,%rsi), %eax
	je	.L15
.L12:
	movslq	%eax, %rdx
	imull	$47, (%r15,%rdx,4), %ecx
	addl	%ecx, (%rbx,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r14d
	jl	.L15
	movslq	%edx, %rdx
	imull	$47, (%r15,%rdx,4), %ecx
	addl	%ecx, (%rbx,%rdx,4)
	leal	2(%rax), %edx
	cmpl	%edx, %r14d
	jl	.L15
	movslq	%edx, %rdx
	imull	$47, (%r15,%rdx,4), %ecx
	addl	%ecx, (%rbx,%rdx,4)
	leal	3(%rax), %edx
	cmpl	%edx, %r14d
	jl	.L15
	movslq	%edx, %rdx
	imull	$47, (%r15,%rdx,4), %ecx
	addl	%ecx, (%rbx,%rdx,4)
	leal	4(%rax), %edx
	cmpl	%edx, %r14d
	jl	.L15
	movslq	%edx, %rdx
	addl	$5, %eax
	imull	$47, (%r15,%rdx,4), %ecx
	addl	%ecx, (%rbx,%rdx,4)
	cmpl	%eax, %r14d
	jl	.L15
	cltq
	imull	$47, (%r15,%rax,4), %edx
	addl	%edx, (%rbx,%rax,4)
.L15:
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	movslq	%r13d, %r13
	call	clock_gettime@PLT
	movq	-72(%rbp), %rax
	pxor	%xmm0, %xmm0
	subq	-88(%rbp), %rax
	pxor	%xmm1, %xmm1
	movl	(%rbx,%r13,4), %ecx
	movl	0(,%r12,4), %edx
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	-80(%rbp), %rax
	subq	-96(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	jne	.L34
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
.L19:
	.cfi_restore_state
	movl	$2, -104(%rbp)
	jmp	.L5
.L23:
	movl	$2, %esi
	jmp	.L13
.L3:
	leaq	-96(%rbp), %rsi
	xorl	%edi, %edi
	leal	-1(%r14), %r13d
	call	clock_gettime@PLT
	jmp	.L15
.L20:
	movl	$3, -104(%rbp)
	jmp	.L5
.L24:
	movl	$3, %esi
	jmp	.L13
.L17:
	movl	$1, %eax
	jmp	.L4
.L21:
	movl	$1, %eax
	jmp	.L12
.L34:
	call	__stack_chk_fail@PLT
.L33:
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
