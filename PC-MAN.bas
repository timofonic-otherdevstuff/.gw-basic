10 CLS
20 DEF FNMX(R)=R+31:DEF FNMY(R)=R+7
30 DEF FNX(R)=(R+31)*9-9:DEF FNY(R)=(R+7)*14-14
40 KEY OFF:ON KEY(11) GOSUB 550:ON KEY(12) GOSUB 560                                      :ON KEY(13) GOSUB 570:ON KEY(14) GOSUB 580
50 DIM P%(16),M%(16),G%(16),O%(16),L(17,12),E(17,12)
60 LINE(270,84)-(432,266),,B
70 DRAW"B M279,98 R144 D154 L144 U154 D14 B R9R9D28R9D14L9D14L9U56 B D70R9D14R9         D14L9D28L9U56 B R18R9U14L9D14R9 B D14R9U42L9U14R36D14L18D42R18D14L36U14         B D28L9 D14 R45U14L45 B U112D14R45U14L45 B R54R18D28L18U28 B D42"
80 DRAW"D14L18D14R18D14R18U14R18U14L18U14L18 B D56D28R18U28L18 B R45R9U70L9D70     B D14D14L18U42R9D28R9 B U98U14L18D42R9U28R9 B R9R9U28L9D28 B D98D28R9U28 L9"
90 FOR I1=1 TO 15:READ X1,Y1:PAINT(X1,Y1):NEXT
100 LOCATE 1,1:PRINT CHR$(249)
110 GET(0,0)-(9,14),P%
120 LOCATE 1,3:PRINT CHR$(228)
130 GET(18,0)-(27,14),M%
140 LOCATE 1,5:PRINT CHR$(1)
150 GET(36,0)-(45,14),G%
160 GET(11,2)-(16,12),O%
170 X=5:Y=1:A=14:B=1:TIME=1:T=0:S=2
180 FOR I=0 TO 17
190 FOR J=0 TO 12
200 L(I,J)=POINT(FNX(I)+1,FNY(J)+1)
210 IF L(I,J)=1 THEN 240
220 PUT(FNX(I),FNY(J)),P%,OR
230 E(I,J)=1
240 NEXT J,I
250 '
260 SA=SGN(X-A):SB=SGN(Y-B)
270 IF SA=0 AND SB=0 THEN 590
280 AN=A+SA:BN=B+SB
290 IF L(AN,B)=0 XOR L(A,BN)=0 THEN IF L(AN,B)=0 THEN GOSUB 650 ELSE GOSUB 720
300 IF L(AN,B)=0 AND L(A,BN)=0 THEN IF (-1)^A=1 THEN GOSUB 690 ELSE GOSUB 760
310 IF L(AN,B)=1 AND L(A,BN)=1 THEN GOSUB 790
320 IF TIME=1 THEN 340
330 PUT(FNX(A0),FNY(B0)),G%
340 PUT(FNX(A),FNY(B)),G%
350 A0=A:B0=B
360 FOR K=1 TO S
370 KEY(11) ON:KEY(12) ON:KEY(13) ON:KEY(14) ON
380 KEY(11) STOP:KEY(12) STOP:KEY(13) STOP:KEY(14) STOP
390 X=X+WX:Y=Y+WY
400 IF X<0 OR X>17 OR Y<0 OR Y>12 THEN X=X0:Y=Y0
410 IF L(X,Y)=1 THEN X=X0:Y=Y0
420 IF TIME=1 THEN TIME=0:GOTO 450
430 PUT(FNX(X0),FNY(Y0)),M%
440 IF E(X0,Y0)=0 THEN PUT(FNX(X0)+2,FNY(Y0)+2),O%,PSET
450 PUT(FNX(X),FNY(Y)),M%
460 IF E(X,Y)=1 THEN 510
470 X0=X:Y0=Y
480 NEXT K
490 GOTO 260
500 '
510 E(X,Y)=0:T=T+1
520 IF T=109 THEN S=1:X=1:Y=11:A=15:B=1:TIME=1:GOTO 180
530 LOCATE 5,55:PRINT T:SOUND 575,1
540 GOTO 470
550 KEY(12) STOP:KEY(13) STOP:KEY(14) STOP:WX=0:WY=-1:RETURN
560 KEY(11) STOP:KEY(13) STOP:KEY(14) STOP:WX=-1:WY=0:RETURN
570 KEY(11) STOP:KEY(12) STOP:KEY(14) STOP:WX=1:WY=0:RETURN
580 KEY(11) STOP:KEY(12) STOP:KEY(13) STOP:WX=0:WY=1:RETURN
590 LOCATE FNMY(B),FNMX(A):PRINT CHR$(15)
600 PLAY"L32O3CC+DD+EFF+GG+AA+BO4CC+DD+EFF+GG+AA+B"
610 LOCATE 2,1:INPUT"(Y/N)";D$
620 IF D$="Y" OR D$="y" THEN 170
630 END
640 DATA 290,123,330,123,370,123,400,123,420,123,310,170,330,170,370,170,                410,170,430,170,290,230,330,230,370,230,400,230,420,230
650 IF SA<>0 THEN 700
660 IF L(A-1,B)=0 XOR L(A+1,B)=0 THEN IF L(A-1,B)=0 THEN A=A-1 ELSE A=A+1
670 IF L(A-1,B)=0 AND L(A+1,B)=0 THEN IF (-1)^A=1 THEN A=A-1 ELSE A=A+1
680 RETURN
690 IF SA=0 THEN B=BN
700 A=AN
710 RETURN
720 IF SB<>0 THEN 770
730 IF L(A,B-1)=0 XOR L(A,B+1)=0 THEN IF L(A,B-1)=0 THEN B=B-1 ELSE B=B+1
740 IF L(A,B-1)=0 AND L(A,B+1)=0 THEN IF (-1)^A=1 THEN B=B-1 ELSE B=B+1
750 RETURN
760 IF SB=0 THEN A=AN
770 B=BN
780 RETURN
790 IF L(A-2*SA,BN)=0 THEN A=A-2*SA:B=BN:RETURN
800 IF L(A-SA,BN)=0 THEN A=A-SA:B=BN:RETURN
810 IF L(AN,B-2*SB)=0 THEN A=AN:B=B-2*SB:RETURN
820 IF L(AN,B-SB)=0 THEN A=AN:B=B-SB:RETURN
