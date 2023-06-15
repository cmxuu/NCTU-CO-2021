# fibonacci

.data
N:      .word 7
str:    .string "th number in the Fibonacci sequence is "

.text
main:

    # Load
    lw      a0, N           # a0 <- N
    jal     ra, fib         # jump to fib

    # Print
    mv      a1, a0          # a1 <- a0
    lw      a0, N           # a0 <- N
    jal     ra, print       # jump to print

    # Exit
    li      a0, 10 
    ecall      

fib:

    addi    sp, sp, -24    # push stack for 3 items
    sw      ra, 0(sp)      # save return address
    sw      a0, 8(sp)      # save n

    beq     a0, zero, assign_zero

    addi    t0, a0, -1    
    beq     t0, zero, assign_one

    addi    t0, a0, -2
    bge     t0, zero, fib_recurse  

    addi    sp, sp, 24
    jalr    x0, x1, 0

fib_recurse:

    addi    a0, a0, -1     # n = n - 1
    jal     ra, fib        # f(n-1)
    sw      a0, 16(sp)     # store fib(n-1) 

    lw      a0, 8(sp)      # restore n
    addi    a0, a0, -2     # n = n - 2
    jal     ra, fib        # f(n-2)

    lw      t1, 16(sp)     # restore fib(n-1)
    add     a0, a0, t1     # fib(n-1) + fib(n-2)

    lw      ra, 0(sp)      # restore ra
    addi    sp, sp, 24     # pop stack for 3 items
    ret

assign_zero:

    addi    a0, zero, 0    # fib(0) = 0
    lw      ra, 0(sp)      # restore ra

    addi    sp, sp, 24     # pop 3 stack 
    ret

assign_one:
    addi    a0, zero, 1    # fib(1) = 1
    lw      ra, 0(sp)      # restore ra

    addi    sp, sp, 24     # pop 3 stack
    ret

print:
    mv      t0, a0         # a0: N
    mv      t1, a1         # a1: ans

    # Print integer
    mv      a1, t0 
    li      a0, 1  
    ecall

    # Print str
    la      a1, str
    li      a0, 4
    ecall

    # Print ans
    mv      a1, t1
    li      a0, 1
    ecall

    ret