	.data
	.globl main
testblz:
	.asciiz "12345678"
testknr:
	.asciiz "1234567890"
ibanbuf:
	.ascii "12345678900987654321abc"
	.text
main:	
	la	$a0 ibanbuf
	la	$a1 testblz
	la	$a2 testknr
	jal	knr2iban
	li	$v0 10
	la	$a0 ibanbuf
	li	$a1 22
	jal	println_range
	syscall
