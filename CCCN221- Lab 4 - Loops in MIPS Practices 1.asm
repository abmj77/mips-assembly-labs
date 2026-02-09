.data
prompt: .asciiz "Enter a number: "
is: .asciiz "Is "
div_and: .asciiz " divisible by 5 and 6?"
div_or: .asciiz " divisible by 5 or 6?"
div_xor: .asciiz " divisible by 5 or 6, but not both?"
true: .asciiz "true\n"
false: .asciiz "false\n"

.text

main:

li $v0,4
la $a0, prompt
syscall

li $v0,5
syscall

move $t0,$v0

li $t5,5

div $t0,$t5
mfhi $t1
li $t5,6

div $t0,$t5
mfhi $t2



seq $t1,$t1,$zero
seq $t2,$t2,$zero



and $t3,$t1,$t2
or $t4,$t1,$t2
xor $t5,$t1,$t2


li $v0,4
la $a0, is
syscall


li $v0,1
move $a0,$t0
syscall
li $v0,4
la $a0, div_and
syscall

move $a1,$t3
jal printResult

li $v0,4
la $a0,is
syscall


li $v0,1
move $a0,$t0
syscall

li $v0,4
la $a0, div_or
syscall

move $a1,$t4

jal printResult


li $v0,4
la $a0,is
syscall

li $v0,1
move $a0,$t0
syscall


li $v0,4
la $a0,div_xor
syscall

move $a1,$t5

jal printResult

li $v0,10
syscall

printResult:
beqz $a1, f_div
li $v0,4
la $a0, true
syscall
jr $ra
f_div:
li $v0,4
la $a0, false
syscall
jr $ra