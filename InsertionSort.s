.data
array:      .word 5, 2, 9, 1, 6, 3      # Array to sort
size:       .word 6                    # Size of the array
newline:    .asciiz "\n"

.text
.globl main

main:
    # Load base address of array and size
    la   $t0, array        # $t0 = base address of array
    lw   $t1, size         # $t1 = size of array

    li   $t2, 1            # i = 1 (start from second element)

outer_loop:
    bge  $t2, $t1, done    # if i >= size, exit loop

    # key = array[i]
    mul  $t3, $t2, 4       # offset = i * 4
    add  $t4, $t0, $t3     # address of array[i]
    lw   $t5, 0($t4)       # key = array[i]

    addi $t6, $t2, -1      # j = i - 1

inner_loop:
    blt  $t6, 0, insert_key    # if j < 0, go insert key

    mul  $t3, $t6, 4       # offset = j * 4
    add  $t4, $t0, $t3     # address of array[j]
    lw   $t7, 0($t4)       # array[j]

    ble  $t7, $t5, insert_key  # if array[j] <= key, done shifting

    # array[j+1] = array[j]
    mul  $t8, $t6, 4
    add  $t9, $t0, $t8
    addi $t9, $t9, 4       # address of array[j+1]
    sw   $t7, 0($t9)

    addi $t6, $t6, -1      # j--

    j inner_loop

insert_key:
    mul  $t3, $t6, 4
    add  $t4, $t0, $t3
    addi $t4, $t4, 4       # address of array[j+1]
    sw   $t5, 0($t4)       # array[j+1] = key

    addi $t2, $t2, 1       # i++
    j outer_loop

done:
    # Print sorted array
    li $v0, 1              # syscall: print_int
    li $t2, 0              # index = 0

print_loop:
    bge $t2, $t1, exit     # if index >= size, exit

    mul $t3, $t2, 4
    add $t4, $t0, $t3
    lw  $a0, 0($t4)
    li  $v0, 1
    syscall

    li  $v0, 4             # print newline
    la  $a0, newline
    syscall

    addi $t2, $t2, 1
    j print_loop

exit:
    li $v0, 10
    syscall