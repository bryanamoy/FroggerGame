; 115200 baud rate
	.data
border1:	.string "|---------------------------------------------|", 0x0D, 0x0A
border2:	.string "|*********************************************|", 0x0D, 0x0A
border3:	.string "|*****     *****     *****     *****     *****|", 0x0D, 0x0A
border4:	.string "|~~~O~~~~~~Aaaaaa~~~~O~Aaaaaa~~~O~~~~Aaaaaa~~~|", 0x0D, 0x0A
border5:	.string "|~~~LLLLLL~~~~~~~~~~LLLLLL~~~~LLLLLL~~~~~~~~~~|", 0x0D, 0x0A
border6:	.string "|~~~TT~~~~~~~~TT~~~~TT~~~~~O~~~TT~~~~Aaaaaa~~~|", 0x0D, 0x0A
border7:	.string "|~~~~~~~LLLLLL~~~~~~LLLLLL~~~~~~~~~~~~LLLLLL~~|", 0x0D, 0x0A
border8:	.string "|.............................................|", 0x0D, 0x0A
border9:	.string "|    ####                        ####         |", 0x0D, 0x0A
border10:	.string "|      C                  C          C        |", 0x0D, 0x0A
border11:	.string "|                                             |", 0x0D, 0x0A
border12:	.string "|                           ####              |", 0x0D, 0x0A
border13:	.string "|                                             |", 0x0D, 0x0A
border14:	.string "|             C           C         C         |", 0x0D, 0x0A
border15:	.string "|......................&......................|", 0x0D, 0x0A
border16:	.string "|---------------------------------------------|", 0x0D, 0x0A
round_time:	.string "time:60                                        ", 0x0D, 0x0A
level:		.string "level:00                                       ", 0x0D, 0x0A
score:		.string "score:00000                                    ", 0
	.text
instructions:	.string "The goal of the game is to accumulate as", 0x0D, 0x0A
instruction1:	.string	"many points by: moving forward(10pts),", 0x0D, 0x0A
instruction2:	.string "getting a frog home(H)(50pts), each second", 0x0D, 0x0A
instruction3:	.string	"unused time(10pts), eating a fly(+)(100pts),", 0x0D, 0x0A
instruction4:	.string "& increasing level(250pts). If you send a", 0x0D, 0x0A
instruction5:	.string	"frog to an already occupied Home slot, you", 0x0D, 0x0A
instruction6:	.string "lose a life. Home are the empty slots at", 0x0D, 0x0A
instruction7:	.string	"the top of the board. To start game press", 0x0D, 0x0A
instruction8:	.string "1 on keypad and make first move with frog", 0x0D, 0x0A
instruction9:	.string "start the movement on the board & timer.", 0x0D, 0x0A
instruction10:	.string "To un/pause game press 2 & to restart press", 0x0D, 0x0A
instruction11:	.string	"3 on keypad. To move the frog(&), use w for up,", 0x0D, 0x0A
instruction12:	.string "a for left, s for down, & d for right. You", 0x0D, 0x0A
instruction13:	.string "have 4 lives represented by the # of LEDs lit.", 0x0D, 0x0A
instruction14:	.string "You lose a life if you collide with a car(C),", 0x0D, 0x0A
instruction15:	.string "truck(####), fall in the river(~), jump on gator", 0x0D, 0x0A
instruction16:	.string "head(A), or if you run out of time(60s per round).", 0x0D, 0x0A
instruction17:	.string "To advance level, send 2 frogs home.", 0x0D, 0x0A
instruction18:	.string "Game is over if you use up 4 lives.", 0x0D, 0x0A, 0
pause:	.string "The game is paused, to unpause press 2 on keypad", 0x0D, 0x0A, 0
gameover:	.string "GAMEOVER! To restart press 3 on the keypad", 0x0D, 0x0A, 0
reset1:	.string "|---------------------------------------------|", 0x0D, 0x0A
reset2:	.string "|*********************************************|", 0x0D, 0x0A
reset3:	.string "|*****     *****     *****     *****     *****|", 0x0D, 0x0A
reset4:	.string "|~~~O~~~~~~Aaaaaa~~~~O~Aaaaaa~~~O~~~~Aaaaaa~~~|", 0x0D, 0x0A
reset5:	.string "|~~~LLLLLL~~~~~~~~~~LLLLLL~~~~LLLLLL~~~~~~~~~~|", 0x0D, 0x0A
reset6:	.string "|~~~TT~~~~~~~~TT~~~~TT~~~~~O~~~TT~~~~Aaaaaa~~~|", 0x0D, 0x0A
reset7:	.string "|~~~~~~~LLLLLL~~~~~~LLLLLL~~~~~~~~~~~~LLLLLL~~|", 0x0D, 0x0A
reset8:	.string "|.............................................|", 0x0D, 0x0A
reset9:	.string "|    ####                        ####         |", 0x0D, 0x0A
reset10:	.string "|      C                  C          C        |", 0x0D, 0x0A
reset11:	.string "|                                             |", 0x0D, 0x0A
reset12:	.string "|                           ####              |", 0x0D, 0x0A
reset13:	.string "|                                             |", 0x0D, 0x0A
reset14:	.string "|             C           C         C         |", 0x0D, 0x0A
reset15:	.string "|......................&......................|", 0x0D, 0x0A
reset16:	.string "|---------------------------------------------|", 0x0D, 0x0A
reset_round_time:	.string "time:60                                        ", 0x0D, 0x0A
reset_level:		.string "level:00                                       ", 0x0D, 0x0A
reset_score:		.string "score:00000                                    ", 0
	.global frogger
	.global uart_init
	.global timer_init
	.global keypad_init
	.global UART0Handler
	.global Timer0Handler
	.global PortAHandler
	.global finish
	.global ptr
	.global menu
	.global read_character
	.global output_character
	.global print_board
	.global illuminate_RGB_LED
	.global read_from_keypad
	.global illuminate_LEDs
	.global gameover_screen
	.global go
	.global pause_ptr
	.global pause_screen
	.global reset_ptr
	.global score_ptr
score_ptr:	.word score
reset_ptr:	.word reset1
ptr: .word border1
go:	.word gameover
pause_ptr:	.word pause
menu: .word instructions
U0LSR: .equ 0x18
; in use: r4, r6, r10, r9, r8, r11, r12
; r4 = pointer to frog
; r6 = state of game
; r10 = lives
; r9 = to shift or not shift objects
; r8 = timer counter
; r11 = spawn register
; r12 = frog move left/right or no move
; r7 = previous character
; 0x200003A3 holds score
frogger:
	STMFD SP!, {lr}
	BL keypad_init
	BL uart_init			; initialize uart
	LDR r0, menu
	BL print_board
	;LDR r0, ptr
	MOV r4, #0x02C5
	MOVT r4, #0x2000		; r4 = pointer frog
	;BL print_board			; print board
	MOV r6, #1				; indicator for state of game
	BL illuminate_RGB_LED	; light up RGB LED initially
							; address 1st digit of timer = 20000315, 20000316
							; address 1st digit Level = 20000347, 2nd 20000348
							; Score: 20000378, 0379, 037A, 037B, 037C
	MOV r10, #4
	BL illuminate_LEDs
	MOV r9, #1
	MOV r8, #10
	MOV r11, #1				; counter
	MOV r12, #1				; indicator if frog is to move or not, 1 = stationary, 2 = to move right, 3 = to move left
	MOV r7, #0x20
	LDMFD SP!, {lr}
	mov pc, lr

output_character:
	STMFD SP!,{lr}			; Store register lr on stack
	MOV r2, #0xC000
	MOVT r2, #0x4000
	STRB r1, [r2]			; Transmit byte

