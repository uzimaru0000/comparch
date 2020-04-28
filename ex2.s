    .data
A:  .word 13
B:  .word 37
C:  .word 0

    .text
main:
    lw $8, A # load A
    lw $9, B # load B
    addi $10, $0, 1 # mask
    addi $11, $0, 0 # i
    addi $12, $0, 16 # N
    addi $14, $0, 0 # ans

loop:
    beq $11, $12, loopend
    and $24, $8, $10
    beq $24, $0, inc
    add $14, $14, $9
    j inc

inc:
    addi $11, $11, 1
    add $10, $10, $10
    add $9, $9, $9
    j loop

loopend:
    sw $14, C
    
exit:
    j exit


