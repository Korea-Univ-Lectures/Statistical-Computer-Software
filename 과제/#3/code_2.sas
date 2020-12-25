DATA ex1;
LENGTH size $ 10 manufact $ 10 model $ 10;
INPUT id size $ manufact $ model $ mileage reliable index;
CARDS;
1 small chevrolet geoprizm 33      5        4
2 small honda     civic    29      5        4
3 small toyota    corolla  30      5        4
4 small ford      escort   27      3        3
5 small dodge     colt     34      .        .
6 compact ford    tempo    24      1        3
7 compact chrysler lebaron 23      3        3      
8 compact buick    skylark   21    3        3
9 compact plymouth acclaim   24    3        3
10 compact chevrolet corsica 25    2        3
11 compact  pontiac sunvird  24    1        3
12 mid-sized  toyota camry   24    5        4
13 mid-sized honda accord    26    5        4 
14 mid-sized ford  taurus    20    3        3
;
RUN;

PROC PRINT DATA=ex1;
RUN;

PROC SORT DATA=ex1; BY size manufact model; RUN; 

PROC MEANS DATA=ex1 NOPRINT;
by size manufact model;
VAR mileage reliable weight;
OUTPUT out=result3 mean=;
RUN;
