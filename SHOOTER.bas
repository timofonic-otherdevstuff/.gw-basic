10 '************************
20 '*                      *
30 '*         SHOOTER      *
40 '*                      *
50 '*          J.W.L       *
60 '*                      *
70 '************************
80 CLEAR
90 DIM X(5),X0(5),Y(5),Y0(5),A$(5)
100 ON KEY(11) GOSUB 490
110 ON KEY(14) GOSUB 560
120 ON KEY(12) GOSUB 630
130 A$(1)=CHR$(3):A$(2)=CHR$(4):A$(3)=CHR$(5):A$(4)=CHR$(6):A$(5)=CHR$(42)
140 V$=RIGHT$(TIME$,2)
150 V=VAL(V$)
160 RANDOMIZE V
170 CLS
180 LOCATE 7,21
190 PRINT"########################################"
200 FOR I=8 TO 15
210 LOCATE I,21:PRINT"#";SPC(38);"#"
220 NEXT I
230 LOCATE 16,21
240 PRINT"########################################"
250 LOCATE 14,45:PRINT""
260 Q=14
270 FOR W=1 TO 5
280 X(W)=INT(RND*60):Y(W)=INT(RND*16)
290 IF X(W)<22 OR Y(W)<8 THEN 280
300 M(W)=(-1)^X(W):N(W)=(-1)^Y(W)
310 NEXT W
320 '
330 FOR Z=1 TO 5
340 H=FRE("")
350 KEY(11) ON:KEY(12) ON:KEY(13) ON
360 KEY(11) STOP:KEY(12) STOP:KEY(13) STOP
370 ERASE X0,Y0
380 X0(Z)=X(Z):Y0(Z)=Y(Z)
390 X(Z)=X(Z)+M(Z)*2:Y(Z)=Y(Z)+N(Z)*2
400 LOCATE Y(Z),X(Z):PRINT A$(Z)
410 LOCATE Y0(Z),X0(Z):PRINT" "
420 IF Y(Z)>15 OR Y(Z)<6 THEN N(Z)=-N(Z):SOUND 261.63,3
430 IF X(Z)>20 OR X(Z)<59 THEN M(Z)=-M(Z):SOUND 261.63,3
440 IF Y0(Z)=16 OR Y0(Z)=7 OR X0(Z)=21 OR X0(Z)=60 THEN LOCATE Y0(Z),X0(Z):PRINT"#"
450 IF X(Z)=45 AND Y(Z)=Q THEN LOCATE Q,45:PRINT CHR$(15):SOUND 1046.5,4:GOTO 740
460 NEXT Z
470 GOTO 330
480 '
490 Q0=Q:Q=Q-1
500 IF Q<7 THEN 540
510 LOCATE Q,45:PRINT""
520 LOCATE Q0,45:PRINT" "
530 IF Q0=16 THEN LOCATE 19,30:PRINT"#"
540 RETURN 450
550 '
560 Q0=Q:Q=Q+1
570 IF Q>16 THEN 610
580 LOCATE Q,45:PRINT""
590 LOCATE Q0,45:PRINT" "
600 IF Q0=7 THEN LOCATE 7,45:PRINT"#"
610 RETURN 450
620 '
630 XO=45:YO=Q
640 FOR E=1 TO 23
650 XO=XO-1:XO0=XO
660 LOCATE YO,XO:PRINT CHR$(27)
670 LOCATE YO,XO0:PRINT" "
680 FOR F=1 TO 5
690 IF XO=X(F) AND Q=Y(F) THEN LOCATE Y(F),X(F):PRINT CHR$(15):T=T+1:GOTO 330
700 NEXT F
710 NEXT E
720 RETURN 450
730 '
740 PLAY "O4 ML L32 BA#AG#GF#FED#DC#C O3 BA#AG#GF#FED#DC#C P8 O4 C16"
750 LOCATE 10,30:PRINT"You have been killed!!"
760 LOCATE 12,36:PRINT T;"TIMES"
770 LOCATE 14,32:PRINT"press F2 to exist"
780 LOCATE 1,1
790 END
