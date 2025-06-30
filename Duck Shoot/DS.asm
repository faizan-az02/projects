.model small
.stack 100h

.data
G1 db 'GAME A SLOW DUCK$'
G2 db 'GAME B FAST DUCK$'
pointer db ' >$'
rec db 'w'
space db '  $'
instructions db 'Use W/S to navigate. Enter to select$'
top db 'Top Score = $'
max_score db 4 dup (?)
up dw 32
left dw -50
stop dw 0
round db 'Round = $'
r_num dw 49
duck_xs dw 78
duck_xe dw 91
duck_ys dw 0
duck_ye dw 0
score_prompt db 'Score = $'
score dw 0
count dw 0
bullets dw 30
bullet_prompt db 'Bullets = $'
outro db 'Well Played!$'
fname db 'score.txt', 0

.code

;=========================MAIN FUNCTION===========================

main proc

mov ax, @data
mov ds, ax

call get_score

mov ah, 0h
mov al, 13h
int 10h

call loading

call delay

call clear_screen

call screen1

call delay

call print_click

call click

call clear_screen

call screen2

call clear_screen

mov dx, 0000h
mov ah, 02h
int 10h

call print_bg

cmp rec, 'w'
je mode1
jmp mode2

mode1:

call game1
jmp ex2

mode2:
call game2

ex2:

call clear_screen

call outro_screen

call click

call clear_screen

mov ah, 4ch
int 21h

main endp

;=======================FUNCTIONS============================

;=======================GAME A===========================

game1 proc

mov ax, 0
int 33h

mov ax, 1
int 33h

mov cx, 3

rounds:

cmp r_num, 52
je exit_rounds

call clear_screen

call print_round

call delay

call ga_round

inc r_num

jmp rounds

exit_rounds:

ret

game1 endp

game2 proc

mov ax, 0
int 33h

mov ax, 1
int 33h

mov cx, 3

b_rounds:

cmp r_num, 52
je exit_rounds

call clear_screen

call print_round

call delay

call gb_round

inc r_num

jmp b_rounds

exit_b_rounds:

ret
game2 endp

;=======================SCREEN 2===========================

screen2 proc

call logo

lea dx, instructions
mov ah, 09
int 21h

mov dl, 12
mov dh, 22
mov ah, 02h
int 10h

lea dx, top
mov ah, 09h
int 21h

mov dl, 24
mov dh, 22
mov ah, 02h
int 10h

lea dx, max_score
mov ah, 09h
int 21h

mov dl, 11
mov dh, 14
mov ah, 02h
int 10h

lea dx, pointer
mov ah, 09h
int 21h

mov dl, 14
mov dh, 14
mov ah, 02h
int 10h

lea dx, G1
mov ah, 09h
int 21h

mov dl, 14
mov dh, 16
mov ah, 02h
int 10h

lea dx, G2
mov ah, 09h
int 21h

select:

mov ah, 08h
int 21h

cmp al, 'w'
je up_key
cmp al, 's'
je down_key
cmp al, 13
je ex
jmp cont

up_key:
mov rec, 'w'
mov dl, 11
mov dh, 14
mov ah, 02h
int 10h

lea dx, pointer
mov ah, 09h
int 21h

mov dl, 11
mov dh, 16
mov ah, 02h
int 10h

lea dx, space
mov ah, 09h
int 21h
jmp cont

down_key:
mov rec, 'd'
mov dl, 11
mov dh, 16
mov ah, 02h
int 10h

lea dx, pointer
mov ah, 09h
int 21h

mov dl, 11
mov dh, 14
mov ah, 02h
int 10h

lea dx, space
mov ah, 09h
int 21h

cont:
jmp select

ex:

ret

screen2 endp

;=======================SCREEN 1===========================

screen1 proc

mov ah, 0Ch
mov al, 0Eh

;=======================Printing FAIZAN============================

;print F

mov cx, 12
mov dx, 150

Fline1:

push cx

mov cx, 22
int 10h
inc dx
pop cx

loop Fline1

mov cx, 11
mov dx, 150

Fline2:

push cx

mov cx, 23
int 10h
inc dx
pop cx

loop Fline2

mov bx, 24
mov cx, 7
mov dx, 150

Fline3:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop Fline3

mov bx, 24
mov cx, 8
mov dx, 151

Fline4:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop Fline4

mov bx, 24
mov cx, 5
mov dx, 155

Fline5:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop Fline5

mov bx, 24
mov cx, 6
mov dx, 156

Fline6:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop Fline6

;print A1

mov bx, 35
mov cx, 9
mov dx, 150

Aline1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Aline1

mov bx, 34
mov cx, 11
mov dx, 151

Aline2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Aline2

mov cx, 12
mov dx, 150

Aline3:

push cx

mov cx, 35
int 10h
inc dx
pop cx

loop Aline3

mov cx, 10
mov dx, 151

Aline4:

push cx

mov cx, 34
int 10h
inc dx
pop cx

loop Aline4

mov cx, 12
mov dx, 150

Aline5:

push cx

mov cx, 43
int 10h
inc dx
pop cx

loop Aline5

mov cx, 10
mov dx, 151

Aline6:

push cx

mov cx, 44
int 10h
inc dx
pop cx

loop Aline6

mov bx, 36
mov cx, 8
mov dx, 155

