# NIKOLAOS SOKOLIS p3200179



	.data

head: .word	 0 
print_message:	 .asciiz "The contents of the sorted list are: \n"
new_line:	 .asciiz "\n"
tab:	.asciiz "\t"
option_menu: 	.asciiz "1. Insert node \n2. Delete Node \n3. Print list \n4. Exit \n"
input_message:	.asciiz "Type in the number you want to insert to the list \n"
input_del_message:	.asciiz "Type in the value of the node you want to delete \n"
exit_message:	.asciiz "Exiting ... \n"
found:	 .asciiz "Value found and getting deleted. \n"
not_found:		.asciiz "Value not found in list. \n"
wrong_input : .asciiz "Wrong input please try again. \n"
nothing_to_delete:  .asciiz "List empty, nothing to delete. \n"
nothing_to_print_message:  .asciiz "List empty, nothing to print. \n"

	.text
	.globl main


main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	jal create_new_list					# create_new_list()

#main loop of the program to select procedure

loop:

	la $a0, option_menu
	jal print_to_console 				# print(option_menu);
	
	li $v0, 5		
	syscall
	


	beq $v0, 1, insert_node				# input == 1? insert node : continue;	

	beq $v0, 2, delete_node				# input == 2? delete node : continue;
															
	beq $v0, 3, print_list 				# input == 3? print list : continue;
	
	beq $v0, 4, end_loop				# input == 4? exit program : continue;			

	
	la $a0, wrong_input
	jal print_to_console				# print(wrong_input);	(if program gets to this line input wasn't in [1,4] range so invalid input) 

	j loop



insert_node:

	la $a0, input_message
	jal print_to_console				# print(input_message);
	
	li $v0, 5 							# read integer in $v0
	syscall

	move $a1, $v0 						# $a1 = $v0

	jal insert_new_node 				# insert_new_node($a1); (pass the value in $a1 to the function)
	j loop


delete_node:
	
	jal delete_node_p 					# delete_node_p();

	j loop

print_list:
	
	jal print_list_p					# print_list_p();

	j loop


end_loop:	

	la $a0, exit_message
	jal print_to_console				# print(exit_message);
			

	li $v0, 10
	syscall 							# exit 


#==================================================================================#
#==================================================================================#
#								   Procedures						               #
#==================================================================================#
#==================================================================================#


#----create_new_list----#
# Desc: Initialize the list
# Parameters: None

create_new_list:

	addi $sp, $sp, -4					# save return address to the stack
	sw $ra, 0($sp)
	
	jal allocate_memory

    sw $v0, head						
	
	sw $zero, 4($v0)					
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4 					# load return address from the stack 
	jr $ra


#----print_to_console----#
# Desc: Print string to console
# Parameters: $a0 (the address of the string that's going to be printed)

print_to_console:

	li $v0, 4
	syscall

	jr $ra


#----insert_new_node----#
# Desc: Place node in the right place (ascending order) based on user's input in $a1
# Parameters: $a1 (the value given by the user)

insert_new_node:

	addi $sp, $sp, -4 					# save return address to the stack
	sw $ra, 0($sp)
	
    jal allocate_memory
	
	lw $t0, head 						# $t0 = head; (pointer to the first node)
			
loop_ascending_order:

	beqz $t0, next_eq_null				# $t0 == 0? goto next_eq_null; 	  (next equal null)
	lw $a2, 0($t0) 						# $a2 = value of the node
	blt $a1, $a2, neq_null				# $a1 < $a2 ? goto neq_null;	(not equal null), found the right place for the node						
	
	or $t1, $t0, $zero							
	lw $t0, 4($t0)
	
	j loop_ascending_order
	
next_eq_null:
	
    sw $v0, 4($t1) 
	
	sw $a1, 0($v0)						# store passed value 
	
	sw $zero, 4($v0) 					# next node address = null
	
	j end_if
	
neq_null:
	
	sw  $a1, 0($v0) 					# store passed value
	
	sw $v0, 4($t1)

	sw $t0, 4($v0)

	
end_if:

	lw $ra, 0($sp)
	addi $sp, $sp, 4 					# load return address from the stack 
	jr $ra


