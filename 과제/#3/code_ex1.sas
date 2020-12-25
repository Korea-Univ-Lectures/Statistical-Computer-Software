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

/*1.(1) MEANS 프로시저를 이용하여 
  변수 mileage와 reliable에 대한 평균, 표준편차, 변동계수를 SAS데이터셋에 저장하고, 
  그 내용을 살펴보아라(OUTPUT 명령문과 OUT=옵션 사용).*/

PROC MEANS DATA=ex1 NOPRINT;
CLASS size;
VAR mileage reliable;
OUTPUT out=result1_mean mean=;
RUN;

PROC MEANS DATA=ex1 NOPRINT;
CLASS size;
VAR mileage reliable;
OUTPUT out=result1_std std=;
RUN;

PROC MEANS DATA=ex1 CV NOPRINT;
CLASS size;
VAR mileage reliable;
OUTPUT out=result1_cv cv=;
RUN;

/*1.(2) UNIVARIATE 프로시저를 이용하여 mileage에 대한 
  히스토그램(histogram). 확률그림(probplot), 분위수-분위수그림(qqplot)을 출력하여라.*/
 
PROC UNIVARIATE DATA=ex1 normal plot;
var mileage;
histogram mileage/normal;
probplot mileage/normal;
qqplot mileage/exponential;
RUN;
