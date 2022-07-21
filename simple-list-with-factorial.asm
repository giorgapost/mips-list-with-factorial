.data
menuStart: .ascii "=======System menu========\n"
choice1: .ascii "1) Enter a new node at the end of the list.\n"
choice2: .ascii "2) Delete the last node of the list.\n"
choice3: .ascii "3) Print a node.\n"
choice4: .ascii "4) Print the size of the list.\n"
choice5: .ascii "5) Print the node with the minimum value. Position, ID and value are printed.\n"
choice6: .ascii "6) Print the factorial of a node's value.\n"
choice7: .ascii "7) Quit.\n"
readChoice: .asciiz "Please enter your choice (1-7): "
newListSize: .asciiz "Please enter the size of the new list: "
readID: .asciiz "\nPlease enter a (unique) integer ID for this node: "
readValue: .asciiz "\nPlease enter the integer value of this node: "
nodeToPrint: .asciiz "\nPlease enter the ID of a node to print: "
id: .asciiz "\nID: "
value: .asciiz "\nValue: "
nodePosition: .asciiz "\nPosition into the list: "
newLine: .asciiz "\n\n"
numberOfNodes: .asciiz "\nSize of list: "
nodeToFactorial: .asciiz "\nPlease enter the ID of a node to calculate its value's factorial: "
factorialStart: .asciiz "\nFactorial of value "
factorialEnd: .asciiz " is: "
invalidValue_error: .asciiz "\nError. Invalid value.\n\n"
emptyListError: .asciiz "\nError. There is no list.\n\n"
fullList_error: .asciiz "\nError. The list is full.\n\n"
notFoundError: .asciiz "\nError. Not found.\n\n"

mem: .align 2
	 .space 600
	 


.text
######s0 is the number of nodes

.globl main

main:
	
	startLoop:
	
	li $v0 4
	la $a0 newListSize   #print "Enter the new list's size"
	syscall
			
	li $v0 5
	syscall	   #read the size
	move $a1 $v0  #a1=size
	la $a0 mem    #a0=head
			
	jal func0
	move $s0 $v0  #s0=size
	
	beq $s0 $zero startLoop
	
	while_label:
		li $v0, 4     #Print menu
		la $a0, menuStart
		syscall
	
		li $v0, 5    #Read choice
		syscall
		move $t0 $v0  #$t0=choice
		
		li $t1, 7
		beq $t0, $t1, end_loop   #Loop condition
		
			li $t1, 1			 #choice==1
						
			bne $t0, $t1, else2_lbl
			
			li $v0 4     #print the readID message
			la $a0 readID
			syscall
						
			li $v0 5   #read the id
			syscall
			move $t2 $v0  #t2=id
			
			li $v0 4  #print the readValue message
			la $a0 readValue
			syscall
			
			li $v0 5    #read the value
			syscall
			move $t3 $v0  #t3=value
			
			la $a0 mem
			move $a1 $s0
			move $a2 $t2
			move $a3 $t3
			
			jal func1
			move $s0 $v0
			
			b next_loop
			
		else2_lbl:
			li $t1, 2
			bne $t0, $t1, else3_lbl
						
			move $a1 $s0
			jal func2
			move $s0 $v0
			
			
			b next_loop
			
		else3_lbl:
			li $t1, 3
			bne $t0, $t1, else4_lbl
			
			li $v0 4
			la $a0 nodeToPrint
			syscall
			
			li $v0 5
			syscall
			move $a2 $v0
			la $a0 mem
			move $a1 $s0
			
			jal func3

			b next_loop
			
		else4_lbl:
			li $t1, 4
			bne $t0, $t1, else5_lbl
			
			li $v0 4
			la $a0 numberOfNodes   #print "Number of nodes: "
			syscall
			
			li $v0 1
			move $a0 $s0           #print the number of nodes
			syscall
			
			li $v0 4               #print a new line
			la $a0 newLine
			syscall
				
			b next_loop
			
		else5_lbl:
		
			li $t1, 5
			bne $t0, $t1, else6_lbl
			
			la $a0 mem
			move $a1 $s0
			
			jal func5
			
			b next_loop
		
		else6_lbl:
			
			li $t1, 6
			bne $t0, $t1, else_lbl

			
			
			la $a0 nodeToFactorial
			li $v0 4
			syscall
			
			li $v0 5
			syscall
			move $a2 $v0
			la $a0 mem
			move $a1 $s0
			
			jal func6
			
			b next_loop
			
		else_lbl:

			invalidValue:
				li $v0 4
				la $a0 invalidValue_error
				syscall
			
		next_loop:
			b while_label
		
	end_loop:
	
	li $v0 10
	syscall