Aline7:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop Aline7

mov bx, 36
mov cx, 8
mov dx, 156

Aline8:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop Aline8

;print I

mov cx, 11
mov dx, 150

Iline1:

push cx

mov cx, 47
int 10h
inc dx
pop cx

loop Iline1

mov cx, 12
mov dx, 150

Iline2:

push cx

mov cx, 48
int 10h
inc dx
pop cx

loop Iline2

;print Z

mov bx, 52
mov cx, 8
mov dx, 150

Zline1:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop Zline1

mov bx, 51
mov cx, 10
mov dx, 151

Zline2:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop Zline2

mov bx, 52
mov cx, 9
mov dx, 161

Zline3:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop Zline3

mov bx, 51
mov cx, 9
mov dx, 160

Zline4:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop Zline4

mov dx, 152
mov bx, 60
mov cx, 9

Zline5:

push cx

mov cx, bx
int 10h
dec bx
inc dx

pop cx

loop Zline5

mov dx, 152
mov bx, 59
mov cx, 9

Zline6:

push cx

mov cx, bx
int 10h
dec bx
inc dx

pop cx

loop Zline6

;print A2

mov bx, 64
mov cx, 9
mov dx, 150

A2line1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop A2line1

mov bx, 63
mov cx, 11
mov dx, 151

A2line2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop A2line2

mov cx, 12
mov dx, 150

A2line3:

push cx

mov cx, 64
int 10h
inc dx
pop cx

loop A2line3

mov cx, 10
mov dx, 151

A2line4:

push cx

mov cx, 63
int 10h
inc dx
pop cx

loop A2line4

mov cx, 12
mov dx, 150

A2line5:

push cx

mov cx, 72
int 10h
inc dx
pop cx

loop A2line5

mov cx, 10
mov dx, 151

A2line6:

push cx

mov cx, 73
int 10h
inc dx
pop cx

loop A2line6

mov bx, 64
mov cx, 8
mov dx, 155

A2line7:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop A2line7

mov bx, 64
mov cx, 8
mov dx, 156

A2line8:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop A2line8

;print N

mov cx, 12
mov dx, 150

Nline1:

push cx

mov cx, 77
int 10h
inc dx
pop cx

loop Nline1

mov cx, 10
mov dx, 151

nline2:

push cx

mov cx, 76
int 10h
inc dx
pop cx

loop Nline2

mov cx, 11
mov dx, 151

Nline3:

push cx

mov cx, 87
int 10h
inc dx
pop cx

loop Nline3

mov cx, 11
mov dx, 150

Nline4:

push cx

mov cx, 88
int 10h
inc dx
pop cx

loop Nline4

mov cx, 9
mov dx, 150
mov bx, 78

Nline5:

push cx

mov cx, bx
int 10h
inc bx
inc dx
pop cx

loop Nline5

mov cx, 9
mov dx, 151
mov bx, 78

Nline6:

push cx

mov cx, bx
int 10h
inc bx
inc dx
pop cx

loop Nline6

;=======================Printing HASNAIN============================

;print H

mov cx, 12
mov dx, 166

Hline1:

push cx

mov cx, 22
int 10h
inc dx
pop cx

loop Hline1

mov cx, 11
mov dx, 166

Hline2:

push cx

mov cx, 23
int 10h
inc dx
pop cx

loop Hline2

mov cx, 12
mov dx, 166

Hline3:

push cx

mov cx, 30
int 10h
inc dx
pop cx

loop Hline3

mov cx, 11
mov dx, 166

Hline4:

push cx

mov cx, 31
int 10h
inc dx
pop cx

loop Hline4

mov bx, 24
mov cx, 8
mov dx, 170

Hline5:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop Hline5

mov bx, 24
mov cx, 8
mov dx, 171

Hline6:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop Hline6

;print A

mov bx, 35
mov cx, 9
mov dx, 166

A3line1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop A3line1

mov bx, 34
mov cx, 11
mov dx, 167

A3line2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop A3line2

mov cx, 10
mov dx, 167

A3line3:

push cx

mov cx, 34
int 10h
inc dx
pop cx

loop A3line3

mov cx, 10
mov dx, 168

A3line4:

push cx

mov cx, 35
int 10h
inc dx
pop cx

loop A3line4

mov cx, 11
mov dx, 167

A3line5:

push cx

mov cx, 43 
int 10h
inc dx
pop cx

loop A3line5

mov cx, 9
mov dx, 168

A3line6:

push cx

mov cx, 44
int 10h
inc dx
pop cx

loop A3line6

mov bx, 36
mov cx, 8
mov dx, 171

A3line7:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop A3line7

mov bx, 36
mov cx, 8
mov dx, 172

A3line8:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop A3line8

;print S

mov bx, 48
mov cx, 9
mov dx, 166

Sline1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Sline1

mov bx, 47
mov cx, 11
mov dx, 167

Sline2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Sline2

mov bx, 48
mov cx, 9
mov dx, 172

Sline3:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Sline3

mov bx, 47
mov cx, 10
mov dx, 171

Sline4:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Sline4

mov bx, 48
mov cx, 9
mov dx, 177

Sline5:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Sline5

mov bx, 47
mov cx, 11
mov dx, 176

Sline6:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Sline6

mov cx, 3
mov dx, 168

Sline7:

