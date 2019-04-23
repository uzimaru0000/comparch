    .data
A:  .word 0
    .word 1
    .word 0
    .word 0
    .word 2
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 3
    .word 0
    .word 0
    .word 4
    .word 0
B:  .word 1
    .word 2
    .word 3
    .word 4
    .word 5
    .word 6
    .word 7
    .word 8
    .word 9
    .word 10
    .word 11
    .word 12
    .word 13
    .word 14
    .word 15
    .word 16
C:  .space 64
N:  .word 4
M:  .word 4

    .text
main:
    la $8, A
    la $9, B
    la $10, C
    lw $11, N
    lw $12, M
    add $13, $0, $0 # sum
    add $14, $0, $0 # init i
    add $15, $0, $0 # init j
    add $24, $0, $0 # init k

out_loop:
    beq $14, $11, loopend # i == N
    add $15, $0, $0 # init j
    in_loop:
        beq $15, $12, out_inc # j == M
        add $13, $0, $0 # sum = 0
        add $24, $0, $0 # init k
        loop:
            beq $24, $12, in_loopend # k == M

            add $4, $14, $0
            addi $5, $0, 4
            jal MUL # i * 4
            add $4, $2, $24 # i * 4 + k
            addi $5, $0, 4
            jal MUL # (i * 4 + k) * 4
            add $8, $8, $2 # addr + (i * 4 + k) * 4

            add $4, $24, $0
            addi $5, $0, 4
            jal MUL # k * 4
            add $4, $2, $15 # k * 4 + j
            addi $5, $0, 4
            jal MUL # (k * 4 + j) * 4
            add $9, $9, $2 # addr + (k * 4 + j) * 4

            lw $4, 0($8) # m1
            lw $5, 0($9) # m2
            jal MUL # m1 * m2
            add $13, $13, $2 # sum += m1 * m2
            
            addi $24, $24, 1
            la $8, A
            la $9, B
            j loop

in_loopend:
    add $4, $14, 0
    addi $5, $0, 4
    jal MUL
    add $4, $2, $15
    addi $5, $0, 4
    jal MUL
    add $10, $10, $2

    sw $13, 0($10)
    addi $15, $15, 1
    la $10, C
    j in_loop

out_inc:
    addi $14, $14, 1
    j out_loop

loopend:

exit: j exit

MUL:
    addi $16, $0, 1 # mask
    addi $17, $0, 0 # i
    addi $18, $0, 16 # N
    addi $2, $0, 0 # ans

MUL_loop:
    beq $17, $18, MUL_exit
    and $19, $4, $16
    beq $19, $0, MUL_inc
    addu $2, $2, $5
    j MUL_inc

MUL_inc:
    addi $17, $17, 1
    addu $16, $16, $16
    addu $5, $5, $5
    j MUL_loop

MUL_exit:
    jr $ra
