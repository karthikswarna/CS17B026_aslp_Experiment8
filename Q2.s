# MIPS program to segregate the given array.
# 'grouping' procedure takes two arguments:
#       $a0 - base address of the array.
#       $a1 - size of the array.
        .data
array:  .word   0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0
size:   .word   15

        .text
main:
    la $a0, array
    lw $a1, size
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal grouping

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
.end main

grouping:
    li $t0, 0                   # loop counter.
    li $t1, 0                   # counter for number of zeroes.
    add $t3, $a0, $zero         # storing the base address of the array.
for:
    lw $t2, 0($a0)
    bne $t2, $zero, no_add      # if $t2 == 0.
    addi $t1, $t1, 1            # no. of zeroes += 1.
no_add:                         # else.
    addi $a0, $a0, 4            # continue.
    addi $t0, $t0, 1
    beq $t0, $a1, Exit
    j for
Exit:

    li $t0, 0                   # loop counter.
    add $a0, $t3, $zero         # reinitializing the base address of the array.
    li $t3, 0
for_2:
    sw $t3, 0($a0)
    addi $a0, $a0, 4
    addi $t0, $t0, 1
    beq $t0, $t1, Exit_2
    j for_2
Exit_2:

    addi $t3, $t3, 1
for_3:
    sw $t3, 0($a0)
    addi $a0, $a0, 4
    addi $t0, $t0, 1
    beq $t0, $a1, Exit_3
    j for_3
Exit_3:    
    jr $ra