push cx

mov cx, 47
int 10h
inc dx
pop cx

loop Sline7

mov cx, 3
mov dx, 168

Sline8:

push cx

mov cx, 48
int 10h
inc dx
pop cx

loop Sline8

mov cx, 4
mov dx, 172

Sline9:

push cx

mov cx, 56
int 10h
inc dx
pop cx

loop Sline9

mov cx, 4
mov dx, 172

Sline10:

push cx

mov cx, 57
int 10h
inc dx
pop cx

loop Sline10

;print N

mov cx, 12
mov dx, 166

N2line1:

push cx

mov cx, 61
int 10h
inc dx
pop cx

loop N2line1

mov cx, 10
mov dx, 167

N2line2:

push cx

mov cx, 60
int 10h
inc dx
pop cx

loop N2line2

mov cx, 10
mov dx, 167

N2line3:

push cx

mov cx, 72
int 10h
inc dx
pop cx

loop N2line3

mov cx, 12
mov dx, 166

N2line4:

push cx

mov cx, 71
int 10h
inc dx
pop cx

loop N2line4

mov cx, 9
mov dx, 166
mov bx, 62

N2line5:

push cx

mov cx, bx
int 10h
inc bx
inc dx
pop cx

loop N2line5

mov cx, 9
mov dx, 167
mov bx, 62

N2line6:

push cx

mov cx, bx
int 10h
inc bx
inc dx
pop cx

loop N2line6

;print A

mov bx, 76
mov cx, 9
mov dx, 166

A4line1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop A4line1

mov bx, 75
mov cx, 11
mov dx, 167

A4line2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop A4line2

mov cx, 10
mov dx, 167

A4line3:

push cx

mov cx, 75
int 10h
inc dx
pop cx

loop A4line3

mov cx, 10
mov dx, 168

A4line4:

push cx

mov cx, 76
int 10h
inc dx
pop cx

loop A4line4

mov cx, 11
mov dx, 167

A4line5:

push cx

mov cx, 84 
int 10h
inc dx
pop cx

loop A4line5

mov cx, 9
mov dx, 168

A4line6:

push cx

mov cx, 85
int 10h
inc dx
pop cx

loop A4line6

mov bx, 77
mov cx, 8
mov dx, 171

A4line7:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop A4line7

mov bx, 77
mov cx, 8
mov dx, 172

A4line8:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop A4line8

;print I

mov cx, 11
mov dx, 166

I2line1:

push cx

mov cx, 88
int 10h
inc dx
pop cx

loop I2line1

mov cx, 12
mov dx, 166

I2line2:

push cx

mov cx, 89
int 10h
inc dx
pop cx

loop I2line2

;print N

mov cx, 12
mov dx, 166

N3line1:

push cx

mov cx, 93
int 10h
inc dx
pop cx

loop N3line1

mov cx, 10
mov dx, 167

N3line2:

push cx

mov cx, 92
int 10h
inc dx
pop cx

loop N3line2

mov cx, 10
mov dx, 167

N3line3:

push cx

mov cx, 104
int 10h
inc dx
pop cx

loop N3line3

mov cx, 12
mov dx, 166

N3line4:

push cx

mov cx, 103
int 10h
inc dx
pop cx

loop N3line4

mov cx, 9
mov dx, 166
mov bx, 94

N3line5:

push cx

mov cx, bx
int 10h
inc bx
inc dx
pop cx

loop N3line5

mov cx, 9
mov dx, 167
mov bx, 94

N3line6:

push cx

mov cx, bx
int 10h
inc bx
inc dx
pop cx

loop N3line6

call logo

ret

screen1 endp

;=================LOADING SCREEN====================

loading proc

mov ah, 0Ch
mov al, 0Fh

;==================printing LOADING BAR===================

mov cx, 2

rows3:  

mov bx, 75 
mov dx, 75 
add dx, cx 
 
push cx

mov cx, 165
 
LoadUpper: 
 
push cx  
mov cx, bx 
int 10h 
inc bx  
pop cx  

loop LoadUpper
 
pop cx  

loop rows3

mov cx, 2

rows4:  

mov bx, 75 
mov dx, 84
add dx, cx 
 
push cx

mov cx, 165
 
LoadLower: 
 
push cx  
mov cx, bx 
int 10h 
inc bx  
pop cx  

loop LoadLower
 
pop cx  

loop rows4

mov cx, 10
mov dx, 76

LoadLeft1:

push cx

mov cx, 75
int 10h
inc dx

pop cx

loop LoadLeft1

mov cx, 10
mov dx, 76

LoadLeft2:

push cx

mov cx, 76
int 10h
inc dx

pop cx

loop LoadLeft2

mov cx, 10
mov dx, 76

LoadRight1:

push cx

mov cx, 238
int 10h
inc dx

pop cx

loop LoadRight1

mov cx, 10
mov dx, 76

LoadRight2:

push cx

mov cx, 239
int 10h
inc dx

pop cx

loop LoadRight2

;===================printing LOADING ANIMATION=======================

mov al, 0Bh

call delay

;1st block

mov cx, 35
mov dx, 79
mov bx, 78

block1L1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block1L1

mov cx, 34
mov dx, 80
mov bx, 78

block1L2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block1L2

mov cx, 33
mov dx, 81
mov bx, 78

