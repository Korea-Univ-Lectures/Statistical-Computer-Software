DATA ex5;
INFILE CARDS FIRSTOBS=2;
INPUT id$ amount date  mmddyy10.;
FORMAT date date7.;

CARDS;
id  amount date
a   1000   03/06/00
a    375   03/15/00
a    900   07/15/00
b    500   03/01/00
b    400   03/15/00
a    550   03/01/00
b   1050   06/01/00
b    330   07/15/00
a   1500   06/01/00
a    800   06/30/00
b    575   06/30/00
;
RUN;


PROC SORT DATA=ex5; BY id  DESENDING date; RUN;

DATA result;
SET ex5;
BY id;
if first.id then OUTPUT result;
RUN;

PROC PRINT DATA=result;
RUN;
