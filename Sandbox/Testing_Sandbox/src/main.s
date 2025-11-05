	.file	"main.adb"
	.text
	.align 2
	.def	main__porcentajePredicate.0;	.scl	3;	.type	32;	.endef
	.seh_proc	main__porcentajePredicate.0
main__porcentajePredicate.0:
.LFB2:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, %eax
	movb	%al, 16(%rbp)
	movq	%r10, -8(%rbp)
	movzbl	16(%rbp), %eax
	movsbw	%al, %dx
	imull	$103, %edx, %edx
	shrw	$8, %dx
	sarb	%dl
	movl	%eax, %ecx
	sarb	$7, %cl
	subl	%ecx, %edx
	movl	%edx, %ecx
	sall	$2, %ecx
	addl	%edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	testb	%dl, %dl
	sete	%al
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Introduce porcentaje m\372ltiplo de 5: "
.LC5:
	.ascii "main.adb"
	.space 1
	.align 8
.LC6:
	.ascii "Dynamic_Predicate failed at main.adb:27"
.LC7:
	.ascii "Porcentaje v\341lido: "
	.align 8
.LC0:
	.long	1
	.long	36
	.align 8
.LC1:
	.long	1
	.long	39
	.align 8
.LC2:
	.long	1
	.long	4
	.align 8
.LC3:
	.long	1
	.long	19
	.text
	.align 2
	.globl	_ada_main
	.def	_ada_main;	.scl	2;	.type	32;	.endef
	.seh_proc	_ada_main
_ada_main:
.LFB1:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
.LEHB0:
	subq	$232, %rsp
	.seh_stackalloc	232
	leaq	224(%rsp), %rbp
	.seh_setframe	%rbp, 224