txFlag:
	LDRB r3, [r2,#U0LSR] 	; load byte of status register
	MOV r5, #0x20 			; r5 = 0x00000020
	AND r3, r3, r5			; Mask bit 5 in status register to get TxFF
	CMP r3, r5
	BEQ txFlag
	LDMFD sp!, {lr}
	MOV pc, lr

print_board:
	STMFD SP!, {lr}
	MOV r1, #0x0C
	BL output_character
	MOV r1, #0x0A
	BL output_character
	MOV r1, #0x0D
	BL output_character
printing
	LDRB r1, [r0]			; load character
	CMP r1, #0x00			; compare to null
	BEQ printing_end		; if null branch to end
	BL output_character
	ADD r0, r0, #1			; increment address
	B printing
printing_end
	MOV r1, #0xA			; new line
	BL output_character
	MOV r1, #0xD			; enter
	BL output_character
	LDMFD SP!, {lr}
	MOV pc, lr

score_fly:					; add 100 points if ate fly
	STMFD SP!, {lr}
	MOV r0, #0x037A
	MOVT r0, #0x2000		; hundreds place of score
	LDRB r1, [r0]			; load digit
	SUB r1, r1, #48			; convert to decimal
	ADD r1, r1, #1			; add one (100 pts)
	CMP r1, #9
	BLE fly_nine			; branch if sum <= 9
	SUB r1, r1, #10			; if sum > 9, take difference from 10
	ADD r1, r1, #48			; convert to char
	STRB r1, [r0]			; store difference in hundreds place
	SUB r0, r0, #1			; move to thousandth place
	LDRB r1, [r0]			; load thousandth digit
	SUB r1, r1, #48			; convert to decimal
	ADD r1, r1, #1			; add one
	CMP r1, #9
	BLE fly_nine			; branch if thousand place sum <= 9
	SUB r1, r1, #10			; take difference of thousand place sum
	ADD r1, r1, #48			; convert to char
	STRB r1, [r0]
	SUB r0, r0, #1			; go to 10 thousand place
	LDRB r1, [r0]
	ADD r1, r1, #1			; add one for carry
	STRB r1, [r0]			; update 10 thousand place
	B score_fly_end
fly_nine
	ADD r1, r1, #48			; if sum <= 9 convert to char
	STRB r1, [r0]			; store sum to hundreds place
	B score_fly_end
score_fly_end
	LDMFD SP!, {lr}
	MOV pc, lr

collision_check:
	STMFD SP!, {lr}
	CMP r2, #0x7E			; hit water
	BEQ hit_water
	CMP r2, #0x43			; hit car
	BEQ hit_car
	CMP r2, #0x23			; hit truck
	BEQ hit_truck
	CMP r2, #0x2A			; hit *
	BEQ hit_asterisk
	CMP r2, #0x7C			; hit |
	BEQ hit_border
	CMP r2, #0x2D
	BEQ hit_border_dash		; hit -
	CMP r2, #0x41
	BEQ hit_gator_head		; hit A
	CMP r2, #0x4C
	BEQ hit_log				; on a log
	CMP r2, #0x2E
	BEQ hit_dot				; hit "."
	CMP r2, #0x20
	BEQ hit_space			; on "space"
	CMP r2, #0x61
	BEQ hit_gator_body		; hit a
	CMP r2, #0x54
	BEQ hit_turtle			; hit T
	CMP r2, #0x4F
	BEQ hit_lily			; hit lily
	CMP r2, #0x2B
	BEQ hit_fly				; hit +
	B collision_check_end
hit_fly
	MOV r12, #1				; update indicator to stationary
	MOV r7, #0x2E			; update previous character as .
	BL score_fly			; add 100 points for hitting fly
	B collision_check_end
hit_lily
	MOV r12, #3				; update indicator to move left
	MOV r7, #0x4F			; update previous character as O
	B collision_check_end
hit_turtle
	MOV r12, #3				; update indicator to move left
	MOV r7, #0x54			; update previous character to T
	B collision_check_end
hit_gator_body
	MOV r12, #3				; indicator to move frog right
	MOV r7, #0x61				; save "a" for frog is on gator body
	B collision_check_end
hit_dot
	MOV r12, #1				; update indicator to be stationary
	MOV r7, #0x2E			; update previous character to .
	B collision_check_end
hit_space
	MOV r12, #1				; update indicator to be stationary
	MOV r7, #0x20			; update previous character to "space"
	B collision_check_end
hit_water
	MOV r12, #1				; upadate indicator to stationary
	MOV r7, #0x20			; update previous character to space
	SUB r10, r10, #1		; minus life
	BL illuminate_LEDs		; update LEDs
	MOV r4, #0x02C7
	MOVT r4, #0x2000
	B collision_check_end
hit_car
	MOV r12, #1				; update indicator to stationary
	SUB r10, r10, #1		; minus life
	BL illuminate_LEDs		; update LEDs
	MOV r4, #0x02BE			; respawn address
	MOVT r4, #0x2000
	B collision_check_end
hit_truck
	MOV r12, #1				; update indicator to stationary
	SUB r10, r10, #1		; minus life
	BL illuminate_LEDs		; update LEDs
	MOV r4, #0x02B4			; respawn address
	MOVT r4, #0x2000
	B collision_check_end
hit_asterisk
	MOV r12, #3				; update indicator to move left
	ADD r4, r4, #49			; put back frog
	B collision_check_end
hit_border
	MOV r7, #0x20			; update previous character to "space"
	MOV r12, #1				; update indicator to stationary
	SUB r10, r10, #1		; minus life
	BL illuminate_LEDs		; update LEDs
	MOV r4, #0x02C5			; respawn address
	MOVT r4, #0x2000
	B collision_check_end
hit_border_dash
	MOV r12, #1				; update indicator to stationary
	SUB r4, r4, #49			; doesnt allow frog to go into bottom border
	B collision_check_end
hit_gator_head
	MOV r7, #0x20			; update previous character to space
	MOV r12, #1				; update indicator to stationary
	SUB r10, r10, #1		; minus life
	BL illuminate_LEDs		; update LEDs
	MOV r4, #0x02C3			; respawn address
	MOVT r4, #0x2000
	B collision_check_end
hit_log
	MOV r12, #2				; update indicator to move right
	MOV r7, #0x4C			; update previous character to L
	B collision_check_end

collision_check_end
	LDMFD SP!, {lr}
	MOV pc, lr


read_character:
	STMFD SP!, {lr}
	MOV r2, #0xC000
	MOVT r2, #0x4000
	MOV r0, #0x0000
	MOVT r0, #0x2000
	LDRB r3, [r2,#U0LSR]	; load status register RxFE
	MOV r5, #0x10
	AND r3, r3, r5			; mask status register to test for 1 or 0
	CMP r3, r5				; compare for 0 or 1
	BEQ read_character		; if equal 0 loop back

	LDRB r1, [r2]			; Read key from Recieve Register
;	CMP r6, #4
;	BEQ game_over_button
;	CMP r6, #3
;	BEQ pause_unpause		; if in paused state ignore key press, check only for unpause
	CMP r1, #0x77			; branch if key press = w
	BEQ key_w
	CMP r1, #0x61			; branch if key press = a
	BEQ key_a
	CMP r1, #0x73			; branch if key press = s
	BEQ key_s
	CMP r1, #0x64			; branch if key press = d
	BEQ key_d
;	CMP r1, #0x6A
;	BEQ key_j
;	CMP r1, #0x6B
;	BEQ key_k
;pause_unpause
;	CMP r1, #0x68			; use h for pause state
;	BEQ key_h
;	CMP r1, #0x6B
;	BEQ key_k
;	B end_key				; other key, ignore
;game_over_button
;	CMP r1, #0x6B
;	BEQ key_k
	B end_key
;key_k
;	BL reset_game
;	B end_key
;key_j
;	LDR r0, ptr
;	BL print_board

;	B start_game
key_w
	STRB r7, [r4]			; input previous object in old frog postion
	SUB r4, r4, #49			; next position for frog
	LDRB r2, [r4]
	BL collision_check
	MOV r1, #0x26
	STRB r1, [r4]			; store frog in new position
	MOV r1, #0x037B
	MOVT r1, #0x2000		; tenth position of score
	LDRB r0, [r1]			; read current value of tenth position of score
	CMP r0, #0x39			; is the value '9'?
	BEQ score_tenth
	ADD r0, r0, #1
	STRB r0, [r1]
	B not_score_nine
score_tenth
	MOV r0, #0x30			; if value is '9' reset to 0
	STRB r0, [r1]
	SUB r1, r1, #1			; go to 100th place
	LDRB r0, [r1]			; read 100th place value
	CMP r0, #0x39			; compare it to 9
	BEQ score_hundredth
	ADD r0, r0, #1
	STRB r0, [r1]
	B not_score_nine
score_hundredth
	MOV r0, #0x30			; if 100th place is 9 change to 0
	STRB r0, [r1]
	SUB r1, r1, #1			; go to 1000th place
	LDRB r0, [r1]
	ADD r0, r0, #1
	STRB r0, [r1]
not_score_nine
	;CMP r6, #1
	;BEQ start_game
	B end_key
key_a
	STRB r7, [r4]			; input previous object in old frog postion
	SUB r4, r4, #1			; next position for frog
	LDRB r2, [r4]
	BL collision_check
	MOV r1, #0x26
	STRB r1, [r4]			; store frog in new position
	B end_key
key_s
	STRB r7, [r4]			; input previous object in old frog postion
	ADD r4, r4, #49			; next position for frog
	LDRB r2, [r4]
	BL collision_check
	MOV r1, #0x26
	STRB r1, [r4]			; store frog in new position
	;CMP r6, #1
	;BEQ start_game
	B end_key
key_d
	STRB r7, [r4]			; input previous object in old frog postion
	ADD r4, r4, #1			; next position for frog
	LDRB r2, [r4]
	BL collision_check
	MOV r1, #0x26
	STRB r1, [r4]			; store frog in new position
	MOV r0, #0x027E
	MOVT r0, #0x2000
	MOV r1, #0x43
	STRB r1, [r0]
	B end_key
;key_h
;	CMP r6, #3
;	BEQ unpause
;	MOV r6, #3
;	BL illuminate_RGB_LED
;	BL pause_screen
;	B end_key
;unpause
;	MOV r6, #2
;	BL illuminate_RGB_LED
;	B end_key
;start_game
;	MOV r6, #2
;	BL illuminate_RGB_LED
;	BL timer_init
end_key

	LDMFD SP!, {lr}
	MOV pc, lr

reset_game:
	STMFD SP!, {lr}
	MOV r0, #0x0000
	MOVT r0, #0x2000
	LDR r1, reset_ptr		; reset board address
reset_game_loop
	LDRB r2, [r1]			; load byte of reset board
	CMP r2, #0x00			; if null found branch
	BEQ reset_null
	STRB r2, [r0]			; if not update game board from reset board
	ADD r0, r0, #1			; increment address
	ADD r1, r1, #1			; increment address
	B reset_game_loop
reset_null
	STRB r2, [r0]			; store null
	MOV r0, #0xED0C
	MOVT r0, #0xE000		; reset register
	MOV r1, #0x0004			; bit 2 = system reset request
	MOVT r1, #0xFA05		; vectkey, must write FA05 to write to reset register
	LDR r2, [r0]
	ORR r1, r1, r2
	STR r1, [r0]
	B frogger
	LDMFD SP!, {lr}
	MOV pc, lr

read_from_keypad:
	STMFD SP!, {lr}
	MOV r1, #0x43FC
	MOVT r1, #0x4000		; r1 = 0x400043FC, port A data register
	LDRB r3, [r1]			; load byte of port A data register
	MOV r1, #0x3C
	AND r3, r3, r1
	CMP r3, #0
	BEQ read_from_keypad	; loop back to read_from_keypad until find a 1 in the pins
	MOV r5, r3				; Copy port A bits to r5
	MOV r1, #0x73FC
	MOVT r1, #0x4000		; r1 = 0x400073FC port D data register
	MOV r2, #1				; r2 = 0001
	STRB r2, [r1]			; D0 row set high
	MOV r1, #0x43FC
	MOVT r1, #0x4000		; r1 = 0x400043FC, port A data register
	LDRB r3, [r1]			; read port A pins
	AND r2, r3, r5			; AND current A pins to saved value
	CMP r2, r5
	BEQ row_one				; If AND value matches, key found in row 1
	B read_from_keypad_end
row_one
	CMP r6, #4
	BEQ game_over_key
	CMP r6, #3
	BEQ pUP					; if in paused state ignore key press, check only for unpause or restart
	CMP r2, #4
	BEQ key_one				; if byte = 4, key 1 pressed
	CMP r2, #0x10
	BEQ key_three			; if byte = 0x10, key 3 pressed
pUP
	CMP r2, #8
	BEQ key_two				; if byte = 8, key 2 pressed
	CMP r2, #0x10			; if byte = 0x10 key 3 pressed
	BEQ key_three
	B read_from_keypad_end
game_over_key
	CMP r2, #0x10
	BEQ key_three
	B read_from_keypad_end
key_one
	BL uart_init
	LDR r0, ptr
	BL print_board
	MOV r1, #0x73FC
	MOVT r1, #0x4000		; r1 = 0x400073FC port D data register
	MOV r2, #0xF			; r2 = 1111
	STRB r2, [r1]			; enable all D pins again
	B key_one_start
key_one_start
	MOV r6, #2
	BL illuminate_RGB_LED
	BL timer_init
	B read_from_keypad_end
key_two
	BL uart_init
	MOV r1, #0x73FC
	MOVT r1, #0x4000		; r1 = 0x400073FC port D data register
	MOV r2, #0xF			; r2 = 1111
	STRB r2, [r1]			; enable all D pins again
	CMP r6, #3
	BEQ unpause_game
	MOV r6, #3
	BL illuminate_RGB_LED
	BL pause_screen
	B read_from_keypad_end
unpause_game
	MOV r6, #2
	BL illuminate_RGB_LED
	B read_from_keypad_end
key_three
	BL uart_init
	MOV r1, #0x73FC
	MOVT r1, #0x4000		; r1 = 0x400073FC port D data register
	MOV r2, #0xF			; r2 = 1111
	STRB r2, [r1]			; enable all D pins again
	BL reset_game
	B read_from_keypad_end
read_from_keypad_end

	LDMFD SP!, {lr}
	MOV pc, lr

pause_screen:
	STMFD SP!, {lr}
	LDR r0, pause_ptr			; load pointer to pause string
pause_screen_loop
	LDRB r1, [r0]
	CMP r1, #0x00
	BEQ pause_screen_end
	BL output_character			; print pause prompt
	ADD r0, r0, #1
	B pause_screen_loop
pause_screen_end

	LDMFD SP!, {lr}
	MOV pc, lr

gameover_screen:
	STMFD SP!, {lr}
	MOV r1, #0x0C
	BL output_character
	MOV r10, #5
	MOV r6, #4
	BL illuminate_RGB_LED		; light RGB to blue
	LDR r0, go
gameover_screen_loop
	LDRB r1, [r0]
	CMP r1, #0x00
	BEQ gameover_screen_end
	BL output_character			; print game over prompt
	ADD r0, r0, #1
	B gameover_screen_loop
gameover_screen_end
	LDR r0, score_ptr			; loop to display score in gameover screen
display_score_loop
	LDRB r1, [r0]
	CMP r1, #0x00
	BEQ display_score_loop_end
	BL output_character
	ADD r0, r0, #1
	B display_score_loop

display_score_loop_end
	MOV r1, #0x0A
	BL output_character
	MOV r1, #0x0D
	BL output_character

	LDMFD SP!, {lr}
	MOV pc, lr

game_time:						; this changes the characters for the game timer on screen
	STMFD SP!, {lr}
	MOV r0, #0x0315
	MOVT r0, #0x2000			; tenth place
gametime_loop
	LDRB r1, [r0]				; load tenth place digit
	CMP r1, #0x30
	BEQ time_tenth_zero			; if tenth place = 0, branch
tenth_loop
	MOV r0, #0x0316
	MOVT r0, #0x2000			; if not load ones place
	LDRB r1, [r0]
	CMP r1, #0x30
	BEQ time_one_zero			; if ones place = 0, branch
	SUB r1, r1, #1				; decrement ones place digit
	STRB r1, [r0]
	B gametime_end
time_one_zero					; if ones place is 0
	MOV r1, #0x39
	STRB r1, [r0]				; change ones place to 9
	MOV r0, #0x0315
	MOVT r0, #0x2000			; tenth place
	LDRB r1, [r0]
	SUB r1, r1, #1				; decrement tenth place
	STRB r1, [r0]
	B gametime_end
time_tenth_zero
	MOV r0, #0x0316
	MOVT r0, #0x2000			; ones digit
	LDRB r1, [r0]
	CMP r1, #0x30
	BEQ gameover_screen			; branch to gameover screen if both digits of timer = 0
	B tenth_loop
gametime_end
	LDMFD SP!, {lr}
	MOV pc, lr

spawn_car:						; 0x200001BA, 0x2000027E
	STMFD SP!, {lr}
	MOV r1, #0x43
	STRB r1, [r0]				; stores new car
	LDMFD SP!, {lr}
	MOV pc, lr

spawn_truck:					; 0x200001B5, 0x20000248
	STMFD SP!, {lr}
	MOV r1, #0x23
	STRB r1, [r0]				; stores new truck
	LDMFD SP!, {lr}
	MOV pc, lr

spawn_log:						; 0x20000127, 0x200000C5
	STMFD SP!, {lr}
	MOV r1, #0x4C
	STRB r1, [r0]				; stores new log
	LDMFD SP!, {lr}
	MOV pc, lr

spawn_turtle:					; 0x20000122
	STMFD SP!, {lr}
	MOV r1, #0x54
	STRB r1, [r0]				; stores new turtle
	LDMFD SP!, {lr}
	MOV pc, lr

spawn_lily:						; 0x20000122, 0x200000C0
	STMFD SP!, {lr}
	MOV r1, #0x4F
	STRB r1, [r0]				; stores new lily
	LDMFD SP!, {lr}
	MOV pc, lr

spawn_gator_head:				; 0x20000122, 0x200000C0
	STMFD SP!, {lr}
	MOV r1, #0x41
	STRB r1, [r0]				; stores new gator head
	LDMFD SP!, {lr}
	MOV pc, lr

spawn_gator_body:				; 0x20000122, 0x200000C0
	STMFD SP!, {lr}
	MOV r1, #0x61
	STRB r1, [r0]				; stores new gator body
	LDMFD SP!, {lr}
	MOV pc, lr

spawn_fly:
	STMFD SP!, {lr}
	MOV r1, #0x2B
	STRB r1, [r0]				; stores fly
	LDMFD SP!, {lr}
	MOV pc, lr

add_home_score:				; adding 50 points for return frog home
	STMFD SP!, {lr}
	MOV r0, #0x037B
	MOVT r0, #0x2000			; tenth place of score
	LDRB r1, [r0]				; load digit
	CMP r1, #0x34
	BLE tenth_le_four
	CMP r1, #0x39
	BEQ score_hundred_place		; branch if tenth place = 9
	CMP r1, #0x35
	BEQ hundred_five			; branch if tenth place = 5
	CMP r1, #0x36
	BEQ hundred_six				; branch if tenth place = 6
	CMP r1, #0x37
	BEQ hundred_seven			; branch if tenth place = 7
	CMP r1, #0x38
	BEQ hundred_eight			; branch if tenth place = 8
	B add_home_score_end
hundred_eight
	MOV r1, #0x33
	STRB r1, [r0]				; store 3 in tenth place
	SUB r0, r0, #1				; go to hundred place
	LDRB r1, [r0]
	CMP r1, #0x39
	BEQ score_thousandth_place	; branch if hundred place is 9
	ADD r1, r1, #1				; if not add one
	STRB r1, [r0]				; update hundred place
	B add_home_score_end
hundred_seven
	MOV r1, #0x32
	STRB r1, [r0]				; store 2 in tenth place
	SUB r0, r0, #1				; go to hundred place
	LDRB r1, [r0]
	CMP r1, #0x39
	BEQ score_thousandth_place	; branch if hundred place if 9
	ADD r1, r1, #1				; if not add one
	STRB r1, [r0]
	B add_home_score_end
hundred_six
	MOV r1, #0x31
	STRB r1, [r0]				; store 1 in tenth place
	SUB r0, r0, #1				; go to hundred place
	LDRB r1, [r0]
	CMP r1, #0x39
	BEQ score_thousandth_place	; branch if hundred place is 9
	ADD r1, r1, #1				; if not add one
	STRB r1, [r0]
	B add_home_score_end
hundred_five
	MOV r0, #0x30
	STRB r1, [r0]				; store 0 in tenth place
	SUB r0, r0, #1				; go to hundreth place
	LDRB r1, [r0]
	CMP r1, #0x39				; if hundreth place = 9 branch
	BEQ score_thousandth_place
	ADD r1, r1, #1
	STRB r1, [r0]				; increment hundreth place by 1
	B add_home_score_end
tenth_le_four
	ADD r1, r1, #5
	STRB r1, [r0]
	B add_home_score_end
score_hundred_place
	MOV r1, #0x34
	STRB r1, [r0]				; store 4 in tenth place
	SUB r0, r0, #1				; go to hundreth place
	LDRB r1, [r0]
	CMP r1, #0x39				; is hundreth place = 9
	BEQ score_thousandth_place
	ADD r1, r1, #1
	STRB r1, [r0]				; if hundreth place not 9, increment by 1
	B add_home_score_end
score_thousandth_place
	MOV r1, #0x30
	STRB r1, [r0]
	SUB r0, r0, #1				; go to thousandth place
	LDRB r1, [r0]
	CMP r1, #0x39
	BEQ score_ten_thousand_place
	ADD r1, r1, #1				; increment by 1
	STRB r1, [r0]
	B add_home_score_end
score_ten_thousand_place
	MOV r1, #0x30
	STRB r1, [r0]
	SUB r0, r0, #1
	LDRB r1, [r0]
	ADD r1, r1, #1
	STRB r1, [r0]
	B add_home_score_end
add_home_score_end

	LDMFD SP!, {lr}
	MOV pc, lr

add_level_score:			; add 250 points for advancing level
	STMFD SP!, {lr}
	MOV r0, #0x037B
	MOVT r0, #0x2000	; tenth place of score
	LDRB r1, [r0]		; load digit
	SUB r1, r1, #48		; convert to decimal
	ADD r1, r1, #5		; add 5 for the 50 points
	CMP r1, #9
	BLE ten_nine		; branch if sum of tenth place and 5 is less than equal 9
	SUB r1, r1, #10		; take difference from 10
	ADD r1, r1, #48		; convert difference to char
	STRB r1, [r0]		; store tenth place plus 50 points
	SUB r0, r0, #1		; go to hundreds place
	LDRB r1, [r0]
	SUB r1, r1, #48		; convert to decimal
	ADD r1, r1, #3		; add 2 plus from carry
	CMP r1, #9
	BLE hundred_nine	; branch if sum of hundred digit plus points < 9
	SUB r1, r1, #10		; take difference from 10
	ADD r1, r1, #48
	STRB r1, [r0]
	SUB r0, r0, #1		; go to thousand place
	LDRB r1, [r0]		; load thousand number
	ADD r1, r1, #1
	CMP r1, #9
	BLE thousand_nine
	SUB r1, r1, #10
	ADD r1, r1, #48		; convert to char
	STRB r1, [r0]		; store thousand place
	SUB r0, r0, #1		; 10 thousand place
	LDRB r1, [r0]
	ADD r1, r1, #1		; increment 10 thousand place
	STRB r1, [r0]
	B add_level_score_end
ten_nine
	ADD r1, r1, #48		; convert to char
	STRB r1, [r0]		; store sum to tenth place
	SUB r0, r0, #1		; move to hundreds place
	LDRB r1, [r0]		; load hundreds digit
	SUB r1, r1, #48		; convert to decimal
	ADD r1, r1, #2
	CMP r1, #9
	BLE hundred_nine	; branch if sum hundreds place and 2 is less than equal 9
	SUB r1, r1, #10		; if sum greater than 9 take difference of 10
	ADD r1, r1, #48		; convert to char
	STRB r1, [r0]		; store difference in hundreds place
	SUB r0, r0, #1		; go to thousands place
	LDRB r2, [r0]		; load thousands digit
	SUB r2, r2, #48		; convert to decimal
	ADD r2, r2, #1		; sum thousands place plus carry
	CMP r2, #9
	BLE thousand_nine
	SUB r2, r2, #10		; take difference
	STRB r2, [r0]		; store in thousand place
	SUB r0, r0, #1		; 10 thousand place
	LDRB r1, [r0]
	ADD r1, r1, #1		; increment 10 thousand place
	STRB r1, [r0]
	B add_level_score_end
hundred_nine
	ADD r1, r1, #48		; convert to char
	STRB r1, [r0]		; update plus the 200 points
	B add_level_score_end
thousand_nine
	ADD r2, r2, #48		; convert to char
	STRB r2, [r0]
add_level_score_end
	LDMFD SP!, {lr}
	MOV pc, lr

unused_time:			; address 1st digit of timer = 20000315, 20000316 address of Score: 20000378, 0379, 037A, 037B, 037C
						; multiplies time left by 10 and add to score accordingly
	STMFD SP!, {lr}
	MOV r0, #0x0316
	MOVT r0, #0x2000
	LDRB r1, [r0]		; load ones digit of time
	SUB r1, r1, #48		; convert to decimal
	MOV r0, #0x037B
	MOVT r0, #0x2000
	LDRB r2, [r0]		; load score tenth digit
	SUB r2, r2, #48		; convert  to decimal
	ADD r1, r1, r2		; add numbers
	CMP r1, #9
	BLE less_nine		; branch if sum is less than or equal to nine
	SUB r1, r1, #10		; take ones digit of sum
	ADD r1, r1, #48		; convert  to char
	STRB r1, [r0]		; store difference to tenth place of score
	MOV r0, #0x0315
	MOVT r0, #0x2000
	LDRB r2, [r0]		; load tenths place of time
	ADD r2, r2, #1		; add one from carry over
	SUB r2, r2, #48  	; convert  to decimal
	MOV r0, #0x037A
	MOVT r0, #0x2000	; hundreds place of score
	LDRB r1, [r0]		; load digit of hundreds place
	SUB r1, r1, #48		; convert to decimal
	ADD r1, r1, r2		; sum hundreds place of score and tenth place of time + 1
	CMP r2, #9
	BLE hun_nine
	SUB r1, r1, #10		; r1 = difference of sum - 10
	ADD r1, r1, #48		; convert to char
	STRB r1, [r0]		; store difference in hundreds place of score
	SUB r0, r0, #1		; go to thousands place
	LDRB r1, [r0]		; get thousandth digit
	ADD r1, r1, #1		; add one
	STRB r1, [r0]		; store
	B unused_time_loop_end
less_nine
	ADD r1, r1, #48		; convert sum to character
	STRB r1, [r0]		; store tenth digit
	MOV r0, #0x0315
	MOVT r0, #0x2000	; tenth digit of time
	LDRB r1, [r0]
	SUB r1, r1, #48		; convert to decimal
	MOV r0, #0x037A
	MOVT r0, #0x2000	; hundreds digit of score
	LDRB r2, [r0]
	SUB r2, r2, #48		; convert to decimal
	ADD r1, r1, r2		; sum numbers together
	CMP r1, #9
	BLE hun_nine		; branch if sum is less than or equal to nine
	SUB r1, r1, #10
	ADD r1, r1, #48		; convert to char
	STRB r1, [r0]		; store difference to hundreds place
	SUB r0, r0, #1		; move to thousands place
	LDRB r2, [r0]
	ADD r2, r2, #1		; add one to thousands place
	STRB r2, [r0]
	B unused_time_loop_end
hun_nine
	ADD r1, r1, #48		; convert to character
	STRB r1, [r0]		; store tenth place of time * 10 to hundreds place of score

unused_time_loop_end

	LDMFD SP!, {lr}
	MOV pc, lr

check_home:
	STMFD SP!, {lr}
						; Home slots: 68, 69, 6A, 6B, 6C
						;             72, 73, 74, 75, 76
						;			  7C, 7D, 7E, 7F, 80
						;			  86, 87, 88, 89, 8A
	MOV r0, #0x0068
	MOVT r0, #0x2000
	MOV r2, #0x48
check_first_home_loop
	LDRB r1, [r0]
	ADD r0, r0, #1
	CMP r1, #0x26
	BEQ print_H_first			; is there a frog in home slot?
	CMP r1, #0x2A
	BNE check_first_home_loop
	MOV r0, #0x0072
	MOVT r0, #0x2000
	B check_second_home_loop
print_H_first				; prints H in respective 5 slots, first home
	MOV r0, #0x0068
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x0069
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x006A
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x006B
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x006C
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r4, #0x02D0
	MOVT r4, #0x2000
	MOV r1, #0x26
	STRB r1, [r4]
	BL add_home_score
	MOV r12, #1
	MOV r7, #0x2E
	B check_home_end
check_second_home_loop
	LDRB r1, [r0]
	ADD r0, r0, #1
	CMP r1, #0x26
	BEQ print_H_second			; is there a frog in second home slot?
	CMP r1, #0x2A
	BNE check_second_home_loop
	MOV r0, #0x007C
	MOVT r0, #0x2000
	B check_third_home_loop
print_H_second				; prints H in second home slots
	MOV r0, #0x0072
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x0073
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x0074
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x0075
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x0076
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r4, #0x02D4
	MOVT r4, #0x2000
	MOV r1, #0x26
	STRB r1, [r4]
	BL add_home_score
	MOV r12, #1
	MOV r7, #0x2E
	B check_home_end
check_third_home_loop
	LDRB r1, [r0]
	ADD r0, r0, #1
	CMP r1, #0x26
	BEQ print_H_third			; is there a frog in third home slot?
	CMP r1, #0x2A
	BNE check_third_home_loop
	MOV r0, #0x0086
	MOVT r0, #0x2000
	B check_fourth_home_loop
print_H_third					; prints H in third home slot
	MOV r0, #0x007C
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x007D
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x007E
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x007F
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x0080
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r4, #0x02B8
	MOVT r4, #0x2000
	MOV r1, #0x26
	STRB r1, [r4]
	BL add_home_score
	MOV r12, #1
	MOV r7, #0x2E
	B check_home_end
check_fourth_home_loop
	LDRB r1, [r0]
	ADD r0, r0, #1
	CMP r1, #0x26
	BEQ print_H_fourth			; is there a frog in third home slot?
	CMP r1, #0x2A
	BNE check_fourth_home_loop
	MOV r0, #0x0086
	MOVT r0, #0x2000
	B check_home_end
print_H_fourth					; prints H in fourth home slots
	MOV r0, #0x0086
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x0087
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x0088
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x0089
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r0, #0x008A
	MOVT r0, #0x2000
	STRB r2, [r0]
	MOV r4, #0x02BF
	MOVT r4, #0x2000
	MOV r1, #0x26
	STRB r1, [r4]
	BL add_home_score
	MOV r12, #1
	MOV r7, #0x2E
	B check_home_end
check_home_end
	MOV r0, #0x0068
	MOVT r0, #0x2000
	MOV r3, #0					; resets H count
sum_home_loop
	LDRB r1, [r0]				; if sum of occupied home slots is 2, advance level
	CMP r1, #0x7C				; iterate home slot row until | is found
	BEQ no_advance_level
	CMP r1, #0x48				; is there an H?
	BEQ sum_home
	ADD r0, r0, #10				; goes to next home slot
	B sum_home_loop
sum_home
	ADD r3, r3, #1				; adds one to counter if a home is occupied
	CMP r3, #2
	BEQ advance_level			; if counter is 2, advance level
	ADD r0, r0, #10
	B sum_home_loop
advance_level
	;BL add_level_score
	;BL unused_time
	BL increment_level			; increments level on board
	MOV r3, #0
	MOV r0, #0x0068
	MOVT r0, #0x2000			; goes back to first home address
clear_home
	LDRB r1, [r0]				; if advanced a level, clear home
	CMP r1, #0x7C
	BEQ no_advance_level
	CMP r1, #0x2A
	BNE clear_home_slot
	ADD r0, r0, #1
	B clear_home
clear_home_slot
	MOV r1, #0x20				; restores a space to clear home slots
	STRB r1, [r0]
	ADD r0, r0, #1
	B clear_home
no_advance_level
	LDMFD SP!, {lr}
	MOV pc, lr

increment_level:				; this increments the level on the board
	STMFD SP!, {lr}
	BL unused_time				; if increment level, reset time to 60secs-10*level
	BL add_level_score			; if increment level, add 250 points subroutine
	MOV r0, #0x0348
	MOVT r0, #0x2000			; ones digit of level
	LDRB r1, [r0]
	CMP r1, #0x39
	BEQ one_level_nine			; branch if ones digit of level = 9
	ADD r1, r1, #1				; if not add 1
	STRB r1, [r0]
	B increment_level_end
one_level_nine
	MOV r1, #0x30				; if ones digit is 9, store 0 in ones place
	STRB r1, [r0]
	SUB r0, r0, #1				; go to tens place
	LDRB r1, [r0]
	ADD r1, r1, #1				; add one
	STRB r1, [r0]
	B increment_level_end
increment_level_end
	MOV r0, #0x0348
	MOVT r0, #0x2000		; second digit of level
	LDRB r1, [r0]
	MOV r2, #0x36			; subtract 6 by what level
	SUB r1, r2, r1
	ADD r1, r1, #48			; reset timer to 60 secs - 10*x level
	MOV r0, #0x0315
	MOVT r0, #0x2000
	STRB r1, [r0]
	MOV r1, #0x30			; reset second digit of timer to 0
	ADD r0, r0, #1
	STRB r1, [r0]
	LDMFD SP!, {lr}
	MOV pc, lr

UART0Handler:
	STMFD SP!, {lr}
	BL read_character

	LDMFD SP!, {lr}
	BX lr

Timer0Handler:
	STMFD SP!, {lr}
	MOV r0, #0x0024
	MOVT r0, #0x4003	; GPTM Interrupt Clear Register (GPTMICR)
	LDRB r0, [r1]
	MOV r2, #1
	ORR r1, r1, r2
	STRB r1, [r0]		; Clear interrupt
	CMP r10, #5
	BEQ timer_end
	CMP r10, #0
	BEQ no_lives_left
	CMP r6, #1
	BEQ ispaused
	CMP r6, #2
	BEQ ingame			; if in game, branch to ingame
	CMP r6, #3
	BEQ ispaused		; if paused, ignores movement and stops reprinting
	CMP r6, #4
	BEQ isgameover		; if gameover, do nothing
	B timer_end
ingame
	BL check_home
	CMP r11, #5				; If certain number of ticks found, spawn object
	BEQ c_five				; car 0x200001BA, log 0x20000127, head 0x200000C0
	CMP r11, #12
	BEQ c_twelve			; truck 0x200001B5
	CMP r11, #13
	BEQ c_thirteen			; head 0x20000122
	CMP r11, #16
	BEQ c_sixteen			; body 0x200000C0
	CMP r11, #23
	BEQ c_twenty_three		; truck 0x200001B5
	CMP r11, #24
	BEQ c_twenty_four		; body 0x20000122
	CMP r11, #27
	BEQ c_twenty_seven		; body 0x200000C0, fly 0x20000074
	CMP r11, #34
	BEQ c_thirty_four		; truck 0x200001B5, car 0x2000027E
	CMP r11, #35
	BEQ c_thirty_five		; body 0x20000122
	CMP r11, #38
	BEQ c_thirty_eight		; body 0x200000C0
	CMP r11, #45
	BEQ c_fourty_five		; truck 0x200001B5
	CMP r11, #46
	BEQ c_fourty_six		; body 0x20000122, truck 0x20000248
	CMP r11, #49
	BEQ c_fourty_nine		; body 0x200000C0
	CMP r11, #57
	BEQ c_fifty_seven		; log 0x200000C5, body 0x20000122, truck 0x20000248, clear fly 7F
	CMP r11, #60
	BEQ c_sixty				; car 0x2000001BA, body 0x200000C0
	CMP r11, #68
	BEQ c_sixty_eight		; body 0x20000122, truck 0x20000248
	CMP r11, #79
	BEQ c_seventy_nine		; truck 0x20000248
	CMP r11, #82
	BEQ c_eighty_two			; release fly
	CMP r11, #91
	BEQ c_ninety_one		; turtle 0x20000122, lily 0x200000C0
	CMP r11, #102
	BEQ c_one_hun_two
	CMP r11, #111
	BEQ c_one_hun_eleven
	CMP r11, #130
	BEQ c_one_thirty
	B c_end
c_five
	MOV r0, #0x00C0
	MOVT r0, #0x2000
	BL spawn_gator_head		; spawn gator head
	MOV r0, #0x01BA
	MOVT r0, #0x2000
	BL spawn_car			; spawn car
	MOV r0, #0x0127
	MOVT r0, #0x2000
	BL spawn_log			; spawn log
	MOV r0, #0x0128
	MOVT r0, #0x2000
	BL spawn_log			; spawn log
	MOV r0, #0x0129
	MOVT r0, #0x2000
	BL spawn_log			; spawn log
	MOV r0, #0x012A
	MOVT r0, #0x2000
	BL spawn_log			; spawn log
	MOV r0, #0x012B
	MOVT r0, #0x2000
	BL spawn_log			; spawn log
	MOV r0, #0x012C
	MOVT r0, #0x2000
	BL spawn_log
	B c_end
c_twelve
	MOV r0, #0x01B5
	MOVT r0, #0x2000
	BL spawn_truck			; spawn truck
	B c_end
c_thirteen
	MOV r0, #0x0122
	MOVT r0, #0x2000
	BL spawn_gator_head		; spawn gator head
	B c_end
c_sixteen
	MOV r0, #0x00C0
	MOVT r0, #0x2000
	BL spawn_gator_body		; spawn gator body
	B c_end
c_twenty_three
	MOV r0, #0x01B5
	MOVT r0, #0x2000
	BL spawn_truck			; spawn truck
	B c_end
c_twenty_four
	MOV r0, #0x0122
	MOVT r0, #0x2000
	BL spawn_gator_body		; spawn gator body
	B c_end
c_twenty_seven
	MOV r0, #0x00C0
	MOVT r0, #0x2000
	BL spawn_gator_body		; spawn gator body
	MOV r0, #0x0315			; tens digit of timer
	MOVT r0, #0x2000
	LDRB r1, [r0]
	CMP r1, #0x34
	BEQ fourty_seconds		; branch if in 40 second interval
	MOV r0, #0x0073
	MOVT r0, #0x2000
	LDRB r1, [r0]
	CMP r1, #0x48			; if home slot has H in fly spot, restore
	BNE c_end
	ADD r0, r0, #1
	MOV r1, #0x48			; store H
	STRB r1, [r0]
	MOV r0, #0x0315			; tens digit of timer
	MOVT r0, #0x2000
	LDRB r1, [r0]
	CMP r1, #0x32
	BEQ twenty_seconds		; branch if in 20 second interval
	CMP r1, #0x31
	BEQ twenty_seconds		; branch if in 10 second interval
	CMP r1, #0x30
	BEQ twenty_seconds		; branch if in seconds interval
	MOV r0, #0x006B
	MOVT r0, #0x2000
	LDRB r1, [r0]
	CMP r1, #0x48			; if home slot has H, restore
	BNE c_end
	SUB r0, r0, #1
	MOV r1, #0x48			; restore H
	STRB r1, [r0]
	B c_end
twenty_seconds
	MOV r0, #0x006A
	MOVT r0, #0x2000
	LDRB r1, [r0]
	CMP r1, #0x20			; if space not found, dont spawn fly
	BNE c_end
	BL spawn_fly			; spawn fly if in 10 second interval
	B c_end
fourty_seconds
	MOV r0, #0x0074
	MOVT r0, #0x2000
	LDRB r1, [r0]
	CMP r1, #0x20			; if space not found, dont spawn fly
	BNE c_end
	BL spawn_fly			; spawn fly if in 40 second interval
	B c_end
c_thirty_four
	MOV r0, #0x01B5
	MOVT r0, #0x2000
	BL spawn_truck			; spawn truck
	MOV r0, #0x027E
	MOVT r0, #0x2000
	BL spawn_car			; spawn car
	B c_end
c_thirty_five
	MOV r0, #0x0122
	MOVT r0, #0x2000
	BL spawn_gator_body		; spawn gator_body
	B c_end
c_thirty_eight
	MOV r0, #0x00C0
	MOVT r0, #0x2000
	BL spawn_gator_body		; spawn gator body
	B c_end
c_fourty_five
	MOV r0, #0x01B5
	MOVT r0, #0x2000
	BL spawn_truck			; spawn truck
	B c_end
c_fourty_six
	MOV r0, #0x0122
	MOVT r0, #0x2000
	BL spawn_gator_body		; spawn gator body
	MOV r0, #0x0248
	MOVT r0, #0x2000
	BL spawn_truck			; spawn truck
	B c_end
c_fourty_eight
	MOV r0, #0x0248
	MOVT r0, #0x2000
	BL spawn_truck			; spawn truck
	B c_end
c_fourty_nine
	MOV r0, #0x00C0
	MOVT r0, #0x2000
	BL spawn_gator_body		; spawn gator body
	B c_end
c_fifty_seven
	MOV r0, #0x0122
	MOVT r0, #0x2000
	BL spawn_gator_body		; spawn gator body
	MOV r0, #0x00C5
	MOVT r0, #0x2000
	BL spawn_log			; spawn log
	MOV r0, #0x00C6
	MOVT r0, #0x2000
	BL spawn_log			; spawn log
	MOV r0, #0x00C7
	MOVT r0, #0x2000
	BL spawn_log			; spawn log
	MOV r0, #0x00C8
	MOVT r0, #0x2000
	BL spawn_log			; spawn log
	MOV r0, #0x00C9
	MOVT r0, #0x2000
	BL spawn_log			; spawn log
	MOV r0, #0x00CA
	MOVT r0, #0x2000
	BL spawn_log			; spawn log
	MOV r0, #0x0248
	MOVT r0, #0x2000
	BL spawn_truck			; spawn truck
	MOV r0, #0x0315
	MOVT r0, #0x2000		; tenth digit of time
	LDRB r1, [r0]
	CMP r1, #0x33			; branch if not 30 sec interval
	BNE c_end
	MOV r0, #0x007E
	MOVT r0, #0x2000
	LDRB r1, [r0]
	CMP r1, #0x20
	BNE c_end
	MOV r0, #0x007F
	MOVT r0, #0x2000
	BL spawn_fly			; if space found, spawn fly
	B c_end

c_sixty
	MOV r0, #0x01BA
	MOVT r0, #0x2000
	BL spawn_car			; spawn car
	MOV r0, #0x00C0
	MOVT r0, #0x2000
	BL spawn_gator_body		; spawn gator body
	B c_end
c_sixty_eight
	MOV r0, #0x0122
	MOVT r0, #0x2000
	BL spawn_gator_body		; spawn gator body
	MOV r0, #0x0248
	MOVT r0, #0x2000
	BL spawn_truck			; spawn truck
	B c_end
c_seventy_nine
	MOV r0, #0x0248
	MOVT r0, #0x2000
	BL spawn_truck			; spawn truck
	B c_end
c_eighty_two
	MOV r0, #0x0073
	MOVT r0, #0x2000
	LDRB r1, [r0]
	CMP r1, #0x20			; is home slot clear
	BEQ fly_space			; if it is branch
	MOV r1, #0x48			; if not store H
	ADD r0, r0, #1
	STRB r1, [r0]
	MOV r0, #0x0069
	MOVT r0, #0x2000
	LDRB r1, [r0]
	CMP r1, #0x20			; is home slot clear
	BEQ fly_space
	MOV r1, #0x48			; if not store H
	ADD r0, r0, #1
	STRB r1, [r0]
	B c_end
fly_space
	ADD r0, r0, #1			; clear fly
	MOV r1, #0x20
	STRB r1, [r0]
	B c_end
c_ninety_one
	MOV r0, #0x0122
	MOVT r0, #0x2000
	BL spawn_turtle			; spawn turtle
	MOV r0, #0x00C0
	MOVT r0, #0x2000
	BL spawn_lily			; spawn lily
	B c_end
c_one_hun_two
	MOV r0, #0x0122
	MOVT r0, #0x2000
	BL spawn_turtle			; spawn turtle
	B c_end
c_one_hun_eleven
	MOV r0, #0x007E
	MOVT r0, #0x2000
	LDRB r1, [r0]
	CMP r1, #0x20			; is home slot clear
	BEQ fly_space			; if it is branch
	MOV r1, #0x48			; if not store H
	ADD r0, r0, #1
	STRB r1, [r0]
	B c_end
c_one_thirty
	MOV r11, #1
	B c_end
c_end
	ADD r11, r11, #1
	CMP r8, #11
	BEQ change_gametime		; if timer counter = 12, branch to decrement timer
	CMP r8, #0
	BEQ resettimecounter	; if timer counter = 0, branch to reset
	SUB r8, r8, #1
	B nochangetime
resettimecounter
	MOV r8, #11				; resets time counter to 12, 12 counts per second
	B nochangetime
change_gametime
	BL game_time			; if decrement timer, branch to game_time
	SUB r8, r8, #1
nochangetime
	CMP r9, #1
	BEQ move_objects		; if r9 = 1, shift objects
	B change_to_one
move_objects
	ADD r9, r9, #1
	MOV r0, #0x0000
	MOVT r0, #0x2000
	CMP r12, #2
	BEQ move_frog_right
	B next_object
next_object
	LDRB r1, [r0]
	CMP r1, #0x00
	BEQ no_move_objects			; if NULL found, end of board
	CMP r1, #0x43
	BEQ move_car				; if C found, move car
	CMP r1, #0x23
	BEQ move_truck				; if # found, move truck
	CMP r1, #0x41
	BEQ move_gator_head			; if A found, move gator head
	CMP r1, #0x61
	BEQ move_gator_body			; if a found, move gator body
	CMP r1, #0x54
	BEQ move_turtle				; if T found, move turtle
	CMP r1, #0x4F
	BEQ move_lily				; if O found, move lily
	CMP r1, #0x4C
	BEQ move_log				; if L found, move log
	CMP r1, #0x26
	BEQ move_frogger			; if & found, move frog
	ADD r0, r0, #1
	B next_object
move_frogger
	ADD r0, r0, #1
	CMP r12, #3					; if not move left, branch out
	BNE next_object
	SUB r0, r0, #1
	MOV r2, #0x7E
	STRB r2, [r0]
	SUB r0, r0, #1				; move cursor left
	SUB r4, r4, #1				; update frog pointer address
	LDRB r2, [r0]
	CMP r2, #0x7C
	BEQ frog_left_wall
	MOV r2, #0x26
	STRB r2, [r0]
	ADD r0, r0, #2
	B next_object
frog_left_wall
	SUB r10, r10, #1
	BL illuminate_LEDs
	MOV r4, #0x02BD
	MOVT r4, #0x2000
	MOV r2, #0x26
	STRB r2, [r4]
	MOV r12, #1
	ADD r0, r0, #2
	B next_object

move_frog_right
	SUB r4, r4, #1
	LDRB r2, [r4]
	CMP r2, #0x4C				; check if frog is on last log, &LLLLL
	BNE frog_last_log
	ADD r4, r4, #1				; if not go back to current frog pointer
	MOV r2, #0x4C
	STRB r2, [r4]				; store log in current frog position
	ADD r4, r4, #1
	LDRB r2, [r4]
	CMP r2, #0x7C
	BEQ frog_shift_wall			; if frog next to wall
	MOV r2, #0x26
	STRB r2, [r4]				; if not store frog in new position
	B next_object
frog_last_log
	ADD r4, r4, #1				; back to current position
	MOV r2, #0x7E
	STRB r2, [r4]				; store water in current frog position
	ADD r4, r4, #2
	LDRB r2, [r4]
	CMP r2, #0x7C
	BEQ frog_shift_wall
	CMP r2, #0x0D
	BEQ frog_shift_wall
	CMP r2, #0x0A
	BEQ frog_shift_wall
	MOV r2, #0x26
	STRB r2, [r4]				; store frog in next position to be end of log again
	ADD r4, r4, #4
	LDRB r2, [r4]
	CMP r2, #0x7E
	BNE current_frog_pos
	MOV r2, #0x4C
	STRB r2, [r4]
current_frog_pos
	SUB r4, r4, #4
	B next_object
frog_shift_wall
	SUB r10, r10, #1			; if frog shifts right into wall, minus life
	BL illuminate_LEDs
	MOV r4, #0x02C1
	MOVT r4, #0x2000
	MOV r2, #0x26
	STRB r2, [r4]
	MOV r12, #1					; frog stationary indicator
	B next_object
move_car
	MOV r2, #0x20
	STRB r2, [r0]				; store space in current spot of car
	ADD r0, r0, #1				; go right one space
	LDRB r2, [r0]
	CMP r2, #0x7C				; if right space is a wall branch
	BEQ wall_hit_right
	CMP r2, #0x26
	BEQ collided_car			; if right space is a frog branch
	B no_collision_car
collided_car
	SUB r10, r10, #1			; if collision with car/truck, minus life
	BL illuminate_LEDs			; update LEDs
	MOV r4, #0x02C9
	MOVT r4, #0x2000
	MOV r1, #0x26
	STRB r1, [r4]				; respawn frog
no_collision_car
	MOV r1, #0x43
	STRB r1, [r0]				; if no wall in right space, shift car
	ADD r0, r0, #1
	B next_object
move_truck
	MOV r2, #0x20
	STRB r2, [r0]				; store space in current spot of truck
	SUB r0, r0, #1				; go left one space
	LDRB r2, [r0]
	CMP r2, #0x7C				; if left one space is wall, branch
	BEQ wall_hit_left
	CMP r2, #0x26
	BEQ collided_truck			; if left space is a frog, branch
	B no_collision_truck
collided_truck
	SUB r10, r10, #1			; if collision with car/truck, minus life
	BL illuminate_LEDs			; update LEDs
	MOV r4, #0x02C0
	MOVT r4, #0x2000
	MOV r1, #0x26
	STRB r1, [r4]				; respawn frog
no_collision_truck
	MOV r1, #0x23
	STRB r1, [r0]				; else, store # left one space
	ADD r0, r0, #2				; add two to go to next pointer spot
	B next_object


move_gator_head
	MOV r2, #0x7E
	STRB r2, [r0]				; store space in current spot of gator head
	SUB r0, r0, #1				; go left one space
	LDRB r2, [r0]
	CMP r2, #0x7C				; if left one space is wall, branch
	BEQ wall_hit_left
	MOV r1, #0x41				; else, store A left one space
	STRB r1, [r0]
	ADD r0, r0, #2				; add 2 to go to next pointer spot
	B next_object
move_gator_body
	MOV r2, #0x7E
	STRB r2, [r0]				; store space in current space of gator body
	SUB r0, r0, #1				; go left one space
	LDRB r2, [r0]
	CMP r2, #0x7C				; if left one space is wall, branch
	BEQ wall_hit_left
	MOV r1, #0x61
	STRB r1, [r0]				; else store a left one space
	ADD r0, r0, #2				; go to next pointer spot
	B next_object
move_turtle
	MOV r2, #0x7E
	STRB r2, [r0]				; store space in current space of turtle
	SUB r0, r0, #1				; go left one space
	LDRB r2, [r0]
	CMP r2, #0x7C				; check for wall collision
	BEQ wall_hit_left
	MOV r1, #0x54				; input turtle left one space
	STRB r1, [r0]
	ADD r0, r0, #2				; go to next pointer spot
	B next_object
move_lily
	MOV r2, #0x7E
	STRB r2, [r0]				; store space in current space of lily
	SUB r0, r0, #1				; go left one spot
	LDRB r2, [r0]
	CMP r2, #0x7C				; check for wall collision
	BEQ wall_hit_left
	MOV r1, #0x4F
	STRB r1, [r0]				; store lily in new spot
	ADD r0, r0, #2				; go to next pointer spot
	B next_object
move_log
	MOV r2, #0x7E
	STRB r2, [r0]				; store ~ in leftest L in a log
	ADD r0, r0, #1
	LDRB r2, [r0]
	CMP r2, #0x7C
	BEQ wall_hit_right			; check for L|
	ADD r0, r0, #1
	LDRB r2, [r0]
	CMP r2, #0x7C
	BEQ wall_hit_right			; check for LL|
	ADD r0, r0, #1
	LDRB r2, [r0]
	CMP r2, #0x7C
	BEQ wall_hit_right			; check for LLL|
	ADD r0, r0, #1
	LDRB r2, [r0]
	CMP r2, #0x7C
	BEQ wall_hit_right			; check for LLLL|
	ADD r0, r0, #1
	LDRB r2, [r0]
	CMP r2, #0x7C
	BEQ wall_hit_right			; check for LLLLL|
	ADD r0, r0, #1
	LDRB r2, [r0]
	CMP r2, #0x7C
	BEQ wall_hit_right			; check for LLLLLL|
	CMP r2, #0x26
	BEQ log_hit_frog			; if frog on first log, just update ptr to next object
	MOV r1, #0x4C
	STRB r1, [r0]
	ADD r0, r0, #1
	B next_object
log_hit_frog
	ADD r0, r0, #1
	B next_object
wall_hit_left
	ADD r0, r0, #2				; if left space is a wall, input space, go to next address
	B next_object
wall_hit_right
	ADD r0, r0, #1				; if right space is a wall, input space, go to next address
	B next_object
change_to_one
	CMP r9, #11					; change r9 to 1 to shift objects every 1j second
	BEQ reset_move_counter
	ADD r9, r9, #1
	B no_move_objects
reset_move_counter
	MOV r9, #1
	B no_move_objects
no_move_objects
	MOV r0, #0x0000
	MOVT r0, #0x2000
	BL print_board
	B timer_end
ispaused
	B timer_end
no_lives_left
	MOV r10, #0
	BL illuminate_LEDs
	BL gameover_screen
	B timer_end
isgameover
	B timer_end
timer_end

	LDMFD SP!, {lr}
	BX lr

PortAHandler:
	STMFD SP!, {lr}
	BL read_from_keypad
clear_keypad_interrupt
	MOV r2, #0x3C
	MOV r3, #0x441C
	MOVT r3, #0x4000
	LDRB r5, [r3]
	ORR r2, r2, r5
	STRB r2, [r3]
	LDMFD SP!, {lr}
	BX lr

illuminate_LEDs:		; r10 = # of lives
	STMFD SP!, {lr}
	MOV r1, #0xE608
	MOVT r1, #0x400F	; r1 = 0x400FE608, Clock address SYSCTL_RCGC_GPIO Register
	MOV r2, #0x3F		; r2 = 00111111
	STRB r2, [r1]		; Enable Port clocks
	MOV r1, #0x5400
	MOVT r1, #0x4000	; r1 = 0x40005400
	MOV r2, #0xF		; r2 = 1111
	STRB r2, [r1]		; PORTB direction register Configure pins as output
	MOV r1, #0x551C
	MOVT r1, #0x4000	; r1 = 0x4000551C
	STRB r2, [r1]		; Digital Register PORTB digital pin write 1 for pin 0-3
	MOV r1, #0x53FC
	MOVT r1, #0x4000	; r1 = 0x400053FC, PORTB Data Register
	CMP r10, #4
	BEQ four_lives
	CMP r10, #3
	BEQ three_lives
	CMP r10, #2
	BEQ two_lives
	CMP r10, #1
	BEQ one_life
	CMP r10, #0
	BEQ zero_lives
	B illuminate_LEDs_end
four_lives
	MOV r2, #15
	STRB r2, [r1]
	B illuminate_LEDs_end
three_lives
	MOV r2, #7
	STRB r2, [r1]
	B illuminate_LEDs_end
two_lives
	MOV r2, #3
	STRB r2, [r1]
	B illuminate_LEDs_end
one_life
	MOV r2, #1
	STRB r2, [r1]
	B illuminate_LEDs_end
zero_lives
	MOV r2, #0
	STRB r2, [r1]
	B illuminate_LEDs_end
illuminate_LEDs_end
	LDMFD sp!, {lr}
	MOV pc, lr

illuminate_RGB_LED:		; Color to be displayed is passed into r0
	STMFD SP!,{lr}		; Store register lr on stack
	MOV r1, #0xE608
    MOVT r1, #0x400F	; r1 = 0x400FE608, Clock address SYSCTL_RCGC_GPIO Register
    MOV r2, #0x3F		; r2 = 00111111
	STRB r2, [r1]		; Write 1 to bit 0-5 to enable PORTs Clock
	MOV r1, #0x5400
	MOVT r1, #0x4002	; r1 = 0x40025400, Data Direction Register PORTF
	MOV r2, #0xF		; r2 = 1110
	STRB r2, [r1]		; Write 1 to PORTF Data Direction Register as output, pins 1,2,3
	MOV r1, #0x551C
	MOVT r1, #0x4002	; r1 = 0x4002551C, Digital Register
	STRB r2, [r1]		; Write 1 to Digital Register, pins 1,2,3
	CMP r6, #1			; Compare r6 to #1
	BEQ white			; If r6 = 1, Color white
	CMP r6, #2			; Compare r6 to #2
	BEQ green			; If r6 = 2, Color green
	CMP r6, #3			; Compare r6 to #3
	BEQ red				; If r6 = 3, Color red
	CMP r6, #4			; Compare r6 to #4
	BEQ blue			; If r6 = 4, Color blue

white					; pre game state
	MOV r1, #0x53FC
	MOVT r1, #0x4002	; r1 = 0x400253FC, PORTF Data Register
	MOV r2, #0xE		; Pins 1,2,3 high
	STRB r2, [r1]
	B RGB_LED_END
red						; paused state
	MOV r1, #0x53FC
	MOVT r1, #0x4002	; r1 = 0x400253FC, PORTF Data Register
	MOV r2, #2			; r2 = 2
	STRB r2, [r1]		; Pin 1 High
	B RGB_LED_END
blue					; game over state
	MOV r1, #0x53FC
	MOVT r1, #0x4002	; r1 = 0x400253FC, PORTF Data Register
	MOV r2, #4			; r2 = 4
	STRB r2, [r1]		; Pin 2 High
	B RGB_LED_END
green					; in game state
	MOV r1, #0x53FC
	MOVT r1, #0x4002	; r1 = 0x400253FC, PORTF Data Register
	MOV r2, #8			; r2 = 8
	STRB r2, [r1]		; Pin 3 High
	B RGB_LED_END
RGB_LED_END
	LDMFD sp!, {lr}
	MOV pc, lr

uart_init:
	STMFD SP!,{lr}			; Store register lr on stack
	MOV r0, #0xE618
	MOVT r0, #0x400F		; r2 = 0x400FE618
	MOV r1, #0
	LDR r1, [r0]			; load r3 = [r2]
	MOV r2, #1
	ORR r1, r1, r2			; Provide Clock to UART0, 0x400FE618 = 0x400FE618 | 1
	STR r1, [r0]
	MOV r0, #0xE608
	MOVT r0, #0x400F		; r2 = 0x400FE608
	LDR r1, [r0]			; load r3 = [r2]
	ORR r1, r1, r2			; enable clock to PortA 0x400FE608 = 0x400FE608 | 1
	STR r1, [r0]
	MOV r0, #0xC030
	MOVT r0, #0x4000		; r2 = 0x4000C030
	LDR r1, [r0]			; load r3 = [r2]
	MOV r2, #0
	ORR r1, r1, r2			; Disable UART0 Control 0x4000C030 = 0x4000C030 | 0
	STR r1, [r0]
	MOV r0, #0xC024
	MOVT r0, #0x4000		; r2 = 0x4000C024
	LDR r1, [r0]			; load r3 = [r2]
	MOV r2, #8
	ORR r1, r1, r2			; Set UART0_IBRD_R for 115200 baud 0x4000C024 | 8
	STR r1, [r0]
	MOV r0, #0xC028
	MOVT r0, #0x4000		; r0 = 0x4000C028
	LDR r1, [r0]
	MOV r2, #44
	ORR r1, r1, r2			; Set UART0_FBRD for 115200 baud 0x4000C028 | 44
	STR r1, [r0]
	MOV r0, #0xCFC8
	MOVT r0, #0x4000		; r0 = 0x4000CFC8
	LDR r1, [r0]
	MOV r2, #0
	ORR r1, r1, r2			; Use System Clock 0x4000CFC8 | 0
	STR r1, [r0]
	MOV r0, #0xC02C
	MOVT r0, #0x4000		; r0 = 0x4000C02C
	LDR r1, [r0]
	MOV r2, #0x60
	ORR r1, r1, r2			; Use 8 bit word length, 1 stop but no parity 0x4000C03C | 0x60
	STR r1, [r0]
	MOV r0, #0xC030
	MOVT r0, #0x4000		; r0 = 0x4000C030
	LDR r1, [r0]
	MOV r2, #0x301
	ORR r1, r1, r2			; Enable UART Control 0x4000C030 | 0x301
	STR r1, [r0]
	MOV r0, #0x451C
	MOVT r0, #0x4000		; r0 = 0x4000451C
	LDR r1, [r0]
	MOV r2, #0x03
	ORR r1, r1, r2			; Make PA0 and PA1 as Digital Ports, 0x4000451C | 0x03
	STR r1, [r0]
	MOV r0, #0x4420
	MOVT r0, #0x4000		; r0 = 0x40004420
	LDR r1, [r0]
	ORR r1, r1, r2			; Change PA0, PA1 to use alternate function 0x40004420 | 0x03
	STR r1, [r0]
	MOV r0, #0x452C
	MOVT r0, #0x4000
	LDR r1, [r0]
	MOV r2, #0x11
	ORR r1, r1, r2			; Configure PA0 and Pa1 for UART, 0x4000452C | 0x11
	STR r1, [r0]
	MOV r2, #0				;clear r2
	MOV r5, #0xC038
	MOVT r5, #0x4000		; UART Receive Interrupt Mask (RXIM)
	MOV r2, #0x10
	STRB r2, [r5]			; Write 1 to RXIM
	MOV r5, #0xE100
	MOVT r5, #0xE000		; NVIC
	LDRB r3, [r5]
	MOV r2, #0x20			; "1" to bit 5 of EN0
	ORR r2, r2, r3
	STRB r2, [r5]			; Enable UART Interrupt
	LDMFD SP!, {lr}
	mov pc, lr

timer_init:
	STMFD SP!,{lr}		; Store register lr on stack

	MOV r0, #0xE604
	MOVT r0, #0x400F	; General Purpose Timer Run Mode Clock Gating Control, RCGCTIMER register
	LDRB r1, [r0]
	MOV r2, #0x1
	ORR r1, r1, r2
	STRB r1, [r0]		; Write 1 to connect T0
	MOV r0, #0x000C
	MOVT r0, #0x4003	; GPTM Control Register (GPTMCTL)
	LDRB r1, [r0]
	MOV r2, #0xFE
	AND r1, r1, r2
	STRB r1, [r0]		; Disable TimerA
	MOV r0, #0x0000
	MOVT r0, #0x4003	; GPTM Configuration Register
	LDRB r1, [r0]
	AND r1, r1, r2
	STRB r1, [r0]		; Setup Timer for 32 bit Mode, configuration 0
	MOV r0, #0x0004
	MOVT r0, #0x4003	; GPTM Timer A Mode Register
	LDRB r1, [r0]
	MOV r2, #0x2
	ORR r1, r1, r2
	STRB r1, [r0]		; Configuration 2, Periodic Mode
	MOV r0, #0x0028
	MOVT r0, #0x4003	; Set Interrupt Interval (period), GPTM Timer A Interval Load Register
	MOV r1, #0x2400
	MOVT r1, #0x00F4	; 16,000,000 clock ticks for period, 16MHZ, 00F42400
	STR r1, [r0]
	MOV r0, #0x0018
	MOVT r0, #0x4003	; GPTM Interrupt Mask Register (GPTMIMR)
	LDRB r1, [r0]
	MOV r2, #1
	ORR r1, r1, r2
	STRB r1, [r0]		; Timer A Timeout Interrupt Mask (TATOIM)
	MOV r0, #0xE100
	MOVT r0, #0xE000	; Nested Vector Interrupt Controller (NVIC)
	LDR r1, [r0]
	MOV r2, #0x0000
	MOVT r2, #0x8		; Bit 19 = 1, Enable
	ORR r1, r1, r2
	STR r1, [r0]
	MOV r0, #0x000C
	MOVT r0, #0x4003		; Enable Timer GPTM Control Register (GPTMCTL)
	LDRB r1, [r0]
	MOV r3, #1
	ORR r1, r1, r3
	STRB r1, [r0]			; Enable Timer A, Set bit 0 = 1, TAEN

	LDMFD SP!, {lr}
	mov pc, lr

keypad_init:
	STMFD SP!,{lr}
	MOV r1, #0xE608
	MOVT r1, #0x400F		; r1 = 0x400FE608, Clock Address
	MOV r2, #0x3F			; r2 = 00111111
	STRB r2, [r1]			; Write 1 to bit 0-5 to enable Ports Clock
	MOV r1, #0x7400
	MOVT r1, #0x4000		; r1 = 0x40007400, PORT D data Direction register
	MOV r2, #0xF
	STRB r2, [r1]			; Write 1 to Pins 0-3 to configure as output
	MOV r1, #0x751C
	MOVT r1, #0x4000		; r1 = 0x4000751C port D digital register
	MOV r2, #0xF
	STRB r2, [r1]			; Write 1111 for pin 0-3
	MOV r1, #0x73FC
	MOVT r1, #0x4000		; r1 = 0x400073FC port D data register
	MOV r2, #0
	STRB r2, [r1]			; Write 0 to set port D pins low initially
	MOV r2, #0xF
	STRB r2, [r1]			; Write 1 to set all port D pins high
	MOV r1, #0x4400
	MOVT r1, #0x4000		; r1 = 0x40004400 port A direction register
	MOV r2, #0
	STRB r2, [r1]			; Write 0 to configure port A pins as input
	MOV r1, #0x451C
	MOVT r1, #0x4000		; r1 = 0x4000451C port A digital register
	MOV r2, #0x3C
	STRB r2, [r1]			; Enable port A digital pin
	MOV r1, #0x43FC
	MOVT r1, #0x4000		; r1 = 0x400043FC, port A data register
	MOV r2, #0
	STRB r2, [r1]			; set port A pins low initially
	MOV r5, #0x4404
	MOVT r5, #0x4000		; GPIOIS
	MOV r2, #0
	LDRB r3, [r5]
	AND r2, r2, r3
	STRB r2, [r5]
	MOV r5, #0x4408
	MOVT r5, #0x4000		; GPIOIBE
	LDRB r3, [r5]
	AND r2, r2, r3
	STRB r2, [r5]
	MOV r5, #0x440C
	MOVT r5, #0x4000		; GPIOIEV
	LDRB r3, [r5]
	MOV r2, #0x3C
	ORR r3, r2, r3
	STRB r3, [r5]
	MOV r5, #0x4410
	MOVT r5, #0x4000		; GPIOIM
	LDRB r3, [r5]
	ORR r2, r2, r3
	STRB r2, [r5]
	MOV r5, #0xE100
	MOVT r5, #0xE000		; NVIC
	MOV r2, #0x1F			; "1" to bits 0-4 EN0
	LDRB r3, [r5]
	ORR r2, r2, r3
	STRB r2, [r5]			; Enable Interrupts
	LDMFD SP!, {lr}
	mov pc, lr

finish:
	.end

