10 '*************************
20 '*                       *
30 '*    REMEMBER   J.W.L   *
40 '*                       *
50 '*************************
60 RANDOMIZE VAL(RIGHT$(TIME$,2))
70 INPUT "?IO,?JO  ",IO,JO
80 OPTION BASE 1
90 DIM A$(IO*JO),A(IO*JO),PX(IO,JO),PY(IO,JO),P$(IO,JO)
100 FOR F=1 TO IO*JO STEP 2
110 READ A$(F):A$(F+1)=A$(F)
120 NEXT F
130 S(1)=0:S(2)=0
140 FOR K0=1 TO IO*JO:A(K0)=0:NEXT
150 CLS
160 XS=740\IO:XO=(XS-30)\2:YS=300\JO:YO=(YS-15)\2
170 FOR J=1 TO JO
180 FOR I=1 TO IO
190 PX(I,J)=XO+XS*(I-1):PY(I,J)=YO+YS*(J-1)
200 LINE(PX(I,J)-XO,PY(I,J)-YO)-(PX(I,J)+XO,PY(I,J)+YO),,B
210 IF PY(1,1)\14=0 THEN LOCATE PY(I,J)\14+1,PX(I,J)\9:PRINT J;I:GOTO 230
220 LOCATE PY(I,J)\14,PX(I,J)\9:PRINT J;I
230 R=INT(RND*IO*JO)+1:IF A(R)=1 THEN 230 ELSE A(R)=1
240 P$(I,J)=A$(R)
250 NEXT I,J
260 '
270 FOR MAN=1 TO 2
280 LOCATE 22,1:INPUT "Two Blocks !!-!!  ",S$
290 B(1)=VAL(LEFT$(S$,2)):B(2)=VAL(RIGHT$(S$,2))
300 FOR K=1 TO 2
310 J(K)=B(K)\10:I(K)=B(K)-J(K)*10
320 IF J(K)<1 OR J(K)>JO OR I(K)<1 OR I(K)>IO THEN 280
330 DRAW"C1;BM=PX(I(K),J(K));,=PY(I(K),J(K));XP$(I(K),J(K));"
340 NEXT K
350 IF P$(I(1),J(1))=P$(I(2),J(2)) THEN 450
360 FOR K1=1 TO 15
370 FOR H=1 TO 2
380 DRAW"BM=PX(I(H),J(H));,=PY(I(H),J(H));C1;XP$(I(H),J(H));"
390 DRAW"BM=PX(I(H),J(H));,=PY(I(H),J(H));C0;XP$(I(H),J(H));"
400 SOUND 575,.5
410 NEXT H,K1
420 NEXT MAN
430 GOTO 270
440 '
450 S(MAN)=S(MAN)+1
460 LOCATE 23,35:PRINT "(1)-";S(1);SPC(5);"(2)-";S(2)
470 IF S(1)+S(2)=IO*JO/2 THEN 480 ELSE 420
480 LOCATE 22,65:INPUT "again(Y/N)";D$
490 IF D$="Y" OR D$="y" THEN ERASE A,A$,PX,PY,P$:GOTO 70
500 END
510 DATA F15L30E15,D15L20U15R20,R20D5L40U5R20,F12L25F12U25,BD5NF10NH10NE10NG10,     "M+7,17M-17,-12M+20,0M-17,12M+7,-17","BD10M+20,-10M-20,-10M-20,10M+20,10",      G10L10E20F20L10H10,NL10D20R10BU10NU10L20D10,F10G10L10H10E10R10
