# gcd

.data
N1:		.word 4
N2:		.word 8
str1:	.string "GCD value of "
str2:	.string " and "
str3:	.string " is "

.text
main:

	# Load
	lw		a0, N1			# a0 <- N1
	lw		a1, N2			# a1 <- N2
	mv		a2, a0			# a2 <- a0 = N1
	jal		ra, gcd			

	# Print
	lw		a0, N1			# a0 <- N1
	lw		a1, N2			# a1 <- N2
	jal 	ra, print		

	# Exit
	li	a0, 10
	ecall

gcd:						# (m, n) = (a0, a1)
	
	addi 	sp, sp, -24		# Push 3 stack
	sw 		ra, 16(sp)
	sw 		a0, 8(sp)
	sw 		a1, 0(sp)

	bne 	a1, zero, Loop	# n != 0 -> call Loop
	addi	a2, a2, 0

	addi 	sp, sp, 24	

	jalr    x0, x1, 0

Loop:	

	mv		a2, a1			# a2 <- a1 = n
	rem		a1, a0, a1		# a1 = m % n
	mv		a0, a2 			# a0 <- a2 = n
	jal		gcd  			# call gcd -> (n, m % n) = (a0, a1)

	lw		ra,	16(sp)
	lw		a0, 8(sp)
	lw		a1, 0(sp)

	addi	sp, sp, 24		# restore stacks
	ret

print:

	mv		t0, a0			# N1
	mv		t1, a1			# N2
	mv 		t2, a2			# gcd(N1, N2)

	# Print str1
	la		a1, str1
	li		a0, 4
	ecall

	# Print N1
	mv		a1, t0
	li		a0, 1
	ecall
	
	# Print str2
	la		a1, str2
	li		a0, 4
	ecall

	# Print N2
	mv		a1, t1
	li		a0, 1
	ecall

	# Print str3
	la		a1, str3
	li		a0, 4
	ecall

	# Print ans
	mv		a1, t2
	li		a0, 1
	ecall

	ret