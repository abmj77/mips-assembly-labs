.data
array: .space 40 # allocate space for 10 integers 
prompt1: .asciiz "Enter an integer: " 
prompt2: .asciiz "The values in the array are: "
prompt3: .asciiz ", "

.text
.globl main 

main:
	li $s0, 0 # initialize the array index to 0
	
input_loop:
	# prompt the user to enter an integer
	la $a0, prompt1
	li $v0, 4 
	syscall
	
	# read the integer entered by the user
	li $v0, 5
	syscall
	sw $v0, array($s0)

	addi $s0, $s0, 4 # increment the array index
	
	# check if the array is full
	li $t0, 10
	slt $t1, $s0, $t0
	bne $t1, $zero, input_loop
	
print_Loop:
	la $a0, prompt2
	li $v0, 4 
	syscall

	li $s0, 0 # initialize the array index to O
	
print_values:
	lw $a0, array ($s0)
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, prompt3 
	syscall
	
	addi $s0, $s0, 4 # increment the array index
	
	li $t0, 10
	slt $t1, $s0, $t0
	bne $t1, $zero, print_values
	li $v0,10