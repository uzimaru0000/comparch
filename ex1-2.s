    .data
N:  .word   10
A:  .word   8
    .word   4
    .word   7
    .word   12
    .word   13
    .word   19
    .word   23
    .word   43
    .word   56
    .word   32
S:  .word   0

    .text
main:   or  $8, $0, $0 # i
        la  $9, A # addr
        or  $10, $0, $0 # sum
        lw  $11, N
loop:   beq $8, $11, loopend
        lw  $12, 0($9)
        add $10, $10, $12
        addi $9, $9, 4 # addr + 4
        addi $8, $8, 1 # i++
        j   loop

loopend: sw $10, S

exit:   j   exit
