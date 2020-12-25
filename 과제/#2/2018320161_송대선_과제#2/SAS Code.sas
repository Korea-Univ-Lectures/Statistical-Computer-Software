DATA ex1;
INPUT @1 hiredate yymmdd8. @9 name $ 7.  @16 gender $ 1. 
	@17 age 2. @19 height 3. @22 weight 2. @24 salary comma5.;

CARDS;
98/09/30박 미나F23155442,440
01/09/03강 유정F21160521,940
95/08/06이 홍구M46172803,290
08/01/05홍 정기M30180753,000
05/12/15김 민희F40165554,000
05/01/01유 태종M50177825,000
00/06/01최 원주F25170543,510
;
RUN;

PROC PRINT DATA=ex1;
RUN;

DATA ex2;
SET ex1;
LENGTH new_name $ 10;
f_name=substr(name,1,2);
m_name=substr(name,4,7);

new_name=CATX(" ",m_name,f_name);


RUN;

DATA ex3;
SET ex2;
KEEP name new_name;
RUN;

PROC PRINT DATA=ex3;
RUN;
