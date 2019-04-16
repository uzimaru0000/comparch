        .data
n:      .word 15
s:      .word 0

        .text
main:   or  $8, $0, $0
        lw  $9, n
        or  $10, $0, $0

loop:   beq $8, $9, loopend
        addi $8, $8, 1
        add $10, $10, $8
        j   loop

loopend: sw $10, s

exit:   j   exit
