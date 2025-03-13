section .data
    str db 100 dup(0)          ; buffer for input string
    prompt db "Enter a string: ", 0
    error_msg db "Error opening file", 0
    success_msg db "String written to out.txt successfully.", 0
    filename db "out.txt", 0
 
section .bss
    fp resq 1                  ; file pointer
 
section .text
    extern printf, fgets, fopen, fprintf, fclose, perror, strcspn
    global main
 
main:
    ; Print prompt
    mov rdi, prompt
    call printf
 
    ; Read string from stdin
    mov rdi, str
    mov rsi, 100
    mov rdx, stdin
    call fgets
 
    ; Remove trailing newline character if present
    mov rdi, str
    mov rsi, 10               ; newline character
    call strcspn
    mov byte [rdi + rax], 0   ; replace newline with null terminator
 
    ; Open the file in write mode
    mov rdi, filename
    mov rsi, "w"
    call fopen
    mov [fp], rax             ; store file pointer
 
    ; Check if file opened successfully
    cmp rax, 0
    je .file_error
 
    ; Write the string to the file
    mov rdi, [fp]
    mov rsi, str
    call fprintf
 
    ; Close the file
    mov rdi, [fp]
    call fclose
 
    ; Print success message
    mov rdi, success_msg
    call printf
 
    ; Return 0
    mov eax, 0
    ret
 
.file_error:
    ; Print error message
    mov rdi, error_msg
    call perror
 
    ; Return 1
    mov eax, 1
    ret
@requires_authorization
def somefunc(param1='', param2=0):
    r'''A docstring'''
    if param1 > param2: # interesting
        print 'Gre\'ater'
    return (param2 - param1 + 1 + 0b10l) or None

class SomeClass:
    pass

>>> message = '''interpreter
... prompt'''
section .data
    str db 100 dup(0)          ; buffer for input string
    prompt db "Enter a string: ", 0
    error_msg db "Error opening file", 0
    success_msg db "String written to out.txt successfully.", 0
    filename db "out.txt", 0

section .bss
    fp resq 1                  ; file pointer

section .text
    extern printf, fgets, fopen, fprintf, fclose, perror, strcspn
    global main

main:
    ; Print prompt
    mov rdi, prompt
    call printf

    ; Read string from stdin
    mov rdi, str
    mov rsi, 100
    mov rdx, stdin
    call fgets

    ; Remove trailing newline character if present
    mov rdi, str
    mov rsi, 10               ; newline character
    call strcspn
    mov byte [rdi + rax], 0   ; replace newline with null terminator

    ; Open the file in write mode
    mov rdi, filename
    mov rsi, "w"
    call fopen
    mov [fp], rax             ; store file pointer

    ; Check if file opened successfully
    cmp rax, 0
    je .file_error

    ; Write the string to the file
    mov rdi, [fp]
    mov rsi, str
    call fprintf

    ; Close the file
    mov rdi, [fp]
    call fclose

    ; Print success message
    mov rdi, success_msg
    call printf

    ; Return 0
    mov eax, 0
    ret

.file_error:
    ; Print error message
    mov rdi, error_msg
    call perror

    ; Return 1
    mov eax, 1
    ret