block1L3:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block1L3

mov cx, 32
mov dx, 82
mov bx, 78

block1L4:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block1L4

mov cx, 31
mov dx, 83
mov bx, 78

block1L5:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block1L5

call delay

;2nd block

mov cx, 35
mov dx, 79
mov bx, 115

block2L1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block2L1

mov cx, 35
mov dx, 80
mov bx, 114

block2L2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block2L2

mov cx, 35
mov dx, 81
mov bx, 113

block2L3:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block2L3

mov cx, 35
mov dx, 82
mov bx, 112

block2L4:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block2L4

mov cx, 35
mov dx, 83
mov bx, 111

block2L5:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block2L5

call delay

;3rd block

mov cx, 35
mov dx, 79
mov bx, 152

block3L1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block3L1

mov cx, 35
mov dx, 80
mov bx, 151

block3L2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block3L2

mov cx, 35
mov dx, 81
mov bx, 150

block3L3:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block3L3

mov cx, 35
mov dx, 82
mov bx, 149

block3L4:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block3L4

mov cx, 35
mov dx, 83
mov bx, 148

block3L5:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block3L5

call delay

;4th block

mov cx, 35
mov dx, 79
mov bx, 189

block4L1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block4L1

mov cx, 35
mov dx, 80
mov bx, 188

block4L2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block4L2

mov cx, 35
mov dx, 81
mov bx, 187

block4L3:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block4L3

mov cx, 35
mov dx, 82
mov bx, 186

block4L4:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block4L4

mov cx, 35
mov dx, 83
mov bx, 185

block4L5:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block4L5

call delay

;5th block

mov cx, 11
mov dx, 79
mov bx, 226

block5L1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block5L1

mov cx, 12
mov dx, 80
mov bx, 225

block5L2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block5L2

mov cx, 13
mov dx, 81
mov bx, 224

block5L3:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block5L3

mov cx, 14
mov dx, 82
mov bx, 223

block5L4:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block5L4

mov cx, 15
mov dx, 83
mov bx, 222

block5L5:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop block5L5

ret

loading endp

;==================DELAY FUNCTION=================

delay proc 

mov cx, 250

delRep:
push cx  
mov cx, 0FFFH 

delDec:
dec cx 
jnz delDec

pop cx
dec cx
jnz delRep

ret

delay endp

;==============MOUSE CLICK AT START FUNCTION===============

click proc

keepgoing:

mov ax, 1
int 33h
mov ax, 3
int 33h

mov ax, 5
mov bx, 0
int 33h

cmp ax, 1
jne keepgoing

ret

click endp

;=================CLEARING SCREEN FUNCTION========================

clear_screen proc

mov ah, 6
mov bh, 00h

mov al, 0
mov ch, 0 
mov cl, 0   
mov dh, 24 
mov dl, 79 
     
int 10h

ret

clear_screen endp

;==================CLICK! PRINTING FUNCTION=======================

print_click proc

mov al, 0Fh

;print C

mov bx, 140
mov dx, 120
mov cx, 5

C2line1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop C2line1

mov bx, 140
mov dx, 113
mov cx, 5

C2line2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop C2line2

mov dx, 114
mov cx, 6

C2line3:

push cx

mov cx, 139
int 10h
inc dx

pop cx

loop C2line3

;print L

mov dx, 113
mov cx, 7

Lline1:

push cx

mov cx, 147
int 10h
inc dx

pop cx

loop Lline1

mov bx, 147
mov dx, 120
mov cx, 5

Lline2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Lline2

;print I

mov dx, 113
mov cx, 8

I3line1:

push cx

mov cx, 154
int 10h
inc dx

pop cx

loop I3line1

;print C

mov bx, 158
mov dx, 120
mov cx, 5

C3line1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop C3line1

mov bx, 158
mov dx, 113
mov cx, 5

C3line2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop C3line2

mov dx, 114
mov cx, 6

C3line3:

push cx

mov cx, 157
int 10h
inc dx

pop cx

loop C3line3

;print K

mov dx, 113
mov cx, 8

K2line1:

push cx

mov cx, 165
int 10h
inc dx

pop cx

loop K2line1

mov cx, 4
mov dx, 116
mov bx, 166

K2line2:

push cx

mov cx, bx
int 10h
inc bx
dec dx

pop cx

loop K2line2

mov cx, 4
mov dx, 117
mov bx, 166

K2line3:

push cx

mov cx, bx
int 10h
inc bx
inc dx

pop cx

loop K2line3

;print !

mov dx, 113
mov cx, 8

Excline1:

push cx

mov cx, 172
int 10h
inc dx

pop cx

loop Excline1

mov al, 0h

mov cx, 172
mov dx, 119

int 10h

ret

print_click endp

;========================PRINTING NAME AND LOGO FUNCTION====================================

logo proc

;========================PRINTING GUN====================================

;========PRINTING HANDLE========

mov ah, 0CH

mov al, 06h

mov cx, 4

rows1:  

mov bx, 75 
mov dx, 75 
add dx, cx 
 
push cx

mov cx, 45 
 
HandleBB: 
 
push cx  
mov cx, bx 
int 10h 
inc bx  
pop cx  

loop HandleBB 
 
pop cx  

loop rows1

mov cx, 44
mov bx, 75 
mov dx, 80

