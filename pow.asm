# pow.asm program
#

# C++ (NON-RECURSIVE) code snippet of pow(x,n):
#   int x, n, pow=1; 
#   cout << "Enter a number x:\n"; 
#   cin >> x;
#   cout << "Enter the exponent n:\n"; 
#   cin >> n; 
#   for (int i = 1; i <= n; i++) { 
#   	pow = pow * x; 
#   } 
#   cout << "Power(x,n) is:\n" << pow << "\n";
#
# Assembly (NON-RECURSIVE) code version of pow(x,n):
#
.data

	# TODO: Write your initializations here
    enter_number: .asciiz "Enter a number x:\n"
    enter_exponent: .asciiz "Enter the exponent n:\n"
    pow_is: .asciiz "Power(x, n) is:\n"
    new_line: .asciiz "\n"

# Text Area (i.e. instructions)
.text
main:
	
	# TODO: Write your code here

    # Enter number and input
    li $v0 4
    la $a0 enter_number
    syscall
    li $v0 5 
    syscall
    move $t0 $v0 # t0 = x

    # Enter exponent and input
    li $v0 4
    la $a0 enter_exponent
    syscall
    li $v0 5
    syscall
    move $t1 $v0 # t1 = n

    # Loop setup
    move $t2 $t1
    li $t3 1
    li $t4 1
    addi $t2 $t2 1

loop_body:
    beq $t3 $t2 loop_exit
    mult $t0 $t4
    mflo $t4
    addi $t3 $t3 1
    j loop_body

loop_exit:
    # Print power is text
    li $v0 4
    la $a0 pow_is
    syscall

    # Print int value
    li $v0 1
    move $a0 $t4
    syscall

    # Print new line
    li $v0 4
    la $a0 new_line
    syscall

    j exit


exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0 10
    syscall
