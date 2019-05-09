    .data
N:  .word 8
FN: .word 0

.text
main:
    lw $a0, N
    jal fact
    sw $v0, FN
    exit: j exit

fact:
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)

    slti $t0, $a0, 1 # $t0 = $a0 < 1 ? 1 : 0
    beq $t0, $0, L1

    addi $v0, $0, 1
    addi $sp, $sp, 8
    jr $ra

L1:
    addi $a0, $a0, -1
    jal fact
    lw $a0, 0($sp)
    add $a1, $0, $v0
    jal MUL
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra

MUL:
    addi $s0, $0, 1 # mask
    addi $s1, $0, 0 # i
    addi $s2, $0, 16 # N
    addi $s4, $0, 0 # ans

MUL_loop:
    beq $s1, $s2, MUL_exit
    and $s3, $a0, $s0
    beq $s3, $0, MUL_inc
    addu $s4, $s4, $a1
    j MUL_inc

MUL_inc:
    addi $s1, $s1, 1
    addu $s0, $s0, $s0
    addu $a1, $a1, $a1
    j MUL_loop

MUL_exit:
    add $v0, $0, $s4
    jr $ra
