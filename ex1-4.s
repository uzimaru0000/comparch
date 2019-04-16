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
    
    .text
main:
    # init
    or  $8, $0, $0 # i = 0
    la  $11, A      # arr A
    lw  $12, N     # N

outloop:
    slt $24, $8, $12 # i < N
    beq $24, $0, loopend # goto loopend
    or  $9, $0, $0 # j = 0
    or  $10, $11, $0 # tmp A
    inloop:
        sub $25, $12, $8 # N-i
        addi $24, $9, 1
        slt $24, $24, $25 # j+1 < N-i
        beq $24, $0, outinc # inloopend
        
        lw $14, 0($10) # A[j]
        lw $15, 4($10) # A[j+1]
        
        slt $24, $15, $14 # A[j+1] < A[j]
        beq $24, $0, ininc # back
        sw $15, 0($10) # A[j] = A[j+1]
        sw $14, 4($10) # A[j+1] = A[j]

        j ininc # back

outinc:
   addi $8, $8, 1 # i++
   addi $11, $11, 4
   j outloop

ininc:
   addi $9, $9, 1 # j++
   addi $10, $10, 4
   j inloop

loopend:

exit:
    j   exit
