.data
prompt: .asciiz "Enter a positive integer "
result: .asciiz "The numbers from 1 to N are:"
newline: .asciiz
newsp: .asciiz


.text
.globl main
main:
li $v0,4
la $a0, prompt
syscall

li $v0,5
syscall
move $s0, $v0

li $v0, 4
la $a0, result
syscall


li $s1,1

loop:
li $v0,1
move $a0, $s1
syscall


addi $s1, $s1,1

bgt $s1, $s0, endloop

j loop

endloop:
li $v0,4
la $a0, newline
syscall

li $v0, 10
syscall