bits 32 ; assembling for the 32 bits architecture

global start        
;Se da un numar a reprezentat pe 32 biti fara semn. Se cere sa se afiseze reprezentarea in baza 16 a lui a,
;precum si rezultatul permutarilor circulare ale cifrelor sale.
extern exit, printf               
import exit msvcrt.dll    
import printf msvcrt.dll    
extern reprezentare
extern permutare

segment data use32 class=data public
    ; ...
    a dd 1234
    format_afisare db "%x", 0
    format db "%d",0

segment code use32 class=code public
    start:
        
    push dword [a]
    call reprezentare
    add esp, 4

    push dword [a]
    push dword format_afisare
    call [printf] 
    add esp, 4*2
    
    mov ebx, [a]
    
    push ebx 
    push dword[a]
    call permutare
    add esp, 4*2
    
    push eax
    push dword format
    call [printf] 
    add esp,4*2

    
    
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
