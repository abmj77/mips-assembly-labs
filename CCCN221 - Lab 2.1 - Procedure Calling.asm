.data
output_message: .asciiz "The result of this method is : "

.text
main:
  # Set up arguments for leaf_example
  li   $a0, 10       # $a0 = 10
  li   $a1, 7        # $a1 = 7
  li   $a2, 5        # $a2 = 5
  li   $a3, 3        # $a3 = 3

  # Call leaf_example
  jal  leaf_example

  move $a1, $v0
	
  # Display the result
  li   $v0, 4         # syscall code for printing string
  la   $a0, output_message  # load address of output message
  syscall
  
  # Display the result value
  move $a0, $a1       # load the result value into $a0
  li   $v0, 1         # syscall code for printing integer
  syscall

  # End of program
  li   $v0, 10      # Exit syscall code
  syscall
	


leaf_example:
  addi $sp, $sp, -4
  sw   $s0, 0($sp)       # Save $s0 on stack
  add  $t0, $a0, $a1
  add  $t1, $a2, $a3     # Procedure body
  sub  $s0, $t0, $t1
  add  $v0, $s0, $zero   # Result
  lw   $s0, 0($sp)       # Restore $s0
  addi $sp, $sp, 4
  jr   $ra               # Return