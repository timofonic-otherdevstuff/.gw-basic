10 CLS
20 V=VAL(MID$(TIME$,4,2))*VAL(RIGHT$(TIME$,2))
30 RANDOMIZE V
40 T=0 : AN=0
50 INPUT"How many digits do you want to guess (>0)";N
60 IF N<=0 THEN 50
70 DIM N(N),M(N)
80 FOR I=1 TO N
90   N(I)=INT(RND*10)
100   FOR J=SGN(I-1) TO I-1 : IF N(I)=N(J) THEN 90 : NEXT J
110 NEXT I
120 '__________ BEGIN __________
130 PRINT
140 ROW=4:COL=1
150 PRINT "Strike numbers(";N;"different digits) ,or 0 for help"
160 LOCATE ROW,COL : INPUT M : M$=MID$(STR$(M),2)
170 IF M=0 THEN 440
180 IF LEN(M$)<>N THEN BEEP:SOUND 32767,1:BEEP : GOTO 160
190 FOR I=1 TO N
200   M(I)=VAL(MID$(M$,I,1))
210   FOR J=SGN(I-1) TO I-1
220     IF M(J)=M(I) THEN 150
230   NEXT J
240 NEXT I
250 A=0:B=0:T=T+1
260 FOR I=1 TO N
270   FOR J=1 TO N
280     IF N(I)=M(J) THEN IF I=J THEN A=A+1 ELSE B=B+1
290   NEXT J
300 NEXT I
310 LOCATE CSRLIN-1,COL+10
320 PRINT A;"A";B;"B" : PRINT
330 IF A=N THEN 380
340 ROW=((ROW-2) MOD 20)+4
350 COL=INT(T/10)*20+1
360 GOTO 160
370 '__________ END __________
380 PRINT T;"TIMES"
390 IF T=1 THEN PRINT"IT'S GOOD LUCK!"
400 PRINT
410 LOCATE 23,1:PRINT "DO YOU WANT TO PLAY AGAIN(Y/N)?" : D$=INPUT$(1)
420 IF D$="Y" OR D$="y" THEN ERASE N,M:GOTO 10 ELSE END
430 '__________ HELP __________
440 LOCATE 23,1:PRINT "Do you want to see the answer(Y/N)?" : S$=INPUT$(1)
450 IF S$<>"Y" AND S$<>"y" THEN 160
460 FOR I=1 TO N : AN=AN+N(I)*10^(N-I) : NEXT I
470 PRINT"ANSWER =";AN : GOTO 400
