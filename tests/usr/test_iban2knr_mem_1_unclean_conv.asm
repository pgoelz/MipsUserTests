	.data
	.globl main
ibanstr:
	.asciiz "DE00111111112222222222"
redzone:
	.byte -1 -1 -1 -1
knrbuf:
	.ascii "hallowelt!"
blzbuf:
	.ascii "hallodu!"
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

	# store pointers
	move	$s5	$gp
	move	$s6	$sp
	move 	$s7	$fp
	
	# end storing

	la	$a0 ibanstr
	la	$a1 blzbuf
	la	$a2 knrbuf
	jal	iban2knr
	
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

verify_redzone:
	la	$a0 redzone
	ulw	$t0 ($a0)
	li	$a0 0
	bne	$t0 0xFFFFFFFF rz_fail
	li	$a0 1
rz_fail:
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
	
