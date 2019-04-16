        .data
A:      .word   19
B:      .word   75
C:      .word   0

        .text
main:   lw  $8, A
        lw  $9, B
        add $10, $8, $9
        sw  $10, C
exit: j exit
