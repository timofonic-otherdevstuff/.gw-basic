10 CLEAR
20 KEY OFF
30 INPUT "A*X+B*Y+C*Z+D*X+E*Y+F*Z+G=0";A,B,C,D,E,F,G
40 INPUT "BX,EX,SX";BX,EX,SX
50 INPUT "BY,EY,SY";BY,EY,SY
60 INPUT "BZ,EZ,SZ";BZ,EZ,SZ
70 INPUT "HIGH";H
80 CLS
90 LINE (360,173)-(720,173):LINE (360,173)-(360,0):LINE (360,173)-(97,347)
100 DEF FNP(XP,YP,ZP)=A*XP*XP+B*YP*YP+C*ZP*ZP+D*XP+E*YP+F*ZP+G
110 FOR ZP=BZ TO EZ STEP SZ
120 W=0
130  FOR YP=BY TO EY STEP SY
140  FOR XP=BX TO EX STEP SX
150   IF ABS(FNP(XP,YP,ZP))>1 THEN 230
160   XP=XP/1.5
170    Y0=YP-XP:Z0=ZP-XP
180    Y=360+Y0*H*1.52:Z=173-Z0*H
190    IF Y<0 OR Y>720 OR Z<0 OR Z>347 THEN 230
200    IF W=0 THEN W=1:GOTO 220
210    LINE (YO,ZO)-(Y,Z)
220    YO=Y:ZO=Z
230   NEXT XP
240  NEXT YP
250 NEXT ZP
260 INPUT "1-ALTER   2-CHANGE   3-END (1/2/3)";Q
270 ON Q GOTO 50,10,280
280 END
