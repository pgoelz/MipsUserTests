	.data
	.globl main
numberstr:
	.asciiz "9999999999999999999999345678900987654321354756836478363298384378547845879457823649843974376549785498"
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
	
	la	$a0 numberstr
	li	$a1 100
	la	$a2 0xffffffff
	jal	modulo_str
	
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
	
	move	$a0 $v0
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
