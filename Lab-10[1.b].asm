.model small
.stack 100h
.data
newline db 13, 10, &#39;$&#39; ; Carriage return and line feed

.code
main proc
mov ax, @data ; Initialize data segment
mov ds, ax

mov cx, 26 ; Set up a counter for 26 characters (Z to A)
mov dl, &#39;Z&#39; ; ASCII code for &#39;Z&#39;

print_loop:
; Print the character in DL
mov ah, 02h ; DOS function to output a character
int 21h ; Call DOS interrupt

; Decrement DL to get the previous character
dec dl

; Loop until CX reaches 0
loop print_loop

; Print newline after the characters
mov ah, 09h ; DOS function to output a string
lea dx, newline ; Load address of newline string
int 21h ; Call DOS interrupt

; Exit the program
mov ah, 4Ch ; DOS function to exit
int 21h ; Call DOS interrupt

main endp
end main