HandleBL1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop HandleBL1

mov cx, 43
mov bx, 75 
mov dx, 81

HandleBL2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop HandleBL2

mov cx, 42
mov bx, 75 
mov dx, 82

HandleBL3:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop HandleBL3

mov cx, 41
mov bx, 75 
mov dx, 83

HandleBL4:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop HandleBL4

mov cx, 40
mov bx, 75 
mov dx, 84

HandleBL5:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop HandleBL5

mov cx, 39
mov bx, 75 
mov dx, 85

HandleBL6:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop HandleBL6

mov cx, 36
mov bx, 77 
mov dx, 86

HandleBL7:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop HandleBL7

mov al, 07h

mov cx, 4

rows2:  

mov bx, 120 
mov dx, 75 
add dx, cx 
 
push cx  
mov cx, 115
 
Barrel: 
 
push cx  
mov cx, bx 
int 10h 
inc bx  
pop cx  

loop Barrel
 
pop cx  

loop rows2

mov bx, 116
mov dx, 83
mov cx, 7

mov al, 0Fh

TriggerL1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop TriggerL1

mov cx, 123
mov dx, 82

int 10h

mov cx, 124
mov dx, 81

int 10h

mov cx, 124
mov dx, 80

int 10h

mov cx, 120
mov dx, 81

int 10h

mov cx, 120
mov dx, 80

int 10h

;========================PRINTING SHOOT====================================

mov al, 0Fh

;print S

mov bx, 170
mov cx, 9
mov dx, 81

S2line1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop S2line1

mov bx, 169
mov cx, 11
mov dx, 82

S2line2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop S2line2

mov bx, 169
mov cx, 10
mov dx, 86

S2line3:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop S2line3

mov bx, 170
mov cx, 10
mov dx, 87

S2line4:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop S2line4

mov bx, 170
mov cx, 9
mov dx, 93

S2line5:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop S2line5

mov bx, 169
mov cx, 11
mov dx, 92

S2line6:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop S2line6

mov cx, 3
mov dx, 83

S2line7:

push cx

mov cx, 169
int 10h
inc dx
pop cx

loop S2line7

mov cx, 3
mov dx, 83

S2line8:

push cx

mov cx, 170
int 10h
inc dx
pop cx

loop S2line8

mov cx, 5
mov dx, 87

S2line9:

push cx

mov cx, 178
int 10h
inc dx
pop cx

loop S2line9

mov cx, 5
mov dx, 87

S2line10:

push cx

mov cx, 179
int 10h
inc dx
pop cx

loop S2line10

;print H

mov cx, 12
mov dx, 81

H2line1:

push cx

mov cx, 183
int 10h
inc dx
pop cx

loop H2line1

mov cx, 13
mov dx, 81

H2line2:

push cx

mov cx, 182
int 10h
inc dx
pop cx

loop H2line2

mov cx, 12
mov dx, 81

H2line3:

push cx

mov cx, 193
int 10h
inc dx
pop cx

loop H2line3

mov cx, 13
mov dx, 81

H2line4:

push cx

mov cx, 192
int 10h
inc dx
pop cx

loop H2line4

mov bx, 184
mov cx, 8
mov dx, 86

H2line5:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop H2line5

mov bx, 184
mov cx, 8
mov dx, 87

H2line6:

push cx

mov cx, bx
int 10h
inc bx
pop cx

loop H2line6

;print O

mov bx, 197
mov dx, 81
mov cx, 10

Oline1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Oline1

mov bx, 196
mov dx, 82
mov cx, 12

Oline2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Oline2

mov bx, 197
mov dx, 93
mov cx, 10

Oline3:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Oline3

mov bx, 196
mov dx, 92
mov cx, 12

Oline4:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Oline4

mov dx, 83
mov cx, 9

Oline5:

push cx

mov cx, 196
int 10h
inc dx

pop cx

loop Oline5

mov dx, 83
mov cx, 9

Oline6:

push cx

mov cx, 197
int 10h
inc dx

pop cx

loop Oline6

mov dx, 83
mov cx, 9

Oline7:

push cx

mov cx, 207
int 10h
inc dx

pop cx

loop Oline7

mov dx, 83
mov cx, 9

Oline8:

push cx

mov cx, 206
int 10h
inc dx

pop cx

loop Oline8

mov cx, 3
mov dx, 91

AimL1:

push cx

mov cx, 202
int 10h
dec dx

pop cx

loop AimL1

mov cx, 3
mov dx, 91

AimL2:

push cx

mov cx, 201
int 10h
dec dx

pop cx

loop AimL2

mov al, 04h

mov cx, 3
mov dx, 88

RedDotL1:

push cx

mov cx, 202
int 10h
dec dx

pop cx

loop RedDotL1

mov cx, 3
mov dx, 88

RedDotL2:

push cx

mov cx, 201
int 10h
dec dx

pop cx

loop RedDotL2

;print O

mov al, 0Fh

mov bx, 211
mov dx, 81
mov cx, 10

O2line1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop O2line1

mov bx, 210
mov dx, 82
mov cx, 12

O2line2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop O2line2

mov bx, 211
mov dx, 93
mov cx, 10

O2line3:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop O2line3

mov bx, 210
mov dx, 92
mov cx, 12

O2line4:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop O2line4

mov dx, 83
mov cx, 9

