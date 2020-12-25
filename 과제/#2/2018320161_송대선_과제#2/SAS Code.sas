DATA ex1;
INPUT @1 hiredate yymmdd8. @9 name $ 7.  @16 gender $ 1. 
	@17 age 2. @19 height 3. @22 weight 2. @24 salary comma5.;

CARDS;
98/09/30�� �̳�F23155442,440
01/09/03�� ����F21160521,940
95/08/06�� ȫ��M46172803,290
08/01/05ȫ ����M30180753,000
05/12/15�� ����F40165554,000
05/01/01�� ����M50177825,000
00/06/01�� ����F25170543,510
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
