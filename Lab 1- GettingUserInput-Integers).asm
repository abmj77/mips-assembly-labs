.data
WM: .asciiz "Amal - This program performs simple arithmetic on two integers.\n"
EFN: .asciiz "\nEnter first Number: "
ESN: .asciiz "\nEnter second number: "
SUM: .asciiz "\nSum = "
DIFFRENCE: .asciiz "\nDifference = "
PRODUCT: .asciiz "\nProduct = "
QUOTIENT: .asciiz "\nQuotient = "
THANKS: .asciiz "\nThank You!"

.text
.globl main
main:
  # Print Introduction
  li $v0, 4  # syscall for print string
  la $a0, WM  # load address of intro message
  syscall

  # Get first number
  li $v0, 4  # syscall for print string
  la $a0, EFN  # load address of first Number
  syscall

  li $v0, 5  # syscall for read integer
  syscall
  move $t0, $v0  # store first number in t0

  # Get second number
  li $v0, 4  # syscall for print string
  la $a0, ESN  # load address of second number
  syscall

  li $v0, 5  # syscall for read integer
  syscall
  move $t1, $v0  # store second number in t1

  # Calculations
  add $t2, $t0, $t1  # sum
  sub $t4, $t0, $t1  # difference
  mul $t6, $t0, $t1  # product
  div $t8, $t0, $t1  # quotient

  # Print results
  li $v0, 4  # syscall for print string
  la $a0, SUM  # load address of sum 
  syscall

  li $v0, 1  # syscall for print integer
  move $a0, $t2  # print sum
  syscall

  li $v0, 4  # syscall for print string
  la $a0, DIFFRENCE  # load address of difference 
  syscall

  li $v0, 1  # syscall for print integer
  move $a0, $t4  # print difference
  syscall

  li $v0, 4  # syscall for print string
  la $a0, PRODUCT  # load address of product
  syscall

  li $v0, 1  # syscall for print integer
  move $a0, $t6  # print product
  syscall

  li $v0, 4  # syscall for print string
  la $a0, QUOTIENT  # load address of quotient
  syscall

  li $v0, 1  # syscall for print integer
  move $a0, $t8  # print quotient
  syscall

  # Print thank you message
  li $v0, 4  # syscall for print string
  la $a0, THANKS  # load address of thanks message
  syscall

  # Exit program
  li $v0, 10  # syscall for exit
  syscall
  # Print thanks message
  li $v0, 4  # syscall for print string
  la $a0, THANKS  # load address of thanks message
  syscall

  # Exit program
  li $v0, 10  # syscall for exit
  syscall