	.data
	.globl main
numberstr:
	.asciiz ""
	.text
main:
	la	$a0 numberstr
	li	$a1 0
	la	$a2 37
	jal	modulo_str
	move	$a0 $v0
	li	$v0 1
	syscall
	li	$v0 10
	syscall
