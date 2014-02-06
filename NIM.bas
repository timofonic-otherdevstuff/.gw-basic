10 '***********************************************
20 '*                                             *
30 '*                    NIM                      *
40 '*                                             *
50 '*         7/9/77         Jaw. Way Lwem        *
60 '*                                             *
70 '***********************************************
80 '
90 '__________ VALUEABLES __________
100 'HEAD$(1~8)   W$   W    FIRST$  PASS$
110 'X  Y   R   ASPECT
120 'PILENUM  PILE$  PILE
130 'STONENUM(PILE)  STONEMAX   STONE$  XSTONE  STONE
140 'T  NUMBER  ORDER(0~3)
150 'I  J  K  E  F  I$
160 '_________ PREPARE __________
170 CLS : KEY OFF
180 SCREEN 2
190 WINDOW (0,0)-(720,347)
200 DEF SEG=0 : POKE 1047,(PEEK(1047) OR 64)
210 ON KEY(14) GOSUB 1650
220 KEY(14) ON
230 RANDOMIZE VAL(RIGHT$(TIME$,2))
240 DEFINT E,F,I,J,K,O,P,S,T,W
250 '__________ HEAD __________
260 HEAD$(1)=" NNNNN N     NNN N    IIIIIIIIIII I    MMMMM M     MMMMM M
270 HEAD$(2)=" NNN NN N    NNN N        III I        MMM MM M   MM MMM M
280 HEAD$(3)=" NNN  NN N   NNN N        III I        MMM MM M   MM MMM M
290 HEAD$(4)=" NNN N NN N  NNN N        III I        MMM  MM M MM  MMM M
300 HEAD$(5)=" NNN N  NN N NNN N        III I        MMM  MM M MM  MMM M
310 HEAD$(6)=" NNN N   NN  NNN N        III I        MMM M MM MM M MMM M
320 HEAD$(7)=" NNN N    NN NNN N        III I        MMM M  MMM M  MMM M
330 HEAD$(8)=" NNN N     NNNNN N    IIIIIIIIIII I    MMM M   M M   MMM M
340 FOR I=1 TO 8
350  LOCATE 1+I,10 : PRINT HEAD$(I)
360 NEXT
370 '
380 LOCATE 11,1 : PRINT "   { NIM } is an old game of taking stones away from just one pile in one time. It needs two players,so you can choose computer or another person to play with. The side who take the last one is the winner !
390 LOCATE 15,1 : PRINT"Press [C] or [P] for choise ...." : W$=INPUT$(1)
400 IF W$="C" THEN W$="COMPUTER" : W=1 : GOTO 430
410 IF W$="P" THEN W$="PERSON" : W=2 : GOTO 430
420 GOSUB 1570 : GOTO 390
430 LOCATE 15,54 : PRINT"PLAY WITH THE "W$ : SOUND 575,3
440 '
450 LOCATE 17,10 : INPUT "Press in the number of piles (2~20) ",PILENUM$
460 PILENUM=VAL(PILENUM$)
470 IF PILENUM<2 OR PILENUM>20 THEN GOSUB 1570 : GOTO 450
480 DIM STONENUM(PILENUM) : SOUND 100,3
490 '
500 FOR I=1 TO PILENUM
510  LOCATE 19,10
520  PRINT "Press in the number of stones in pile["I"] (1~15) ";
530  INPUT STONENUM$ : STONENUM(I)=VAL(STONENUM$)
540  IF STONENUM(I)<1 OR STONENUM(I)>15 THEN GOSUB 1570 : GOTO 510
550  IF STONENUM(I)>STONEMAX THEN STONEMAX=STONENUM(I)
560  SOUND 100,3
570 NEXT
580 DIM ORDER(STONEMAX-1)
590 '
600 LOCATE 21,10 : PRINT"Do you want to play it first ?(Y/N) ":FIRST$=INPUT$(1)
610 IF FIRST$<>"Y" AND FIRST$<>"N" THEN GOSUB 1570 : GOTO 600
620 '
630 IF W=1 THEN TURN$(0)="   You":TURN$(1)="Computer" ELSE TURN$(0)="Firstman":     TURN$(1)="Secondman"
640 IF FIRST$="N" THEN SWAP TURN$(0),TURN$(1)
650 LOCATE 23,10 : PRINT"Press any key to begin ...." : I$=INPUT$(1)
660 '__________ STAGE __________
670 PLAY "MLO3E2O3C32"
680 DEF FNCENTERX(PILE)=30+270/PILENUM*(2*PILE-1)
690 DEF FNCENTERY(STONE)=70+130/(STONEMAX)*(2*STONE-1)
700 DEF FNTWO(PILE,ORDER)=SGN(STONENUM(PILE) AND 2^ORDER)
710 '
720 CLS
730 R=200/PILENUM
740 FOR I=1 TO PILENUM
750  X=FNCENTERX(I)
760  LOCATE 22,X\9 : PRINT I
770  FOR J=1 TO STONENUM(I)
780   Y=FNCENTERY(J)
790   ASPECT=.5*PILENUM/STONEMAX
800   CIRCLE (X,Y),R,,,,ASPECT
810   PAINT (X,Y),CHR$(I+4)
820   SOUND 200+100*I,3
830  NEXT
840 NEXT
850 '
860 LINE (603,347)-(720,43),,B
870 LOCATE 2,72 : PRINT "TURN"
880 LOCATE 7,70 : PRINT "Pileth ?"
890 LOCATE 11,70 : PRINT "Stones ?"
900 LOCATE 17,69 : PRINT "["CHR$(25)" + Enter]"
910 LOCATE 18,72 : PRINT "STOP"
920 '__________ MAIN  LOOP __________
930 IF FIRST$="N" THEN 960
940 LOCATE 4,70 : PRINT SPC(9) : LOCATE 4,70 : PRINT TURN$(T) : T=1-T
950 GOSUB 990
960 LOCATE 4,70 : PRINT SPC(9) : LOCATE 4,70 : PRINT TURN$(T) : T=1-T
970 ON W GOSUB 1100,990
980 GOTO 940
990 '__________ MAN's  TURN _________
1000 LOCATE 8,73 : PRINT"  " : LOCATE 8,73 : INPUT "",PILE$
1010 PILE=VAL(PILE$)
1020 IF PILE>PILENUM OR PILE<1 THEN GOSUB 1570 : GOTO 1000
1030 IF STONENUM(PILE)=0 THEN GOSUB 1570 : GOTO 1000
1040 '
1050 LOCATE 12,73 : PRINT"  " : LOCATE 12,73 : INPUT "",STONE$
1060 STONE=VAL(STONE$)
1070 IF STONE>STONENUM(PILE) OR STONE<1 THEN GOSUB 1570 : GOTO 1050
1080 GOSUB 1420
1090 RETURN
1100 '__________ COMPUTER's  TURN __________
1110 PILE=0 : STONE=0
1120 FOR J=0 TO STONEMAX-1
1130  ORDER(J)=0
1140  FOR I=1 TO PILENUM
1150   ORDER(J)=(ORDER(J) XOR FNTWO(I,J))
1160  NEXT I
1170  IF ORDER(J)=1 THEN STONE=STONE+2^J
1180 NEXT J
1190 '
1200 FOR K=1 TO PILENUM
1210  XSTONE=STONENUM(K)-(STONENUM(K) XOR STONE)
1220  IF XSTONE>0 THEN STONE=XSTONE : PILE=K : K=PILENUM
1230 NEXT K
1240 '
1250 IF PILE<>0 THEN 1380
1260 XSTONE=1
1270 FOR I=1 TO PILENUM
1280  IF STONENUM(I)=<XSTONE THEN 1340
1290  PASS$="N"
1300  FOR J=1 TO PILENUM
1310   IF STONENUM(J)=STONENUM(I)-XSTONE THEN PASS$="Y" : J=PILENUM
1320  NEXT
1330  IF PASS$="N" THEN PILE=I : STONE=XSTONE : I=PILENUM
1340 NEXT
1350 IF PILE=0 AND XSTONE>STONEMAX THEN XSTONE=XSTONE+1 : GOTO 1270
1360 '
1370 IF PILE=0 THEN XPILE=INT(RND*PILENUM)+1 :                                       IF STONENUM(XPILE)>0 THEN PILE=XPILE : STONE=1 ELSE 1370
1380 '
1390 LOCATE 8,72 : PRINT PILE : LOCATE 12,72 : PRINT STONE
1400 GOSUB 1420
1410 RETURN
1420 '__________ TAKE THEM AWAY __________
1430 FOR I=STONENUM(PILE) TO STONENUM(PILE)-STONE+1 STEP -1
1440  X=FNCENTERX(PILE) : Y=FNCENTERY(I)
1450  LINE (X-R-1,Y+R*ASPECT+1)-(X+R+1,Y-R*ASPECT-1),0,BF
1460  PLAY "C32D32E64F64G64"
1470 NEXT I
1480 STONENUM(PILE)=STONENUM(PILE)-STONE
1490 '
1500 NUMBER=0
1510 FOR J=1 TO PILENUM
1520  NUMBER=NUMBER+STONENUM(J)
1530 NEXT
1540 IF NUMBER>0 THEN RETURN ELSE RETURN 1550
1550 LOCATE 1,1 : PRINT TURN$(1-T)" WIN !!" : PLAY "O1MSL8GGGE2FFFD2" :              RETURN 1560
1560 GOSUB 1650
1570 '__________ ERROR __________
1580 FOR E=1 TO 3
1590  LOCATE 23,67 : PRINT SPC(13)
1600  FOR F=1 TO 100 : NEXT
1610  LOCATE 23,67 : PRINT"RE-press in !"
1620  SOUND 800,2 : SOUND 32767,1
1630 NEXT
1640 RETURN
1650 '__________ STOP __________
1660 CLS
1670 FOR I=1 TO 8
1680  LOCATE 1+I,10 : PRINT HEAD$(I)
1690 NEXT
1700 '
1710 LOCATE 15,23 : PRINT"Do you want to play it again ?(Y/N)  " : A$=INPUT$(1)
1720 IF A$="N" THEN 1750
1730 ERASE STONENUM,ORDER : LOCATE 15,23 : PRINT SPC(40) : T=0 : STONEMAX=0 :        RETURN 380
1740 '
1750 KEY(14) OFF : KEY ON
1760 END
