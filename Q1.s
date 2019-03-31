# MIPS program to find the count of a number in a given array.
# 'num_count' procedure takes three arguments:
#       $a0 - base address of the array.
#       $a1 - size of the array.
#       $a2 - number whose frequency should be found.
        .data
array:  .word   2, 9, 75, 6, 35, 98, 2, 7, 5, 2
size:   .word   10
num:    .word   2
count:  .word   0

        .text

main:
    la $a0, array
    lw $a1, size
    lw $a2, num
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal num_count 

    sw $v0, count
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
.end main

num_count:
    li $t0, 0
    li $v0, 0
for:
    lw $t1, 0($a0)
    bne $t1, $a2, no_add
    addi $v0, $v0, 1
no_add:
    addi $a0, $a0, 4
    addi $t0, $t0, 1
    beq $t0, $a1, Exit
    j for
Exit:
    jr $ra