O2line5:

push cx

mov cx, 210
int 10h
inc dx

pop cx

loop O2line5

mov dx, 83
mov cx, 9

O2line6:

push cx

mov cx, 211
int 10h
inc dx

pop cx

loop O2line6

mov dx, 83
mov cx, 9

O2line7:

push cx

mov cx, 221
int 10h
inc dx

pop cx

loop O2line7

mov dx, 83
mov cx, 9

O2line8:

push cx

mov cx, 220
int 10h
inc dx

pop cx

loop O2line8

mov cx, 3
mov dx, 91

Aim2L1:

push cx

mov cx, 215
int 10h
dec dx

pop cx

loop Aim2L1

mov cx, 3
mov dx, 91

Aim2L2:

push cx

mov cx, 216
int 10h
dec dx

pop cx

loop Aim2L2

mov al, 04h

mov cx, 3
mov dx, 88

RedDot2L1:

push cx

mov cx, 216
int 10h
dec dx

pop cx

loop RedDot2L1

mov cx, 3
mov dx, 88

RedDot2L2:

push cx

mov cx, 215
int 10h
dec dx

pop cx

loop RedDot2L2

;print T

mov al, 0Fh

mov bx, 224
mov dx, 81
mov cx, 10

Tline1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Tline1

mov bx, 225
mov dx, 82
mov cx, 10

Tline2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Tline2

mov dx, 82
mov cx, 12

Tline3:

push cx

mov cx, 230
int 10h
inc dx

pop cx

loop Tline3

mov dx, 82
mov cx, 11

Tline4:

push cx

mov cx, 229
int 10h
inc dx

pop cx

loop Tline4

;========================printing DUCK====================================

;print D

mov cx, 13
mov dx, 62

Dline1:

push cx

mov cx, 76
int 10h
inc dx
pop cx

loop Dline1

mov cx, 13
mov dx, 62

Dline2:

push cx

mov cx, 75
int 10h
inc dx
pop cx

loop Dline2

mov cx, 8
mov bx, 77
mov dx, 62

Dline3:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Dline3

mov cx, 8
mov bx, 77
mov dx, 63

Dline4:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Dline4

mov cx, 8
mov bx, 77
mov dx, 73

Dline5:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Dline5

mov cx, 8
mov bx, 77
mov dx, 74

Dline6:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Dline6

mov cx, 9
mov dx, 64

Dline7:

push cx

mov cx, 85
int 10h
inc dx
pop cx

loop Dline7

mov cx, 9
mov dx, 64

Dline8:

push cx

mov cx, 86
int 10h
inc dx
pop cx

loop Dline8

;print U

mov bx, 89
mov dx, 73
mov cx, 12

Uline1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Uline1

mov bx, 90
mov dx, 74
mov cx, 10

Uline2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Uline2

mov dx, 63
mov cx, 11

Uline3:

push cx

mov cx, 89
int 10h
inc dx

pop cx

loop Uline3

mov dx, 62
mov cx, 13

Uline4:

push cx

mov cx, 90
int 10h
inc dx

pop cx

loop Uline4

mov dx, 62
mov cx, 13

Uline5:

push cx

mov cx, 99
int 10h
inc dx

pop cx

loop Uline5

mov dx, 63
mov cx, 10

Uline6:

push cx

mov cx, 100
int 10h
inc dx

pop cx

loop Uline6

;print C

mov bx, 104
mov dx, 62
mov cx, 8

Cline1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Cline1

mov bx, 103
mov dx, 63
mov cx, 10

Cline2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Cline2

mov bx, 103
mov dx, 73
mov cx, 10

Cline3:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Cline3

mov bx, 104
mov dx, 74
mov cx, 8

Cline4:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop Cline4

mov dx, 64
mov cx, 9

Cline5:

push cx

mov cx, 103
int 10h
inc dx

pop cx

loop Cline5

mov dx, 64
mov cx, 9

Cline6:

push cx

mov cx, 104
int 10h
inc dx

pop cx

loop Cline6

;print K

mov dx, 63
mov cx, 11

Kline1:

push cx

mov cx, 115
int 10h
inc dx

pop cx

loop Kline1

mov dx, 62
mov cx, 13

Kline2:

push cx

mov cx, 116
int 10h
inc dx

pop cx

loop Kline2

mov cx, 6
mov dx, 67
mov bx, 117

Kline3:

push cx

mov cx, bx
int 10h
inc bx
dec dx

pop cx

loop Kline3

mov cx, 6
mov dx, 67
mov bx, 118

Kline4:

push cx

mov cx, bx
int 10h
inc bx
dec dx

pop cx

loop Kline4

mov cx, 7
mov dx, 68
mov bx, 117

Kline5:

push cx

mov cx, bx
int 10h
inc bx
inc dx

pop cx

loop Kline5

mov cx, 7
mov dx, 68
mov bx, 118

Kline6:

push cx

mov cx, bx
int 10h
inc bx
inc dx

pop cx

loop Kline6

ret

logo endp

;=========================BACKGROUND FUNCTION===========================

print_bg proc

mov ah, 06h
mov al, 00h

mov bh, 11000000b
mov cl, 0
mov dl, 79
mov dh, 24
mov ch, 18

int 10h

mov bh, 30h
mov cl, 0
mov dl, 79
mov dh, 17
mov ch, 15

