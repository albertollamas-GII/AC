	.file	"Listado1.c"
	.text
	.comm	v1,268435456,32
	.comm	v2,268435456,32
	.comm	v3,268435456,32
	.section	.rodata
	.align 8
.LC0:
	.string	"Faltan n\302\272 componentes del vector"
	.align 8
.LC3:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Vectores:%u\n"
	.align 8
.LC4:
	.string	"/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n"
	.align 8
.LC5:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$1, -68(%rbp)
	jg	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$-1, %edi
	call	exit@PLT
.L2:
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -60(%rbp)
	cmpl	$33554432, -60(%rbp)
	jbe	.L3
	movl	$33554432, -60(%rbp)
.L3:
	movl	$0, -64(%rbp)
	jmp	.L4
.L9:
	movl	-60(%rbp), %eax
	testq	%rax, %rax
	js	.L5
	cvtsi2sdq	%rax, %xmm0
	jmp	.L6
.L5:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L6:
	movsd	.LC1(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	cvtsi2sd	-64(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	v1(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	movl	-60(%rbp), %eax
	testq	%rax, %rax
	js	.L7
	cvtsi2sdq	%rax, %xmm0
	jmp	.L8
.L7:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L8:
	movsd	.LC1(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvtsi2sd	-64(%rbp), %xmm1
	movsd	.LC1(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	v2(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	addl	$1, -64(%rbp)
.L4:
	movl	-64(%rbp), %eax
	cmpl	%eax, -60(%rbp)
	ja	.L9
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -64(%rbp)
	jmp	.L10
.L11:
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	v1(%rip), %rax
	movsd	(%rdx,%rax), %xmm1
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	v2(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	addsd	%xmm1, %xmm0
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	v3(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	addl	$1, -64(%rbp)
.L10:
	movl	-64(%rbp), %eax
	cmpl	%eax, -60(%rbp)
	ja	.L11
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	cmpl	$9, -60(%rbp)
	ja	.L12
	movl	-60(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	leaq	.LC3(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, -64(%rbp)
	jmp	.L13
.L14:
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	v3(%rip), %rax
	movsd	(%rdx,%rax), %xmm1
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	v2(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	v1(%rip), %rax
	movq	(%rdx,%rax), %rsi
	movl	-64(%rbp), %ecx
	movl	-64(%rbp), %edx
	movl	-64(%rbp), %eax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rsi, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$3, %eax
	call	printf@PLT
	addl	$1, -64(%rbp)
.L13:
	movl	-64(%rbp), %eax
	cmpl	%eax, -60(%rbp)
	ja	.L14
	jmp	.L15
.L12:
	movl	-60(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %eax
	leaq	0(,%rax,8), %rdx
	leaq	v3(%rip), %rax
	movsd	(%rdx,%rax), %xmm5
	movl	-60(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %eax
	leaq	0(,%rax,8), %rdx
	leaq	v2(%rip), %rax
	movsd	(%rdx,%rax), %xmm4
	movl	-60(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %eax
	leaq	0(,%rax,8), %rdx
	leaq	v1(%rip), %rax
	movsd	(%rdx,%rax), %xmm3
	movl	-60(%rbp), %eax
	leal	-1(%rax), %edi
	movl	-60(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	-1(%rax), %edx
	movsd	v3(%rip), %xmm2
	movsd	v2(%rip), %xmm1
	movsd	v1(%rip), %xmm0
	movl	-60(%rbp), %esi
	movq	-56(%rbp), %rax
	movapd	%xmm5, %xmm6
	movapd	%xmm4, %xmm5
	movapd	%xmm3, %xmm4
	movl	%edi, %r8d
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$7, %eax
	call	printf@PLT
.L15:
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	2576980378
	.long	1069128089
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