#----allocate_memory----#
# Desc: Allocate 8 bytes from the stack to save node's data, address to next node
# Parameters: None
# Returns address of preserved memory in $v0

allocate_memory :

	addi $sp, $sp, -4 					# save return address to the stack
	sw $ra, 0($sp)
	
    li $v0, 9  							# system call 9					
    li $a0, 8 							# 2 x sizeof(int): take 8 bytes from the stack to save node's data, next address
    syscall
	
	
    lw $ra, 0($sp)
	addi $sp, $sp, 4 					# load return address from the stack
	jr $ra


#----print_list_p----#	
# Desc: When called, prints the list while (head != 0), if list isn't empty
# Parameters: None

print_list_p:

	addi $sp, $sp, -4 					# save return address to the stack
	sw $ra, 0($sp)
	
	lw $s1, head

	lw $t0, 4($s1)

	beqz $t0, nothing_to_print

	la $a0, print_message
	jal print_to_console 				# print(print_message);
	
	
    lw $s0, head 
	lw $s0, 4($s0)


loop_list: 
	
	beqz $s0, end_loop_list 			# $s0 == 0? goto end_loop_list
	la $a0, tab 						
	jal print_to_console				# print("\t");
	
   
	lw $a0, 0($s0) 						# $a0 = value of node $s0
	
	li $v0, 1 							# print($a0 ↑↑);
    syscall
	
	la $a0, new_line
	jal print_to_console				# print("\n");
		
    lw $s0, 4($s0) 						# $s0 = node.next; 
	j loop_list

nothing_to_print:

	la $a0, nothing_to_print_message
	jal print_to_console				# print(nothing_to_print_message) (list is empty, return)

end_loop_list:   

    lw $ra, 0($sp)
	addi $sp, $sp, 4 					# load return address from the stack
	jr $ra


#----delete_node_p----#
# Desc: Search for the value in $a1 in the list, if value is found then remove the node and return, else if list is empty or value was not found exit with empty/not found message
# Parameters: None

delete_node_p:

	addi $sp, $sp, -4 					# save return address to the stack
	sw $ra, 0($sp)

	lw $s1, head

	lw $t0, 4($s1)

	beqz $t0, no_nodes 					# $t0 == 0? no_nodes (if head is null there are no nodes to delete)

	la $a0, input_del_message
	jal print_to_console				# print(input_del_message);

	li $v0, 5 							# read integer in $v0
	syscall

	move $t1, $v0  						# $t1 = input();
	move $t0, $s1						

	li $t2, 0

loop_find_value:

	beqz $t0, value_not_found 			# $t0 == 0? goto value_not_found (if current node is null we have reached the end of the list, jump to value_not_found)
	
	lw $t3, 0($t0)

	beq $t1, $t3, value_found 			# $t1 == $t3? goto value_found (if the value passed from the user is found jump to value_found)

	move $t2, $t0
	lw $t0, 4($t0)

	j loop_find_value

value_found:
	
	la $a0, found
	jal print_to_console				# print(found); (Node found, node's getting deleted)

	beqz $t2, delete_head 				# $t2 == 0? goto delete_head (if $t2 equals 0 we are deleting the head of the list)

	lw $t3, 4($t0) 
	sw $t3, 4($t2) 	

	j exit_found

delete_head:
	
	lw $t2, 4($t0)
	move $s1, $t2 
	sw $s1, head

	j exit_found

exit_found:

	lw $ra, 0($sp) 						# load return address from the stack
	addi $sp, $sp, 4 					# return without removing anything since the inserted value wasn't found in the list
	jr $ra

value_not_found:

	la $a0, not_found
	jal print_to_console				# print(not_found); (inserted value from the user was not found in the list -> jump to exit_fail and return)

	j exit_fail

no_nodes:
	la $a0, nothing_to_delete
	jal print_to_console				# print(nothing_to_delete); (list is empty no nodes can be deleted)

exit_fail:

	lw $ra, 0($sp) 						# load return address from the stack
	addi $sp, $sp, 4 					# return without removing anything since the inserted value wasn't found in the list
	jr $ra