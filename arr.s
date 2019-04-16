        .data
A:      .word 19
        .word 75
        .word 10
        .word 15
S:      .word 0

        .text
main:   or   $8, $0, $0
        la   $9, A

        lw   $10, 0($9)
        add  $8, $8, $10
        addi $9, $9, 4

        lw   $10, 0($9)
        add  $8, $8, $10
        addi $9, $9, 4

        lw   $10, 0($9)
        add  $8, $8, $10
        addi $9, $9, 4

        lw   $10, 0($9)
        add  $8, $8, $10

        sw   $8, S
exit:   j exit
