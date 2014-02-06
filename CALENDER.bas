10 '**********************************
20 '*                                *
30 '*            CALENDER            *
40 '*                                *
50 '*              J.W.L             *
60 '*                                *
70 '**********************************
80 '
90 '=========  MAIN  PROGRAM  ======================
100 GOSUB 430                   'prepare environment
110 GOSUB 510                   'ask to input
120 GOSUB 710                   'calculate
130 GOSUB 820                   'print out
140 END
150 '================================================
160 '
170 '========= SUB  yeardays ===========
180 IF (YEAR MOD 4)=0 THEN IF (YEAR MOD 100)=0 THEN IF (YEAR MOD 400)=0 THEN        YEARDAYS=366 ELSE YEARDAYS=365 ELSE YEARDAYS=366 ELSE YEARDAYS=365
190 RETURN
200 '===================================
210 '
220 '========== SUB  firstday ===========
230 DIRECTION=1
240 NOWYEAR=2000
250 FIRSTDAY=6
260 IF YEARNUM<0 THEN NOWYEAR=0 : FIRSTDAY=1
270 IF YEARNUM=NOWYEAR THEN RETURN
280 IF YEARNUM<NOWYEAR THEN SWAP NOWYEAR,YEARNUM : DIRECTION=-1
290 FOR YEAR=NOWYEAR TO YEARNUM-1
300   GOSUB 170                     'yeardays
310   YEARDAYS=DIRECTION*YEARDAYS MOD 7
320   FIRSTDAY=FIRSTDAY+YEARDAYS
330 NEXT
340 FIRSTDAY=FIRSTDAY MOD 7
350 IF FIRSTDAY<0 THEN FIRSTDAY=FIRSTDAY+7
360 RETURN
370 '===================================
380 '
390 '========  SUB  errmonth  ==========
400 IF LEN(ERRMONTH$)<>LEN(STR$(VAL(ERRMONTH$)))-1 THEN BEEP : RETURN 550
410 RETURN
420 '===================================
430 '
440 DEFINT A-Z
450 DIM MONTHDAY(12),MONTHNAME$(12)
460 FOR MONTH=1 TO 12
470   READ MONTHDAY(MONTH),MONTHNAME$(MONTH)
480 NEXT
490 DATA 31,January,28,February,31,March,30,April,31,May,30,June,                        31,July,31,August,30,September,31,October,30,Novenber,31,Decenber
500 RETURN
510 '
520 CLS
530 KEY OFF
540 INPUT "Which year ";YEARNUM
550 PRINT
560 INPUT "Press in the  MONTHES  between ...",MONTH$
570 HYPHEN=INSTR(MONTH$,"-")
580  BEGINMONTH=VAL(MONTH$)
590  ENDMONTH=BEGINMONTH
600  IF HYPHEN=0 THEN ERRMONTH$=MONTH$ : GOSUB 390 : GOTO 680
610  '
620  ERRMONTH$=LEFT$(MONTH$,HYPHEN-1)
630  GOSUB 390                           'errmonth
640  BEGINMONTH=VAL(ERRMONTH$)
650  ERRMONTH$=MID$(MONTH$,HYPHEN+1)
660  GOSUB 390                           'errmonth
670  ENDMONTH=VAL(ERRMONTH$)
680 IF BEGINMONTH<>INT(BEGINMONTH) OR ENDMONTH<>INT(ENDMONTH) THEN 550
690 IF BEGINMONTH<1 OR ENDMONTH>12 OR BEGINMONTH>ENDMONTH THEN 550
700 RETURN
710 '
720 CLS
730 IF BEGINMONTH<>ENDMONTH THEN LOCATE 1,33
740 PRINT YEARNUM
750 PRINT
760 YEAR=YEARNUM
770 GOSUB 170                'yeardays
780 IF YEARDAYS=365 THEN MONTHDAY(2)=28 ELSE MONTHDAY(2)=29
790 GOSUB 220                'firstday
800 PLACE=1
810 RETURN
820 '
830 FOR MONTH=1 TO 12
840   FIRSTDAY=(FIRSTDAY+MONTHDAY(MONTH-1)) MOD 7
850   IF MONTH<BEGINMONTH OR MONTH>ENDMONTH THEN 980
860   LOCATE CSRLIN-9*SGN(PLACE-1),1
870   LOCATE CSRLIN,PLACE : PRINT CHR$(177)"  "MONTHNAME$(MONTH)"  "CHR$(177)
880   PRINT
890   LOCATE CSRLIN,PLACE : PRINT "SUN  MON  TUE  WED  THU  FRI  SAT"
900   LOCATE CSRLIN,PLACE : PRINT SPC(FIRSTDAY*5);
910   FOR DAY=1 TO MONTHDAY(MONTH)
920     PRINT USING "##   ";DAY;
930     IF (DAY+FIRSTDAY) MOD 7 =0 THEN PRINT CHR$(13); : LOCATE CSRLIN,PLACE
940   NEXT
950   PLACE=41-PLACE
960   PRINT
970   PRINT
980 NEXT
990 RETURN
1000 'end
