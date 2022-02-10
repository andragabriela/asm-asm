bits 32
global permutare
;int perm(int &n){
;    int aux=n,nr = n,x,nr_num = 1;
;   while n!=aux
;    {while(nr > 0){
;        x = nr%10;edx 
;        nr/=10;eax 
;        nr_num*=10;
;    }
;    nr_num/=10;
;    n = (n - nr_num*x)*10 +x;
;}}
segment code use32 class=code public
    permutare:
    ;esp+8 am nr initial
    cattimp_de_baza:
        mov eax, [esp+4]
        mov edx, [esp+6]
        mov ecx, 10
        div ecx ;edx=restul eax=catul
        mov ecx, 1
        mov ebx, 0
        cattimp:
                push eax 
                push edx 
                mov eax, ecx 
                mov ecx, 10
                mul ecx ; edx:eax=nr_num*10
                mov ecx, eax 
                pop edx 
                pop eax 
                mov ebx, 10
                div ebx
        cmp eax, 0
        jg cattimp 
        mov ebx, 0
        mov eax, ecx 
        mov edx, ebx
        mov esi, 10
        div esi;eax=nr_num/10;
        
        ;edx=x
        mov ebx, edx 
        push edx 
        mul ebx  ;edx:eax=nr_num*x
        sub [esp+4], eax ;[esp+4]=n - nr_num*x
        ;sbb ecx, edx 
        mov eax, [esp+4]
        mov ecx, 10
        mul ecx;edx:eax=(n - nr_num*x)*10
        pop edx 
        add eax, edx 
       ;n = (n - nr_num*x)*10 +x;    x e in edx 
    cmp [esp+8], eax 
    jne cattimp_de_baza
ret

;a 

;dx;ax+word -add ax, word[a] adc dx, 0
;ax +dword mov dx,0 add ax,word[a]  adc dx,word[a+2]     