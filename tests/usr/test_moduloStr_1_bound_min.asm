	.data
	.globl main
numberstr:
	.asciiz "12"
	.text
main:
	la	$a0 numberstr
	li	$a1 2
	la	$a2 0x0000000f
	jal	modulo_str
	move	$a0 $v0
	li	$v0 1
	syscall
	li	$v0 10
	syscall
