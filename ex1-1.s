        .data
A:      .word 19
B:      .word 75
C:      .word 10
S:      .word 0
        
        .text
main:   lw  $8, A
        lw  $9, B
        lw  $10, C
        add $11, $8, $9
        sub $11, $11, $10
        ori $11, $11, 3
        sw  $11, S
exit:   j exit
