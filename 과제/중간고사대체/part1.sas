/*1.(20점) [데이터 불러오기, LABEL 문장] SAS데이터셋명을 hw1_1, hw1_2으로 지정하고, infile문을 이용 두 데이터 파일(hw1_1.csv, hw1_2.csv)을 읽어 다음의 output과 같은 결과가 나오도록 SAS코딩을 하시오. */

DATA hw1_1;
LENGTH area $ 10;
INFILE "C:\SAS_DATA\hw1_1.csv" FIRSTOBS=3 DLM=',';
INPUT area$ man;
area=substr(area, 2, 8);
LABEL area="시군구별" man="남자(명)";
RUN;

PROC PRINT DATA=hw1_1 label;
RUN;

DATA hw1_2;
LENGTH area $ 10;
INFILE "C:\SAS_DATA\hw1_2.csv" FIRSTOBS=3 DLM=',';
INPUT area$ woman;
area=substr(area, 2, 8);
LABEL area="시군구별" woman="여자(명)";
RUN;

PROC PRINT DATA=hw1_2 label;
RUN;

/*2.(20점) [MERGE 명령문] SAS 데이터셋명을 hw1_3으로 지정하고, hw1_1과 hw1_2의 두 데이터 셋을 MERGE 명령문으로 결합하여 다음의 output과 같은 SAS코드를 작성하시오.*/
PROC SORT DATA=hw1_1; BY area; RUN;
PROC SORT DATA=hw1_2; BY area; RUN;

DATA hw1_3;
	MERGE hw1_1 hw1_2; BY area;
RUN;

PROC PRINT DATA=hw1_3 label;
RUN;

/*3.(20점) [IF-THEN 명령문] SAS 데이터셋명을 hw1_4으로 지정하고, 아래의 새로운 변수(state)를 추가 생성하시오.*/
DATA hw1_4;
SET hw1_3;
if area="충청북도" then state="충청도";
else if area="충청남도" then state="충청도";
else if area="전라북도" then state="전라도";
else if area="전라남도" then state="전라도";
else if area="경상북도" then state="경상도";
else if area="경상남도" then state="경상도";

LABEL state="지명";

RUN;

PROC PRINT DATA=hw1_4 label;
RUN;
