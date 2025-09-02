; BLINK-SUBROUTINE.asm
;
; Author: NellanJimms_ke
;

; Include the ATmega328P definition file
.include "m328pdef.inc"

.cseg
.org 0x0000
; Reset vector to start the program
rjmp start

start:
    ldi  r16,  0xFF    ; Initialize register r16 with 0xFF
    out  DDRB, r16     ; Set all bits of PORTB as output
    sbi  PORTB,1	   ; Set bit 1 of PORTB to high (turn on LED)
    call delay_ms      ; Call the delay subroutine
    cbi  PORTB, 1	   ; Clear bit 1 of PORTB to low (turn off LED)
    call delay_ms	   ; Call the delay subroutine again
    rjmp start		   ; Jump back to the start of the program

; Subroutine to generate a delay in milliseconds
delay_ms:
    ldi r17, 255	   ; Load immediate value 255 into register r17
inner_loop:
    ldi r18, 255	   ; Load immediate value 255 into register r18
wait:
    dec  r18	       ; Decrement r18 and branch if not equal to zero
    brne wait		   ; Decrement r17 and branch if not equal to zero
    dec  r17
    brne inner_loop
    ret				   ; Return from the subroutine