##########################################
func0:
	
	move $t0 $a0  #t0 is the head of the list
	move $t1 $a1  #t1 is the number of nodes
	li $t2 1      #t2 is the loop counter
	
	blez $t1 invalidValue0  #if t1<=0
	addi $t3 $t1 -100
	bgtz $t3 invalidValue0  #if t1>100
		
	loop0:
		
	
		li $v0 4  #print the message "enter the id:"
		la $a0 readID
		syscall
	
		li $v0 5   #read the id
		syscall
		move $t3 $v0  #t3 is the id
	
		li $v0 4  #print the message "enter value:"
		la $a0 readValue
		syscall
	
		li $v0 5  #read the value
		syscall
		move $t4 $v0   #t4 is the value
	
	###Save to memory
		li $t5 1
		and $t5 $t5 $t2
		beq $t5 $zero even0  #if t5==0 number of nodes is even
	
		sw $t4 0($t0)      #odd number of nodes
		sb $t3 4($t0)
		srl $t3 $t3 8
		sb $t3 5($t0)
	
		b afterCond0
		
		even0:
		
		sb $t3 0($t0)
		srl $t3 $t3 8
		sb $t3 1($t0)
		sw $t4 2($t0)
	
		afterCond0:
	###End of memory saving
	
		beq $t1 $t2 afterLoop0
	
     	addi $t0 $t0 6
		addi $t2 $t2 1
	 	
		b loop0
	
	afterLoop0:
		move $v0 $t1	
		b endFunc0
	
	invalidValue0:
		li $v0 4
		la $a0 invalidValue_error
		syscall
		move $v0 $zero
	
	endFunc0:
		jr $ra
				
#########################################
func1:
	
	move $t0 $a0  #t0 is the head of the list
	move $t1 $a1  #t1 is the number of nodes
	move $t2 $a2  #t2 is the id
	move $t3 $a3  #t3 is the value
	
	li $t4 100
	
	beq $t1 $t4 fullList1
	
	li $t4 0
	
	loop1:
		beq $t1 $t4 afterLoop1
	
		addi $t0 $t0 6
		addi $t4 $t4 1
		b loop1
	
	afterLoop1:
	
	###Save to memory
	li $t5 1
	and $t5 $t5 $t1
	bne $t5 $zero even1  #if t1 even, a node will be stored in odd position
	
	sw $t3 0($t0)
	sb $t2 4($t0)
	srl $t2 $t2 8
	sb $t2 5($t0)
	
	b afterCond1
	even1:
		
	sb $t2 0($t0)
	srl $t2 $t2 8
	sb $t2 1($t0)
	sw $t3 2($t0)
	
	afterCond1:
	###End of memory saving
	
	addi $v0 $t1 1  #return_number_of_nodes + 1
	
	b endFunc1
	
	fullList1:
		li $v0 4
		la $a0 fullList_error
		syscall
		move $v0 $t1
		b endFunc1
		
	
	endFunc1:
		jr $ra
		
###########################################
func2:
	
	move $t1 $a1
	
	beq $t1 $zero noList2  #if counter==0 there is no list
	
	addi $v0 $t1 -1  #counter=counter-1
	b endFunc2
	
	noList2:      #empty list error message
		li $v0 4
		la $a0 emptyListError
		syscall
		li $v0 0
	
	endFunc2:
	jr $ra
	
###########################################
func3:
	
	move $t0 $a0   #t0 is the head of the list
	move $t1 $a1   #t1 is the number of the list nodes
	move $t2 $a2   #t2 is the id of the node to print
	li $t3 1       #t3 is the loop counter
	
	loop3:
	sub $t4 $t1 $t3
	bltz $t4 outOfBounds3
	
	###Load from memory#####################
		li $t6 0                    #Initialize t6
		li $t4 1
		and $t4 $t4 $t3
		beq $t4 $zero even3       #if t4==0 then node is even
                            	    #node is odd
		lw $t5 0($t0)               #t5=value 
		lhu $t6 4($t0)              #t6=id
	
		b afterCond3
		even3:                    #node is even
		
		lhu $t6 0($t0)
		lw $t5 2($t0)
	
		afterCond3:
	###End of memory loading###############
	
		beq  $t2 $t6 endLoop3  #if counter==nodeToPrint exit the loop
		
		addi $t3 $t3 1  #increase the counter
		addi $t0 $t0 6  #go to the next node
		
		b loop3
	endLoop3:
	
	li $v0 4        #print the message "Position into the list:"
	la $a0 nodePosition
	syscall
	
	li $v0 1        #print the position of the node
	move $a0 $t3
	syscall
	
	li $v0 4    #print the message "ID:"
	la $a0 id
	syscall
	
	li $v0 1    #print the id
	move $a0 $t6
	syscall
			
	li $v0 4   #print the message "value:"
	la $a0 value
	syscall
	
	li $v0 1    #print the value
	move $a0 $t5
	syscall
	
	li $v0 4     #print a new line
	la $a0 newLine
	syscall
	
	b endFunc3
	
	outOfBounds3:    #print an error if the node to print is out of the list's bounds
		li $v0 4
		la $a0 notFoundError
		syscall
	
	endFunc3:
	
	jr $ra
	
