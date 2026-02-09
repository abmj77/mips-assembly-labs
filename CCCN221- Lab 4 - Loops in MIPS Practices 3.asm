.data

prompt_num_ints: .asciiz "Enter number of integers: "
prompt_int: .asciiz "Enter an integer: "

.text
.globl main
main:
li $v0, 4
la $a0, prompt_num_ints
syscall


li $v0,5
syscall


move $s0,$v0

li $s1,0
li $t0,0


loop:
beq $s1,$s0,end_loop


li $v0,4
la $a0, prompt_int
syscall

li $v0,5
syscall

add $t0,$t0,$v0

add $s1,$s1,1

j loop

end_loop:
move $t1,$s0
div $t0, $t0, $t1


li $v0,1
move $a0, $t0
syscall