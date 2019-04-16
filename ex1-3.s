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
B:  .space  40

        .text
main:
    or  $8, $0, $0 # i
    la  $9, A      # arr A
    la  $10, B     # arr B
    lw  $11, N     # N

loop:
    beq $8, $11, loopend
    lw  $12, 0($9)
    sw  $12, 0($10)
    addi $9, 4
    addi $10, 4
    addi $8, 1
    j loop

loopend: 

exit:   j exit
