.data
N: .word 10 # Number of data
str1: .string "Array: "
str2: .string "Sorted: \n"
str3: .string " "
str4: .string "\n"
data: .word 5, 3, 6, 7, 31, 23, 43, 12, 45, 1

.text
main:

	# Print "Array:"
	la		a1, str1
	li		a0, 4
	ecall

	# Print "\n"
	la		a1, str4
	li		a0, 4
	ecall

	# Print array
	jal		ra, printArray

	# Bubble sort
	jal		ra, bubblesort

	# Print "Sorted:"
	la		a1, str2
	li		a0, 4
	ecall

	# Print array
	jal		printArray

	# Exit program
	li		a0, 10
	ecall

# t0: i
# t1: j
# t2: N
# t3: data
bubblesort:

	# save reg
	addi	sp, sp, -8
	sw		ra, 0(sp)

	li		t0, 0		# t0 = i = 0
	lw		t2, N		# t2 = N

outer_loop:

	bge		t0, t2, outer_loop_end		# if i >= N, call outer_loop_end
	addi	t1, t0, -1					# t1 = j = i - 1

inner_loop:

	blt		t1, zero, inner_loop_end	# if j < 0, call inner_loop_end
	la		t3, data					# t3 = array
	
	#every integer is 4 byte in this program, so when you want get data[1]
	#you have to go to addres (data + 4)
	#t1 is index i
	#slli t6, t1, 2 means t6 = t1 * 4
	slli	t6, t1, 2					# t6 = j + 1
	add		t3, t3, t6					# t3 = t3 + (j + 1)
	lw		t4, 0(t3)					# t4 = arr[j]
	lw		t5, 4(t3)					# t5 = arr[j + 1]
	
	bge		t5, t4, inner_loop_end		# if arr[j + 1] >= arr[j], call inner_loop_end 

	la		a0, data					# a0 <- array
	mv		a1, t1						# a1 <- j
	jal		ra, swap	
	
	addi	t1, t1, -1					# j = j - 1
	j		inner_loop

inner_loop_end:

	addi	t0, t0, 1					# i = i + 1
	j outer_loop

outer_loop_end:

	# Function complete
	lw		ra, 0(sp)
	addi	sp, sp, 8
	ret

swap:

	# t0, t1, t2 will be used later, so you have to save it.
	addi	sp, sp, -24
	sw		t0, 0(sp)
	sw		t1, 8(sp)
	sw		t2, 16(sp)

	# befor we call this function, we store index j in a1, and data address in a0
	# now we shift index j by 2 and add to a0 to get real address of data[j]
	slli	a1, a1, 2
	add		t1, a0, a1

	# swap data[j] and data[j+1]
	lw		t0, 0(t1)
	lw		t2, 4(t1)
	sw		t2, 0(t1)
	sw		t0, 4(t1)
	
	# take back t0, t1, t2
	lw		t0, 0(sp)
	lw		t1, 8(sp)
	lw		t2, 16(sp)
	addi	sp, sp, 24

	ret

## t0 :i
## t1 : N
## t2: data
## t3:char of data
printArray:

    li		t0, 0
    lw		t1, N

printArray_for:

    bge		t0, t1, printArray_for_End
    
    la		t2, data
    slli	t4, t0, 2
    add		t2, t2, t4

	# Print arr[i]
    lb		a1, 0(t2)
    li		a0, 1
    ecall 

	# Print space
    la		a1, str3
    li		a0, 4
    ecall

    addi	t0, t0, 1
    j		printArray_for

printArray_for_End:

    la		a1, str4
    li		a0, 4
    ecall 
    ret