/*1.(20��) [������ �ҷ�����, LABEL ����] SAS�����ͼ¸��� hw1_1, hw1_2���� �����ϰ�, infile���� �̿� �� ������ ����(hw1_1.csv, hw1_2.csv)�� �о� ������ output�� ���� ����� �������� SAS�ڵ��� �Ͻÿ�. */

DATA hw1_1;
LENGTH area $ 10;
INFILE "C:\SAS_DATA\hw1_1.csv" FIRSTOBS=3 DLM=',';
INPUT area$ man;
area=substr(area, 2, 8);
LABEL area="�ñ�����" man="����(��)";
RUN;

PROC PRINT DATA=hw1_1 label;
RUN;

DATA hw1_2;
LENGTH area $ 10;
INFILE "C:\SAS_DATA\hw1_2.csv" FIRSTOBS=3 DLM=',';
INPUT area$ woman;
area=substr(area, 2, 8);
LABEL area="�ñ�����" woman="����(��)";
RUN;

PROC PRINT DATA=hw1_2 label;
RUN;

/*2.(20��) [MERGE ��ɹ�] SAS �����ͼ¸��� hw1_3���� �����ϰ�, hw1_1�� hw1_2�� �� ������ ���� MERGE ��ɹ����� �����Ͽ� ������ output�� ���� SAS�ڵ带 �ۼ��Ͻÿ�.*/
PROC SORT DATA=hw1_1; BY area; RUN;
PROC SORT DATA=hw1_2; BY area; RUN;

DATA hw1_3;
	MERGE hw1_1 hw1_2; BY area;
RUN;

PROC PRINT DATA=hw1_3 label;
RUN;

/*3.(20��) [IF-THEN ��ɹ�] SAS �����ͼ¸��� hw1_4���� �����ϰ�, �Ʒ��� ���ο� ����(state)�� �߰� �����Ͻÿ�.*/
DATA hw1_4;
SET hw1_3;
if area="��û�ϵ�" then state="��û��";
else if area="��û����" then state="��û��";
else if area="����ϵ�" then state="����";
else if area="���󳲵�" then state="����";
else if area="���ϵ�" then state="���";
else if area="��󳲵�" then state="���";

LABEL state="����";

RUN;

PROC PRINT DATA=hw1_4 label;
RUN;
