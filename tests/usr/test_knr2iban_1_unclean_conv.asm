	.data
	.globl main
testblz:
	.asciiz "12345678"
testknr:
	.asciiz "1234567890"
ibanbuf:
	.ascii "12345678900987654321abc"
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
	# check pointer
	bne	$s5	$gp	fail
	bne	$s6	$sp	fail
	bne	$s7	$fp	fail
	
	# end storing
	
	
	la	$a0 ibanbuf
	la	$a1 testblz
	la	$a2 testknr
	jal	knr2iban
	li	$v0 10
	la	$a0 ibanbuf
	li	$a1 22
	
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
	
	jal	println_range
	syscall
	li	$v0 10
	syscall
	
fail:

	li	$v0 4
	la $a0 error
	syscall
	li	$v0 10
	syscall