############################################
func5:

	move $t0 $a0  #t0 is the head of the list
	move $t1 $a1  #t1 is the number of nodes
	li $t2 1      #t2 is the loop counter
	
	beq $zero $t1 emptyList5	
	
	lw $t3 0($t0)    #t3 is the min value
	lhu $t4 4($t0)   #t4 is the id of the min node
	
	move $t5 $t2     #t5 is the position of the min node
	
	addi $t2 $t2 1
	addi $t0 $t0 6
	
	loop5:
		sub $t6 $t1 $t2		
		bltz $t6 endLoop5
		
		###Load from memory#####################
		li $t6 1
		and $t6 $t6 $t2
		beq $t6 $zero even5       #if t6==0 then node is even
                            	    #node is odd
		lw $t7 0($t0)             #t7=value
		lhu $t8 4($t0)            #t8=id
	
		b afterCond5
		even5:                    #node is even
		
		lhu $t8 0($t0)       #t8=id
		lw $t7 2($t0)        #t7=value
	    
		afterCond5:
		###End of memory loading###############

		sub $t9 $t3 $t7
		blez $t9 afterChange   #if t3<=t7 then change nothing
		
			move $t3 $t7
			move $t4 $t8
			move $t5 $t2		
		
		afterChange:				
		
			addi $t0 $t0 6
			addi $t2 $t2 1
			
			b loop5
		endLoop5:
		
		
		
		li $v0 4
		la $a0 nodePosition
		syscall
		
		li $v0 1
		move $a0 $t5
		syscall
		
		li $v0 4
		la $a0 id
		syscall
		
		li $v0 1
		move $a0 $t4
		syscall
		
		li $v0 4
		la $a0 value
		syscall

		li $v0 1
		move $a0 $t3
		syscall
		
		li $v0 4     #print a new line
		la $a0 newLine
		syscall
		
		b endFunc5
		
	emptyList5:
		li $v0 4
		la $a0 emptyListError
		syscall
		
	endFunc5:
		jr $ra

##############################################
func6:

	addi $sp $sp -8     #SAVE
	sw $ra 0($sp)
	sw $s0 4($sp)

	move $t0 $a0   #t0 is the head of the list
	move $t1 $a1   #t1 is the number of the list nodes
	move $t2 $a2   #t2 is the id of the node to calculate the factorial
	li $t3 1       #t3 is the loop counter
	
	loop6:
	sub $t4 $t1 $t3
	bltz $t4 outOfBounds6
	
	
		
	###Load from memory#####################
		li $t6 0                    #Initialize t6
		li $t4 1
		and $t4 $t4 $t3
		beq $t4 $zero even6       #if t4==0 then node is even
                            	    #node is odd
		lw $s0 0($t0)               #s0=value 
		lhu $t5 4($t0)              #t5=id
		
		b afterCond6
		even6:                    #node is even
		
		lhu $t5 0($t0)
		lw $s0 2($t0)
	
		afterCond6:
	###End of memory loading###############
	
		beq  $t2 $t5 endLoop6  #if counter==nodeToPrint then exit the loop
		
		addi $t3 $t3 1  #increase the counter
		addi $t0 $t0 6  #go to the next node
		
		b loop6
	endLoop6:
		
	move $a0 $s0
	
	jal factorialFunc
	
	move $t4 $v0    #t4 is the factorial
	
	la $a0 factorialStart    #print "Factorial of value "
	li $v0 4
	syscall
	
	move $a0 $s0
	li $v0 1
	syscall
	
	la $a0 factorialEnd     #print " is: "
	li $v0 4
	syscall
	
	move $a0 $t4
	li $v0 1
	syscall
	
	la $a0 newLine    #print new lines
	li $v0 4
	syscall
	
	b endFunc6
	
	outOfBounds6:    #print an error if the node to print is out of the list's bounds
		li $v0 4
		la $a0 notFoundError
		syscall
		
	endFunc6:
		lw $s0 4($sp)   #RESTORE
		lw $ra 0($sp)
		addi $sp $sp 8
	
		jr $ra

##############################################
factorialFunc:

	addi $sp $sp -8     #SAVE
	sw $ra 0($sp)
	sw $s0 4($sp)
	
	move $s0 $a0   #s0 is the value
	
	#move $a0 $s0
	#li $v0 1
	#syscall
	
	addi $t1 $s0 -1
	blez $t1 endRecursion   #if s0<=1
	
	#move $a0 $t1
	#li $v0 1
	#syscall
	
	move $a0 $t1
	
	jal factorialFunc
		
	move $t1 $v0    #t1=factorial(t0-1)
	mul $v0 $s0 $t1
	
	b endFuncFact
	
	endRecursion:
		li $v0 1
		
    endFuncFact:
	
		lw $s0 4($sp)   #RESTORE
		lw $ra 0($sp)
		addi $sp $sp 8
		
		jr $ra
##############################################