	.data
	.globl main
	.byte 0xab
ibanstr:
	.asciiz "DE88999999999999999999"
error:
	.asciiz "Callee save error!"
	.text
main:

	# store custom values in register
	li $s0 3
	li $s1 6
	li $s2 9
	li $s3 12
	li $s4 15
	li $s5 18
	li $s6 21
	li $s7 24
	li $gp 27
	li $sp 30
	li $fp 33
	# end storing
	
	la	$a0 ibanstr
	jal	compute_checksum
	move	$a0 $v0
	
	# check custom values from register
	bne $s0 3  fail
	bne $s1 6  fail
	bne $s2 9  fail
	bne $s3 12 fail
	bne $s4 15 fail
	bne $s5 18 fail
	bne $s6 21 fail
	bne $s7 24 fail
	bne $gp 27 fail
	bne $sp 30 fail
	bne $fp 33 fail
	# end checking
	
	li	$v0 1
	syscall
	li	$v0 10
	syscall
	
fail:

	li	$v0 4
	la $a0 error
	syscall
	li	$v0 10
	syscall
