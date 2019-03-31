# MIPS program to reverse a string.
# 'reverse' procedure takes two arguments:
#       $a0 - base address of the array.
#       $a1 - size of the array.
# 'swap' procedure takes two arguments:
#       $a2 - address of first byte.
#       $a3 - address of second byte.
        .data
string: .byte   'i', 'i', 't', 't', 'i', 'r', 'u', 'p', 'a', 't', 'i'
size:   .word   11

        .text
main:
    la $a0, string
    lw $a1, size
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal reverse

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
.end main

reverse:
    bgt $a1, 1, greater_than_one
    jr $ra

greater_than_one:
    li $t0, 0               # $t0 = loop counter.
    li $t1, 2
    div $a1, $t1
    mflo $t1                # $t1 contains size/2.
    move $t2, $a0           # $t2 = copy base address of the array.

    # $t3 = points to last element in the array.
    addi $a1, $a1, -1
    move $t3, $a0
    add $t3, $t3, $a1       # $t3 = base address + (size - 1).
    addi $a1, $a1, 1        # restore the value of $a1 = size of the array.
    addi $sp, $sp, -4
    sw $ra, 0($sp)
for:
    move $a2, $t2
    move $a3, $t3
    jal swap                # swap ith element with (size - i - 1)th element.
    addi $t2, $t2, 1        # address is incremented by one because charecters are bytes.
    addi $t3, $t3, -1       # address is decremented by one because charecters are bytes.
    addi $t0, $t0, 1
    beq $t0, $t1, Exit
    j for
Exit:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

swap:
    lb $t4, 0($a2)
    lb $t5, 0($a3)
    sb $t4, 0($a3)
    sb $t5, 0($a2)
    jr $ra
