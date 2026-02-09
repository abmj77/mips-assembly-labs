.data
message: .asciiz " the smallest number "
mg1:.asciiz "Enter first number: "
mg2:.asciiz "Enter second number: "
mg3:.asciiz "Enter third number: "

.text
main:
li $v0,4
la $a0,mg1
syscall

li $v0,5
syscall
move $s0,$v0 #first number in s0

li $v0,4
la $a0,mg2
syscall

li $v0,5
syscall
move $s1,$v0 #second number in s1

li $v0,4
la $a0,mg3
syscall

li $v0,5
syscall
move $s2,$v0 #third number in s2


blt $s0, $s1,L1
blt $s1, $s2, NumberTwo
j NumberThree

L1:
blt $s0,$s2, NumberOne
j NumberThree



NumberOne: # number one is the smallest
li $v0,1
move $a0, $s0
syscall
j End

NumberTwo: # number two is the smallest
li $v0,1
move $a0, $s1
syscall
j End

NumberThree:
li $v0,1  # number three is the smallest
move $a0, $s2
syscall
j End


End:

li $v0,4
la $a0,message
syscall

#End of main
li $v0,10
syscall