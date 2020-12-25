/*4.(20��) �Ʒ��� ���� <sample data>�ڷḦ ����Ͽ� ������ ���� SAS ���α׷��� �ۼ��Ͽ���. ARRAY���� DO���� �̿��Ͽ� ������ ���� ����� �������� sas�ڵ带 �ۼ��Ͻÿ�.*/

data ex4;
input ht1-ht5 wt1-wt5;
ARRAY dens[5] dens1-dens5;
ARRAY ht[5] ht1-ht5;
ARRAY wt[5] wt1-wt5;

DO i = 1 TO 5;
dens[i]=wt[i] / ht[i]**2;
END;

KEEP dens1 dens2 dens3 dens4 dens5;

cards;
180 160 178 172 168 82  62  77  70  73
170 160 174 155 184 77  71  75  65  77
160 170 173 176 170 58  75  68  66  70
170 150 166 169 159 72  55  67  66  60
;

RUN;

PROC PRINT DATA=ex4;
RUN;

