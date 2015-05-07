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
	
	# check pointer
	bne	$s5	$gp	fail
	bne	$s6	$sp	fail
	bne	$s7	$fp	fail
	
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
	
	# check pointer
	bne	$s5	$gp	fail
	bne	$s6	$sp	fail
	bne	$s7	$fp	fail
	
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
