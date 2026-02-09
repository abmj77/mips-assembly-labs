.data
output_message: .asciiz "Factorial of 5 : "

.text
main:
  # Set up argument for fact
  li   $a0, 5         # n = 5

  # Call fact
  jal  fact

  move $a1 , $v0

  # Display the result
  li   $v0, 4         # syscall code for printing string
  la   $a0, output_message  # load address of output message
  syscall
  
  # Display the result value
  li   $v0, 1         # syscall code for printing integer
  move $a0, $a1       # load the result value
  syscall

  # End of program
  li   $v0, 10        # Exit syscall code
  syscall

fact:
  addi $sp, $sp, -8    # adjust stack for 2 items
  sw   $ra, 4($sp)     # save return address
  sw   $a0, 0($sp)     # save argument
  slti $t0, $a0, 1     # test for n < 1
  beq  $t0, $zero, L1
  addi $v0, $zero, 1   # if so, result is 1
  addi $sp, $sp, 8     # pop 2 items from stack
  jr   $ra             # and return

L1: 
  addi $a0, $a0, -1    # else decrement n  
  jal  fact            # recursive call
  lw   $a0, 0($sp)     # restore original n
  lw   $ra, 4($sp)     # and return address
  addi $sp, $sp, 8     # pop 2 items from stack
  mul  $v0, $a0, $v0   # multiply to get result
  jr   $ra             # and return