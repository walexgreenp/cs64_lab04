# min.asm program
#

.data

    # TODO: Complete these declarations / initializations
    enter_number: .asciiz "Enter the next number:\n"
    min_text: .asciiz "Minimum: "
    new_line: .asciiz "\n"

#Text Area (i.e. instructions)
.text

main:

    # TODO: Write your code here
    # You can have other labels expressed here, if you need to

    # Text & input 1
    li $v0 4
    la $a0 enter_number
    syscall
    li $v0 5
    syscall
    move $t0 $v0

    # Text & input 2
    li $v0 4
    la $a0 enter_number
    syscall
    li $v0 5
    syscall
    move $t1 $v0

    # Text & input 3
    li $v0 4
    la $a0 enter_number
    syscall
    li $v0 5
    syscall
    move $t2 $v0

    # Number Comparison
    slt $t3 $t0 $t1
    bne $t3 $zero, t0_smaller # $t3 == 1 != 0 if a < b
    j t1_smaller

# Jumped to if t0 < t1
t0_smaller:
    slt $t3 $t0 $t2
    bne $t3 $zero, t0_smallest
    j t2_smallest

# Jumped to if t1 < t0
t1_smaller:
    slt $t3 $t1 $t2
    bne $t3 $zero, t1_smallest
    j t2_smallest

t0_smallest:
    # Prints text
    li $v0 4
    la $a0 min_text
    syscall

    # Prints int
    li $v0 1
    move $a0 $t0
    syscall

    j exit

t1_smallest:
    # Prints text
    li $v0 4
    la $a0 min_text
    syscall

    # Prints int
    li $v0 1
    move $a0 $t1
    syscall

    j exit

t2_smallest:
    # Prints text
    li $v0 4
    la $a0 min_text
    syscall

    # Prints int
    li $v0 1
    move $a0 $t2
    syscall

    j exit


exit:
    # TODO: Write code to properly exit a SPIM simulation
    li $v0 4
    la $a0 new_line
    syscall
    
    li $v0 10
    syscall