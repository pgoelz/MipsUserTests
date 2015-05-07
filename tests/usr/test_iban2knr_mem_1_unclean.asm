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
	.text
main:
	la	$a0 ibanstr
	la	$a1 blzbuf
	la	$a2 knrbuf
	jal	iban2knr
	
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
	
