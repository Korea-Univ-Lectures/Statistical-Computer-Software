DATA ex1;
LENGTH size $ 10 manufact $ 10 model $ 10;
INFILE "C:\carexample3.txt" MISSOVER;
INPUT id size $ manufact $ model $ mileage reliable index;
RUN;

PROC PRINT DATA=ex1;
RUN;

/*
DATA ex2;
SET ex1;
OPTIONS firstobs = 2;
RUN;

PROC PRINT DATA=ex2;
RUN;*/
