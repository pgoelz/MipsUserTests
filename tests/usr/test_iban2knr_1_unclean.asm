	.data
	.globl main
ibanstr:
	.asciiz "DE00546574837913256478"
knrbuf:
	.asciiz "abcdefghij"
blzbuf:
	.asciiz "klmnopqr"
	.text
main:
	la	$a0 ibanstr
	la	$a1 blzbuf
	la	$a2 knrbuf
	jal	iban2knr
	la	$a0 blzbuf
	li	$a1 8
	jal	println_range
	la	$a0 knrbuf
	li	$a1 10
	jal	println_range
	li	$v0 10
	syscall
