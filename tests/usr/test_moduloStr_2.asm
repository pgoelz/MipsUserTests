	.data
	.globl main
numberstr:
	.asciiz "5510761060698380611841159589137463732755737945055467919303059275588678682738032821336038959754502925XYZDKFJ"
	# Alpha characters at the end should not be read
	.text
main:
	la	$a0 numberstr
	li	$a1 100
	li	$a2 4294967279
	jal	modulo_str
	move	$a0 $v0
	li	$v0 36 # print unsigned int
	syscall
	li	$v0 10
	syscall
