; Calc
;
; Author: Zach Hammad
; Date: 1/3/2025

global _start

section .data
message db 0dh, 0ah, 0dh, 0ah "Calculator", 0dh, 0ah, 0dh, 0ah
msg_length equ $-message
choice db "Please make choice: ", 0dh, 0ah
choice_length equ $-choice
operator db "1. Add", 0dh, 0ah, "2. Sub", 0ah, 0dh, "3. Mult", 0dh, 0ah, "4. Div", 0dh, 0ah, "5. Exit",10
op_lenght equ $-operator
first_number db "Please enter first number: ", 0dh, 0ah
first_number_length equ $-first_number
second_number db "Please enter second number: ", 0dh, 0ah
second_number_length equ $-second_number
answer db "Answer of "
answer_length equ $-answer
plus db "+"
plus_length equ $-plus
minus db "-"
minus_lenght equ $-minus
multi db "*"
multi_length equ $-multi
divi db "/"
divi_length equ $-divi
equals db "="
equals_length equ $-equals

tmp: db 0,0;
first_temp: db 0,0;
second_temp: db 0,0;
digit_buf db 0;
newline db 0xA 

section .text
_start:

LOOP:
    call wel_mess
    call get_choice
    call operators
    call get_input
    call Compare_input
    jmp LOOP


get_choice:
    mov rax, 0x1
    mov rdi, 1
    mov rsi, choice
    mov rdx, choice_length
    syscall
    ret

operators:
    mov rax, 0x1
    mov rdi, 1
    mov rsi, operator
    mov rdx, op_lenght
    syscall
    ret
get_input:
    mov rax, 0x0
    mov rdi, 0
    mov rsi, tmp
    mov rdx, 2
    syscall
    ret
wel_mess:
    mov rax, 0x1
    mov rdi, 1
    mov rsi, message
    mov rdx, msg_length
    syscall
    ret

Compare_input:
    mov al, [tmp]
    cmp al, '1'
    je Add

    cmp al, '2'
    je Sub

    cmp al, '3'
    je Mult

    cmp al, '4'
    je Div

    cmp al, '5'
    je Exit

Add:
    mov rax, 0x1
    mov rdi, 1
    mov rsi, first_number
    mov rdx, first_number_length
    syscall

    mov rax, 0
    mov rdi, 0 
    mov rsi, first_temp
    mov rdx, 2
    syscall

    mov r8, first_temp

    mov rax, 0x1
    mov rdi, 1
    mov rsi, second_number
    mov rdx, second_number_length
    syscall

    mov rax, 0
    mov rdi, 0 
    mov rsi, second_temp
    mov rdx, 2
    syscall

    mov r9, second_temp

    push r8
    push r9

    mov r8, [first_temp]
    mov r9, [second_temp]

    sub r8, 48
    sub r9, 48

    mov r10, r8
    add r10, r9

    pop r9
    pop r8

    add r10, 48

    mov rax, 0x1
    mov rdi, 1
    mov rsi, answer
    mov rdx, answer_length
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, r8
    mov rdx, 1
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, plus
    mov rdx, plus_length
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, r9
    mov rdx, 1
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, equals
    mov rdx, equals_length
    syscall

    mov [rsp+8], r10

    mov rax, 0x1
    mov rdi, 1
    lea rsi, [rsp+8]
    mov rdx, 1
    syscall

    jmp LOOP

Sub:
    mov rax, 0x1
    mov rdi, 1
    mov rsi, first_number
    mov rdx, first_number_length
    syscall

    mov rax, 0
    mov rdi, 0 
    mov rsi, first_temp
    mov rdx, 2
    syscall

    mov r8, first_temp

    mov rax, 0x1
    mov rdi, 1
    mov rsi, second_number
    mov rdx, second_number_length
    syscall

    mov rax, 0
    mov rdi, 0 
    mov rsi, second_temp
    mov rdx, 2
    syscall

    mov r9, second_temp

    push r8
    push r9

    mov r8, [first_temp]
    mov r9, [second_temp]

    sub r8, 48
    sub r9, 48

    mov r10, r8
    sub r10, r9

    pop r9
    pop r8

    add r10, 48

    mov rax, 0x1
    mov rdi, 1
    mov rsi, answer
    mov rdx, answer_length
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, r8
    mov rdx, 1
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, minus
    mov rdx, minus_lenght
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, r9
    mov rdx, 1
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, equals
    mov rdx, equals_length
    syscall

    mov [rsp+8], r10

    mov rax, 0x1
    mov rdi, 1
    lea rsi, [rsp+8]
    mov rdx, 1
    syscall

    jmp LOOP


Mult:
    mov rax, 0x1
    mov rdi, 1
    mov rsi, first_number
    mov rdx, first_number_length
    syscall

    mov rax, 0
    mov rdi, 0 
    mov rsi, first_temp
    mov rdx, 2
    syscall

    mov r8, first_temp

    mov rax, 0x1
    mov rdi, 1
    mov rsi, second_number
    mov rdx, second_number_length
    syscall

    mov rax, 0
    mov rdi, 0 
    mov rsi, second_temp
    mov rdx, 2
    syscall

    mov r9, second_temp

    push r8
    push r9

    mov r8, [first_temp]
    mov r9, [second_temp]

    sub r8, 48
    sub r9, 48

    mov r10, r8
    imul r10, r9

    pop r9
    pop r8

    add r10, 48

    mov rax, 0x1
    mov rdi, 1
    mov rsi, answer
    mov rdx, answer_length
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, r8
    mov rdx, 1
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, multi
    mov rdx, multi_length
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, r9
    mov rdx, 1
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, equals
    mov rdx, equals_length
    syscall

    mov [rsp+8], r10

    mov rax, 0x1
    mov rdi, 1
    lea rsi, [rsp+8]
    mov rdx, 1
    syscall

    jmp LOOP


Div:
    
    mov rax, 0x1
    mov rdi, 1
    mov rsi, first_number
    mov rdx, first_number_length
    syscall

    mov rax, 0
    mov rdi, 0 
    mov rsi, first_temp
    mov rdx, 2
    syscall

    mov r8, first_temp

    mov rax, 0x1
    mov rdi, 1
    mov rsi, second_number
    mov rdx, second_number_length
    syscall

    mov rax, 0
    mov rdi, 0 
    mov rsi, second_temp
    mov rdx, 2
    syscall

    xor eax, eax
    mov al, [first_temp]
    sub al, 48

    xor ecx, ecx
    mov cl, [second_temp]
    sub cl, 48

    xor edx, edx
    div ecx

    add al, 48
    mov [digit_buf], al

    mov rax, 0x1
    mov rdi, 1
    mov rsi, answer
    mov rdx, answer_length
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, first_temp
    mov rdx, 1
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, divi
    mov rdx, divi_length
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, second_temp
    mov rdx, 1
    syscall

    mov rax, 0x1
    mov rdi, 1
    mov rsi, equals
    mov rdx, equals_length
    syscall

    mov rax, 0x1
    mov rdi, 1
    lea rsi, digit_buf
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    jmp LOOP



Exit:
    mov rax, 60
    mov rdi, 0
    syscall
    sysexit