int 10h

mov bh, 50h
mov cl, 0
mov dl, 79
mov dh, 15
mov ch, 0

int 10h

mov bh, 70h
mov cl, 5
mov dl, 6
mov dh, 15
mov ch, 10

int 10h

mov bh, 11000000b
mov cl, 3
mov dl, 8
mov dh, 10
mov ch, 5

int 10h

mov ah, 0Ch
mov al, 00h

mov dx, 128
mov cx, 320
mov bx, 0

black_line1:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop black_line1

mov dx, 143
mov cx, 320
mov bx, 0

black_line2:

push cx

mov cx, bx
int 10h
inc bx

pop cx

loop black_line2

lea dx, score_prompt
mov ah, 09h
int 21h

mov ax, score
call output1

mov dl, 13
mov ah, 02h
int 21h

ret

print_bg endp

;=========================DELAY FOR GAME A FUNCTION===========================

delay_game1 proc 

mov cx, 20

delRep1:
push cx  
mov cx, 0FFFH 

delDec1:
dec cx 
jnz delDec1

pop cx
dec cx
jnz delRep1

ret

delay_game1 endp

;=========================DELAY FOR GAME B FUNCTION===========================

delay_game2 proc 

mov cx, 5

delRep2:
push cx  
mov cx, 0FFFH 

delDec2:
dec cx 
jnz delDec2

pop cx
dec cx
jnz delRep2

ret

delay_game2 endp

;=========================GAME A FUNCTION===========================

ga_round proc

mov left, -50
mov stop, 0

call delay

move1:

mov duck_xs, 78
mov bx, duck_xs
add bx, left
add bx, left
add bx, 80
mov duck_xs, bx

mov duck_xe, 91
mov bx, duck_xe
add bx, left
add bx, left
add bx, 80
mov duck_xe, bx

cmp stop, 325
je exit_up_bridge

call print_bg

mov al, 0Fh
mov ah, 0Ch

mov cx, 9
mov dx, 127
sub dx, up
mov bx, 80

mov duck_ys, dx

duckL1:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL1

mov cx, 11
mov dx, 126
sub dx, up
mov bx, 79

duckL2:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL2

mov cx, 13
mov dx, 125
sub dx, up
mov bx, 78

duckL3:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL3

mov cx, 13
mov dx, 124
sub dx, up
mov bx, 78

duckL4:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL4

jmp cont2

exit_up_bridge:

jmp exit_up

cont2:

mov cx, 13
mov dx, 123
sub dx, up
mov bx, 78

duckL5:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL5

mov cx, 13
mov dx, 122
sub dx, up
mov bx, 78

duckL6:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL6

mov cx, 13
mov dx, 121
sub dx, up
mov bx, 78

duckL7:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL7

mov cx, 11
mov dx, 120
sub dx, up
mov bx, 79

duckL8:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL8

mov cx, 9
mov dx, 119
sub dx, up
mov bx, 80

duckL9:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL9

mov cx, 7
mov dx, 118
sub dx, up
mov bx, 81

duckL10:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL10

mov cx, 5
mov dx, 117
sub dx, up
mov bx, 82

duckL11:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL11

mov cx, 7
mov dx, 116
sub dx, up
mov bx, 81

duckL12:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL12

mov cx, 9
mov dx, 115
sub dx, up
mov bx, 80

duckL13:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL13

mov cx, 9
mov dx, 114
sub dx, up
mov bx, 80

duckL14:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL14

mov cx, 9
mov dx, 113
sub dx, up
mov bx, 80

duckL15:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL15

mov cx, 9
mov dx, 112
sub dx, up
mov bx, 80

duckL16:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL16

mov cx, 7
mov dx, 111
sub dx, up
mov bx, 81

duckL17:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL17

mov cx, 5
mov dx, 110
sub dx, up
mov bx, 82

mov duck_ye, dx

duckL18:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL18

mov cx, 19
mov dx, 118
sub dx, up
mov bx, 75

duckL19:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL19

mov cx, 17
mov dx, 119
sub dx, up
mov bx, 76

duckL20:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL20

mov al, 0Eh

mov cx, 5
mov dx, 113
sub dx, up
mov bx, 76

duckL21:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL21

mov cx, 5
mov dx, 114
sub dx, up
mov bx, 76

duckL22:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duckL22

mov al, 00h

mov cx, 83
add cx, left
mov dx, 112
sub dx, up

int 10h

mov ax, 5

mov bx, 0
int 33h

cmp ax, 1

jne cont3

call scoring_gameA

cont3:

inc left
inc stop

call delay_game1

jmp move1

exit_up:

ret

ga_round endp

;=====================SCORING FUNCTION FOR GAME A=======================

scoring_gameA proc

mov ax, 4
int 33h

mov ax, dx
cmp ax, duck_ye
jb exit_score
cmp ax, duck_ys
ja exit_score

mov ax, cx
cmp ax, duck_xs
jb exit_score
cmp ax, duck_xe
ja exit_score

add score, 5

exit_score:
ret

scoring_gameA endp

;========================PRINTING ROUND NUMBER FUNCTION========================

print_round proc

lea dx, round
mov ah, 09h
int 21h

mov dx, r_num
mov ah, 02h
int 21h

mov dl, 13
mov ah, 02h
int 21h

