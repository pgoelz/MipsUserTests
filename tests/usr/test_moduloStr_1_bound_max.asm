	.data
	.globl main
numberstr:
	.asciiz "12345678900987654321354756836478363298384378547845879457823649843974376549785498"
	.text
main:
	la	$a0 numberstr
	li	$a1 80
	la	$a2 0x000000ff
	jal	modulo_str
	move	$a0 $v0
	li	$v0 1
	syscall
	li	$v0 10
	syscall
