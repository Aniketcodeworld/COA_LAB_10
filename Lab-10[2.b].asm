.model small
.stack 100h
.data

newline db 13, 10, &#39;$&#39; ; Carriage return and line feed for new line

.code
main proc
mov ax, @data ; Initialize the data segment
mov ds, ax

mov al, &#39;A&#39; ; Start with the ASCII code for &#39;A&#39;

print_loop:
; Print the character in AL
mov dl, al ; Move the current character into DL for printing
mov ah, 02h ; DOS function to output a character
int 21h ; Call DOS interrupt to print the character

; Check if we&#39;ve reached &#39;Z&#39;
cmp al, &#39;Z&#39; ; Compare AL with ASCII &#39;Z&#39;
je end_print ; If equal, jump to end_print

; Move to the next character
inc al ; Increment AL to get the next character
jmp print_loop ; Repeat the loop

end_print:
; Print a newline after the characters
mov ah, 09h ; DOS function to output a string

lea dx, newline ; Load the address of the newline string
int 21h ; Call DOS interrupt to print newline

; Exit the program
mov ah, 4Ch ; DOS function to terminate the program
int 21h ; Call DOS interrupt to exit

main endp
end main