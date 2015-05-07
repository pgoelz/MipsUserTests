	.data
	.globl main
	.byte 0xab
ibanstr:
	.asciiz "DE88999999999999999999"
	.text
main:
	la	$a0 ibanstr
	jal	compute_checksum
	move	$a0 $v0
	li	$v0 1
	syscall
	li	$v0 10
	syscall