ret

print_round endp

;=============================PRINTING THE NUMBERS FUNCTION====================

output1 proc

mov count, 0

continuepushing:

mov DX, 0
mov BX, 10
div BX
push DX
inc count
cmp AX, 0

jne continuepushing

continuepopping:

pop DX
add DX, 48
mov AH, 02h
int 21h
dec count
cmp count,0
jne continuepopping

stoppopping:

ret
output1 endp

;=========================BULLETS COUNT FUNCTION=============================

num_bullets proc

mov ah, 02h

mov dl, 5
mov dh, 45

int 10h

lea dx, bullet_prompt
mov ah, 09h
int 21h

mov ax, bullets
call output1

mov ah, 02h

mov dl, 0
mov dh, 0

int 10h

ret

num_bullets endp

;=========================GAME B ROUNDS===========================

gb_round proc

mov left, -50
mov stop, 0

call delay

move2:

mov duck_xs, 78
mov bx, duck_xs
add bx, left
add bx, left
add bx, 80
mov duck_xs, bx

mov duck_xe, 91
mov bx, duck_xe
add bx, left
add bx, left
add bx, 80
mov duck_xe, bx

cmp stop, 325
je exit_up_bridge2

call print_bg
call num_bullets

mov al, 0Fh
mov ah, 0Ch

mov cx, 9
mov dx, 127
sub dx, up
mov bx, 80

mov duck_ys, dx

duck2L1:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L1

mov cx, 11
mov dx, 126
sub dx, up
mov bx, 79

duck2L2:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L2

mov cx, 13
mov dx, 125
sub dx, up
mov bx, 78

duck2L3:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L3

mov cx, 13
mov dx, 124
sub dx, up
mov bx, 78

duck2L4:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L4

jmp cont4

exit_up_bridge2:

jmp exit_up2

cont4:

mov cx, 13
mov dx, 123
sub dx, up
mov bx, 78

duck2L5:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L5

mov cx, 13
mov dx, 122
sub dx, up
mov bx, 78

duck2L6:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L6

mov cx, 13
mov dx, 121
sub dx, up
mov bx, 78

duck2L7:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L7

mov cx, 11
mov dx, 120
sub dx, up
mov bx, 79

duck2L8:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L8

mov cx, 9
mov dx, 119
sub dx, up
mov bx, 80

duck2L9:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L9

mov cx, 7
mov dx, 118
sub dx, up
mov bx, 81

duck2L10:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L10

mov cx, 5
mov dx, 117
sub dx, up
mov bx, 82

duck2L11:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L11

mov cx, 7
mov dx, 116
sub dx, up
mov bx, 81

duck2L12:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L12

mov cx, 9
mov dx, 115
sub dx, up
mov bx, 80

duck2L13:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L13

mov cx, 9
mov dx, 114
sub dx, up
mov bx, 80

duck2L14:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L14

mov cx, 9
mov dx, 113
sub dx, up
mov bx, 80

duck2L15:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L15

mov cx, 9
mov dx, 112
sub dx, up
mov bx, 80

duck2L16:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L16

mov cx, 7
mov dx, 111
sub dx, up
mov bx, 81

duck2L17:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L17

mov cx, 5
mov dx, 110
sub dx, up
mov bx, 82

mov duck_ye, dx

duck2L18:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L18

mov cx, 19
mov dx, 118
sub dx, up
mov bx, 75

duck2L19:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L19

mov cx, 17
mov dx, 119
sub dx, up
mov bx, 76

duck2L20:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L20

mov al, 0Eh

mov cx, 5
mov dx, 113
sub dx, up
mov bx, 76

duck2L21:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L21

mov cx, 5
mov dx, 114
sub dx, up
mov bx, 76

duck2L22:

push cx

mov cx, bx
add cx, left
int 10h
inc bx

pop cx

loop duck2L22

mov al, 00h

mov cx, 83
add cx, left
mov dx, 112
sub dx, up

int 10h

mov ax, 5

mov bx, 0
int 33h

cmp ax, 1

jne cont5

call scoring_gameB

cont5:

inc left
inc stop

call delay_game2

jmp move2

exit_up2:

ret

gb_round endp

;=====================SCORING FUNCTION FOR GAME B=======================

scoring_gameB proc

cmp bullets, 0
jbe exit_score2

dec bullets

mov ax, 4
int 33h

mov ax, dx
cmp ax, duck_ye
jb exit_score2
cmp ax, duck_ys
ja exit_score2

mov ax, cx
cmp ax, duck_xs
jb exit_score2
cmp ax, duck_xe
ja exit_score2

add score, 10

exit_score2:
ret

scoring_gameB endp

;==============================OUTRO SCREEN=======================

outro_screen proc

mov ah, 02h

mov dl, 13
mov dh, 10

int 10h

lea dx, outro
mov ah, 09h
int 21h

mov ah, 02h

mov dx, 0000h
int 10h

ret

outro_screen endp

;============ READING SCORE FROM FILE =================

get_score proc

mov ah, 3dh
mov al, 0 
lea dx, fname
int 21h

mov bx, ax

lea dx, max_score
mov cx, 3
mov ah, 3fh 
int 21h

mov bx, 4
mov max_score[bx], '$'

mov ah, 3eh
int 21h

ret

get_score endp

end main