.LEHE0:
	.seh_endprologue
	call	__main
	leaq	80(%rbp), %rax
	movq	%rax, -64(%rbp)
	leaq	.LC4(%rip), %r14
	leaq	.LC0(%rip), %r15
	movq	%r14, -96(%rbp)
	movq	%r15, -88(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
.LEHB1:
	call	ada__text_io__put__4
	movl	$0, %ecx
	call	ada__integer_text_io__get__2
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	js	.L4
	cmpl	$100, -4(%rbp)
	jle	.L5
.L4:
	movl	$27, %edx
	leaq	.LC5(%rip), %rcx
	call	__gnat_rcheck_CE_Range_Check
.L5:
	cmpl	$-128, -4(%rbp)
	jl	.L6
	cmpl	$127, -4(%rbp)
	jle	.L7
.L6:
	movl	$27, %edx
	leaq	.LC5(%rip), %rcx
	call	__gnat_rcheck_CE_Overflow_Check
.L7:
	movl	-4(%rbp), %eax
	movsbl	%al, %eax
	leaq	-64(%rbp), %rdx
	movq	%rdx, %r10
	movl	%eax, %ecx
	call	main__porcentajePredicate.0
	xorl	$1, %eax
	testb	%al, %al
	je	.L8
	leaq	.LC6(%rip), %r12
	leaq	.LC1(%rip), %r13
	movq	%r12, -96(%rbp)
	movq	%r13, -88(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	system__assertions__raise_assert_failure
.LEHE1:
.L8:
	movl	-4(%rbp), %eax
	movb	%al, -5(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rbx
	leaq	-68(%rbp), %rax
	movq	%rax, -192(%rbp)
	leaq	.LC2(%rip), %rax
	movq	%rax, -184(%rbp)
	movsbl	-5(%rbp), %eax
	movdqa	-192(%rbp), %xmm0
	movaps	%xmm0, -96(%rbp)
	leaq	-96(%rbp), %rdx
	movl	%eax, %ecx
.LEHB2:
	call	system__img_int__impl__image_integer
.LEHE2:
	movl	%eax, %edx
	movl	$0, %eax
	testl	%edx, %edx
	cmovns	%edx, %eax
	addl	$19, %eax
	movl	%eax, -12(%rbp)
	movl	$0, %eax
	cmpl	$0, -12(%rbp)
	cmovns	-12(%rbp), %eax
	cltq
	movq	%rax, -24(%rbp)
	movl	$0, %eax
	cmpl	$0, -12(%rbp)
	cmovns	-12(%rbp), %eax
	cltq
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
.LEHB3:
	call	___chkstk_ms
.LEHE3:
	subq	%rax, %rsp
	leaq	32(%rsp), %rax
	addq	$0, %rax
	movq	%rax, -32(%rbp)
	leaq	-68(%rbp), %rax
	movq	%rax, -176(%rbp)
	movl	$1, -56(%rbp)
	movl	%edx, -52(%rbp)
	leaq	-56(%rbp), %rax
	movq	%rax, -168(%rbp)
	leaq	.LC7(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	movq	-32(%rbp), %rax
	movq	%rax, -160(%rbp)
	movl	$1, -48(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -44(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, -152(%rbp)
	movdqa	-160(%rbp), %xmm1
	movaps	%xmm1, -96(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdi, -104(%rbp)
	movdqa	-176(%rbp), %xmm2
	movaps	%xmm2, -128(%rbp)
	leaq	-128(%rbp), %rcx
	leaq	-112(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
.LEHB4:
	call	system__concat_2__str_concat_2
	movq	-32(%rbp), %rax
	movq	%rax, -144(%rbp)
	movl	$1, -40(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -36(%rbp)
	leaq	-40(%rbp), %rax
	movq	%rax, -136(%rbp)
	movdqa	-144(%rbp), %xmm3
	movaps	%xmm3, -96(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	ada__text_io__put_line__2
.LEHE4:
.LEHB5:
	movq	%rbx, %rsp
	jmp	.L3
.L14:
	movq	%rbx, %rsp
	jmp	.L11
.L13:
.L11:
	cmpq	$1, %rdx
	je	.L12
	movq	%rax, %rcx
	call	_Unwind_Resume
.L12:
	movq	%rax, %rcx
	call	__gnat_unhandled_except_handler
.L3:
	nop
	leaq	8(%rbp), %rsp
.LEHE5:
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.def	__gnat_personality_seh0;	.scl	2;	.type	32;	.endef
	.seh_handler	__gnat_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA1:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT1-.LLSDATTD1
.LLSDATTD1:
	.byte	0x1
	.uleb128 .LLSDACSE1-.LLSDACSB1
.LLSDACSB1:
	.uleb128 .LEHB0-.LFB1
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB1
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L13-.LFB1
	.uleb128 0x1
	.uleb128 .LEHB2-.LFB1
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L14-.LFB1
	.uleb128 0x3
	.uleb128 .LEHB3-.LFB1
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB4-.LFB1
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L14-.LFB1
	.uleb128 0x3
	.uleb128 .LEHB5-.LFB1
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE1:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	.LDFCM0-.
.LLSDATT1:
	.text
	.seh_endproc
	.data
	.align 8
.LDFCM0:
	.quad	__gnat_unhandled_others_value
	.ident	"GCC: (GNU) 10.3.1 20210520 (for GNAT Community 2021 20210519)"
	.def	ada__text_io__put__4;	.scl	2;	.type	32;	.endef
	.def	ada__integer_text_io__get__2;	.scl	2;	.type	32;	.endef
	.def	__gnat_rcheck_CE_Range_Check;	.scl	2;	.type	32;	.endef
	.def	__gnat_rcheck_CE_Overflow_Check;	.scl	2;	.type	32;	.endef
	.def	system__assertions__raise_assert_failure;	.scl	2;	.type	32;	.endef
	.def	system__img_int__impl__image_integer;	.scl	2;	.type	32;	.endef
	.def	system__concat_2__str_concat_2;	.scl	2;	.type	32;	.endef
	.def	ada__text_io__put_line__2;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	__gnat_unhandled_except_handler;	.scl	2;	.type	32;	.endef
