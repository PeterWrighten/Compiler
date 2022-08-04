_fact:
    push ebp
    mov  ebp, esp
    cmp  8[ebp], 1
    jne  L2
    mov  eax, 1
    jmp L1
L2: 
    mov  eax, 8[ebp]
    sub  eax, 1
    push eax
    call _fact
    add  esp, 4
    imul eax, 8[ebp]
L1:
    pop ebp
    ret