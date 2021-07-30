# Daksh Malhotra
# 1006912094

# Bitmap Display Configuration:
# - Unit width in pixels: 4
# - Unit height in pixels: 4
# - Display width in pixels: 256
# - Display height in pixels: 256
# - Base Address for Display: 0x10040000 (heap)

.macro sleep (%x)
li $v0, 32
li $a0, %x
syscall
.end_macro

.data
displayAddress: .word 0x10040000
displayWidth:	.word 256	#display width in terms of bytes (number of bytes to display on next row)
displayHeight:	.word 256	#display width in terms of bytes (number of bytes to display on next row)

characterX:	.word 00	#characterX pos
characterY:	.word 24	#characterY pos
characterW:	.word 16	#character width
characterH:	.word 16	#character height

.text
LOOPSTART:

lw $t0, characterX
lw $t1, characterW
add $t2, $t1, $t0
lw $t3, displayWidth
div $t3, $t3, 4

bgt $t2, $t3, EXITANIMATION

jal CLEARSCREEN

jal DRAWCHARACTER

sleep 300

lw $t0, characterX
addi $t0, $t0, 1
sw $t0, characterX
j LOOPSTART

EXITANIMATION:
#draw enemy

li $v0, 42
li, $a0, 0
li $a1, 40
syscall
move $t6, $a0

li $v0, 42
li, $a0, 0
li $a1, 60
syscall
move $t7, $a0

lw $t0, displayAddress # $t0 stores the base address for display

lw $t5, displayWidth
mul $t6, $t6, 4		#turns x into byte offset

mul $t7, $t5, $t7	
add $t6, $t6, $t7
add $t6, $t6, $t0
#t5 is displaywidth
#t6 is x + displaywidth*y
#t6 is used as the address on the display that corrispods to the row with character x value
li $t3, 0x00FF0000

sw $t3, 0($t6)
sw $t3, 4($t6)
sw $t3, 8($t6)
sw $t3, 12($t6)
add $t6, $t6, $t5

sw $t3, 0($t6)
sw $t3, 4($t6)
sw $t3, 8($t6)
sw $t3, 12($t6)
add $t6, $t6, $t5

sw $t3, 0($t6)
sw $t3, 4($t6)
sw $t3, 8($t6)
sw $t3, 12($t6)
add $t6, $t6, $t5

sw $t3, 0($t6)
sw $t3, 4($t6)
sw $t3, 8($t6)
sw $t3, 12($t6)
add $t6, $t6, $t5


EXIT:
    li $v0, 10 # terminate the program gracefully
    syscall

DRAWCHARACTER:
    lw $t0, displayAddress # $t0 stores the base address for display

    # from DB32 colour pallet, 4 colours used
    li $t1, 0x3f3f74 # $t1 stores the blue
    li $t2, 0x5b6ee1 # $t2 stores the light blue
    li $t3, 0x323c39 # $t3 stores the grey
    li $t4, 0xd95763 # $t4 stores the red

    lw $t5, displayWidth
    lw $t6, characterX
    mul $t6, $t6, 4		#turns x into byte offset
    lw $t7, characterY

    mul $t7, $t5, $t7	
    add $t6, $t6, $t7
    add $t6, $t6, $t0
    #t5 is displaywidth
    #t6 is x + displaywidth*y
    #t6 is used as the address on the display that corrispods to the row with character x value

    sw $t1, 20($t6)
    sw $t1, 24($t6)
    sw $t1, 28($t6)

    add $t6, $t6, $t5

    sw $t3, 12($t6)

    sw $t1, 24($t6)
    sw $t1, 28($t6)
    sw $t1, 32($t6)

    sw $t2, 36($t6)
    sw $t2, 40($t6)
    sw $t2, 44($t6)

    add $t6, $t6, $t5

    sw $t4, 0($t6)
    sw $t4, 4($t6)

    sw $t3, 16($t6)
    sw $t3, 20($t6)

    sw $t1, 24($t6)
    sw $t1, 28($t6)
    sw $t1, 32($t6)
    sw $t1, 36($t6)
    sw $t1, 40($t6)

    sw $t2, 44($t6)
    sw $t2, 48($t6)
    sw $t2, 52($t6)

    add $t6, $t6, $t5

    sw $t4, 4($t6)
    sw $t4, 8($t6)
    sw $t4, 12($t6)

    sw $t3, 16($t6)
    sw $t3, 20($t6)

    sw $t1, 24($t6)
    sw $t1, 28($t6)
    sw $t1, 32($t6)
    sw $t1, 36($t6)
    sw $t1, 40($t6)
    sw $t1, 44($t6)
    sw $t1, 48($t6)

    sw $t2, 52($t6)
    sw $t2, 56($t6)

    add $t6, $t6, $t5

    sw $t4, 8($t6)
    sw $t4, 12($t6)

    sw $t3, 16($t6)
    sw $t3, 20($t6)

    sw $t1, 24($t6)
    sw $t1, 28($t6)
    sw $t1, 32($t6)
    sw $t1, 36($t6)
    sw $t1, 40($t6)
    sw $t1, 44($t6)
    sw $t1, 48($t6)
    sw $t1, 52($t6)
    sw $t1, 56($t6)

    sw $t3, 60($t6)

    add $t6, $t6, $t5

    sw $t4, 0($t6)
    sw $t4, 8($t6)

    sw $t3, 16($t6)
    sw $t3, 20($t6)

    sw $t1, 24($t6)
    sw $t1, 28($t6)
    sw $t1, 32($t6)
    sw $t1, 36($t6)
    sw $t1, 40($t6)
    sw $t1, 44($t6)
    sw $t1, 48($t6)

    sw $t3, 52($t6)
    sw $t3, 56($t6)
    sw $t3, 60($t6)

    add $t6, $t6, $t5

    sw $t4, 4($t6)

    sw $t3, 12($t6)

    sw $t1, 24($t6)
    sw $t1, 28($t6)
    sw $t1, 32($t6)
    sw $t1, 36($t6)

    sw $t3, 40($t6)
    sw $t3, 44($t6)
    sw $t3, 48($t6)
    sw $t3, 52($t6)

    add $t6, $t6, $t5

    sw $t3, 20($t6)
    sw $t3, 24($t6)
    sw $t3, 28($t6)
    sw $t3, 32($t6)
    sw $t3, 36($t6)

    jr $ra

CLEARSCREEN:
    lw $t0, displayAddress
    lw $t1, displayWidth
    lw $t2, displayHeight

    mul $t3, $t1, $t2
    add $t3, $t3, $t0

    li $t4, 0
    CLEARSCREENLOOP:
    beq $t0, $t3, CLEARSCREENENDLOOP
    sw $t4, ($t0)
    addi $t0, $t0, 4
    j CLEARSCREENLOOP
    CLEARSCREENENDLOOP:

    jr $ra