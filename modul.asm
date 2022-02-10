bits 32
global reprezentare
;nr=0, p=1
;while m!=0
;n=m%16-->se face impartirea prin div si in ax am restul si in dx am catul
;nr=nr+p*n
;p=p*10 
;m=m/16
segment code use32 class=code public
    reprezentare:
        mov ax, [esp+4]
        mov dx, [esp+6]
        mov ecx, 0 ;nr=nr+p*n
        mov bx, 1; p=p*10
        bucla:
            push cx
            mov cx, 16
            div cx 
            pop cx 
            push dx ;restul impartirii
            push ax 
            mov ax, dx 
            mul bx ;dx:ax=p*n 
            push ax
            push dx 
            pop eax
            add ecx,eax ;ecx=nr 
            mov ax, bx 
            push cx 
            mov cx, 10
            mul cx 
            mov bx, ax
            pop cx 
            pop ax 
            pop dx 
            cmp dx, 0
        jne bucla 
        mov eax, ecx 
ret