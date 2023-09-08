select * from book;

--------------------------------------------------------------------------------------------------------------------------------------------
<INSERT>
insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+10000, 'MBTI Form M �ڰ�ä����', 6800, '���Ÿ', '�˻��ڷ�', '���Ÿ', 'Y', 'MBTI�� Form M �ڰ�ä������ �˻���, �����, ���������� ��ü������ ����',
'MBTI�� Form M �ڰ�ä������ �˻���, �����, ���������� ��ü������ �����Ǿ� ������ �˻縦 �ǽ��� �Ŀ� ����� �ٷ� Ȯ���� �� �ִ� �ڰ�ä���� �˻��Դϴ�.
MBTI�� Form M �ڰ�ä������ �� 93�����̸� �۷ι� ���ؿ� ���߾� ���� �ؼ� ������ �ּ�ȭ�� �����Դϴ�.');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval, 'MBTI Form M �����л��� �˻���, ��������(�ڰ�ä����)', 6800, '���Ÿ', '�˻��ڷ�', '���Ÿ', 'Y', 'MBTI�� Form M �����л����� �˻���, �����, ���������� ��ü������ ����',
'MMBTI�� Form M �����л����� �˻���, �����, ���������� ��ü������ �����Ǿ� ������, �˻縦 �ǽ��� �Ŀ� ����� �ٷ� Ȯ���� �� �ִ� �ڰ�ä���� �˻��Դϴ�.
MBTI�� Form M�� �� 93�����̸� ���� ���� ���, ä�� ���, ô���� �߰������� �����ϴ� ��� ���� �����Ǿ� �������� ��������(best-fit type)�� ã�ư� �� �ֵ��� �� �ݴϴ�.
MBTI�� Form M �����л����� �б���Ȱ�� ������ ���߾� ���������� ������ ������ �ѱ��� �Ϲݿ�� ���̰� �ֽ��ϴ�.');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+10000, 'MBTI Form M �б���ü�� �����, ��������(�ڵ�ä����)_�����л���', 6800, '���Ÿ', '�˻��ڷ�', '���Ÿ', 'Y',
'MBTI Form M �����л��� �ڵ�ä�� �����, �������Ϸ� MBTI Form M �б���ü�� �˻���(�ڵ�ä����)�� �Բ� ���',
'MBTI Form M �����л��� �ڵ�ä�� �����, �������Ϸ� MBTI Form M �б���ü�� �˻���(�ڵ�ä����)�� �Բ� ����� �� �ֽ��ϴ�');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+10000, 'MBTI Form M �б���ü�� �����, ��������(�ڵ�ä����)_���л���', 6000, '���Ÿ', '�˻��ڷ�', '���Ÿ', 'Y',
'MBTI Form M ���л��� �ڵ�ä�� �����, �������Ϸ� MBTI Form M �б���ü�� �˻���(�ڵ�ä����)�� �Բ� ���',
'MBTI Form M ���л��� �ڵ�ä�� �����, �������Ϸ� MBTI Form M �б���ü�� �˻���(�ڵ�ä����)�� �Բ� ����� �� �ֽ��ϴ�');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+20000, '���������� ��', 13000, '���Ÿ', '����', '���Ÿ', 'Y',
'MBTI ���� ����',
'MBTI�� ���� ������ε� Ȱ�������, ���� �ٸ� ����� ���� ���ε��� �Բ� �� ���ϴ� ���� ����� �� ���� ���� ���մϴ�. �� å�� ������ ���ΰ� ������ ������ �� ���������� ���������� ���� ��Ȳ�� � ������ �ִ��� �����ϰ�, �̸� �� ������ Ȱ�������ν� ���� ��ǥ�� �ٸ� �̷����� �ϴ� ���Դϴ�. ���������� ���� 6���� �ֿ� �̽��� �ǻ����, �� ��ȭ, ������, ��ȭ, ���� �ذ� �� ���� ����, ��Ʈ���� ������ 16���� ���������� �����Ͽ� ���� �� ���� ȿ���� ������ ���� �� �ִ� �������� �����Ǿ� �ֽ��ϴ�.

* ����
1. ����
  ? ���� �� ����
  ? MBTI�� MBTI�� ���� �ִ� ����

2. ��ȣ��ǥ ����
  ? ������ ��ȣ��ǥ Ȯ���ϱ�
  ? ���� ��Ȳ������ ��ȣ��ǥ Ȯ���ϱ�
  ? 6���� �ֿ� �� �̽��� MBTI ��ȣ��ǥ
3. �������� ����
  ? 16���� ��������

4. ������ǥ�� 5���� ���� ����
  ? ������ǥ ���캸��
  ? 5���� ����
  ? �� �м�
  ? �δ� ��');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+20000, '���������� �߳�� �ɸ�', 13000, '�ѱ�MBTI������', '����', 'Eleanor S. Corlett, Nancy B. Millner', 'Y',
'MBTI ���� ����',
'������ �� �̷а� MBTI ������ ��������, �������� ��ȸ�� �ñ��� �߳�� ������ �����ϴ� ��� ������� ������ ���õ� ��ħ���� �� �� �ֽ��ϴ�. ���ڵ��� ǳ���� ����, ��ũ��, ����� ���� ������ �߳�� ��ʸ� �м��ϰ� Jung�� Stein�̷п� �ٰ��Ͽ� �߳�⿡ ������ �ڽ��� ã���� �ݷ��մϴ�.

* ����
��1�� �߳�� : �� ������ Ž��
        1�� �߳�� ����
        2�� Jung�� ������ ����
        3�� �λ��� ���ݱ� ����
        4�� �߳�� ������ �����ϱ�

��2�� �߳�� �̾߱�
        5��. �߳�⿡ ���̴� �� ���������� ������ ����

��3�� �� ���� �� �ָ�
        6��. ������ ����
        7��. ���������� ����
        8��. �߳�� �����ɰ� �׸���
        9��. �߳�� �ߴ� ���� Ȯ���ϱ�
        10��. �߳�� ������ ���ٶ�');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+20000, '���������� ���ιߴ�', 15000, '���Ÿ', '����', '���Ÿ', 'Y',
'������ ���� �� �η°��� �о߿��� ������� ���������� ���� ���� ���۵�',
'������ ���� �� �η°��� �о߿��� ������� ���������� ���� ���� ���۵Ǿ����ϴ�. �������� �������� �̷��� �����Ͽ� ������� ���ιߴ� ������ ���� ���ΰ��� �������� �����ų �� �ֵ��� �ϴ� ������ ���մϴ�.

* ����
��. ���ιߴ޿����� �������� Ȱ�� ����

��. ���ιߴ� ����

��. �����ڿ��� �´� ���ιߴ� �����ϱ�

��. �������� �����ߴ� �����ϱ�

��. ���λ������ �����ߴ� �����ϱ�');


insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+20000, '�����ϴ� ���̵�', 13000, '���Ÿ', '����', 'Elizabeth Murphy', 'Y',
'Elizabeth Murphy�� ��� ������ �ڿ������� ��õ�� ��ȣ�� ���������ν� ���谡 ���������� ������ �� �ִٰ� ����',
'Elizabeth Murphy�� ��� ������ �ڿ������� ��õ�� ��ȣ�� ���������ν� ���谡 ���������� ������ �� �ִٰ� �����ϰ� �ֽ��ϴ�. �� å�� Carl Jung�� �ɸ��������� ���ʷ� ���̵��� �ϻ��Ȱ���� ��Ÿ���� �پ��� ���� ���� ��ʿ� �Բ� ������ ���� ������ �����ϰ� �ֽ��ϴ�. 

* ����
���� �������� �̷а� ���̵��� �ߴ�

������ ���������� ���� Ȱ��

�پ��� ���� ���̵���� ������ ���� ����� ���� ����');


insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+20000, '���ǽɸ������� �����ɰ� �������', 12000, '���Ÿ', '����', 'Marie-Louise von Franz, James Hillman', 'Y',
'LECTURES ON JUNG Typology�� ������',
'���� �ɸ��������� ���� ������ �� �������� ���ӽ� ������ ü�迡 ������ �� ���� ������ ��Ƶ�
LECTURES ON JUNG Typology�� �������� ���� ���� �̷п�
���� ���� �����ְ� ��̷Ӱ� ������ �� �ֽ��ϴ�.
�� �������� ������ ���, �� �߿����� ���ǽĿ� �Ѹ��� �� ���� ��ɿ� ���� ���ظ� ����
�츮�� ���� ����� �������� �������� �ָ����� �ʰ� �ǰ��ϰ� ��ư� �� �ֵ���
�����ɿ� ���� ���� ������ ���ϰ� �ֽ��ϴ�.
���� ���ӽ� ������ ������ ����� ���� �̾߱��� ��������� Ư¡�� �ڽ��� ü����
���� ����ϰ� �ֽ��ϴ�');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+30000, 'MBTI �������� ī��', 15000, '���Ÿ', '��Ÿ', '���Ÿ', 'Y',
'MBTI �������� ī��� ���������� Ȱ���� ���� ȯ�� �ӿ��� ���� �������� ���� Ư���� �����ϰ� ��/������ �Բ� �����ϵ��� ���� ī�� ������ ����',
'MBTI �������� ī��� ���������� Ȱ���� ���� ȯ�� �ӿ��� ���� �������� ���� Ư���� �����ϰ� ��/������ �Բ� �����ϵ��� ���� ī�� ������ �����Դϴ�.                                                                                                                       

16���� �������� ���� �ش� ���������� �� ǥ���ϴ� Ű����� ���� �������� ���� �� ������ ���� Ȯ���� �� �ֽ��ϴ�.

�� ����, ���� �������� ���� ������ ������ �Բ� ������ ���� ����, ���� �󿡼� �������� ������ �ʿ��� �� �����ϰ� ���� �� �ֽ��ϴ�.

* ����
���� : ī�� ���� + ī�� �� 18�� + ��������

-MBTI ��ȣ��ǥ �ȳ�/ �������� �� �Ұ� (1��)                                                                                             

-16���� �������� ī�� �Ұ� (1��)                                                                                                            

-16���� �������� �� ī�� (16��)
(�ո� : Keywords, ���� �������� ���� ����)
(�޸� : �������ڰ� �Ǳ� ���� ������ ��(��Ī ����))

* ī�带 �Ⱦ� ���� �� �� �ִ� �������̰� ����ֽ��ϴ�.');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+30000, 'MBTI Type Calendar', 15000, '���Ÿ', '��Ÿ', '���Ÿ', 'Y',
'MBTI Type Calendar�� ���������� Ȱ���� �ھ� Ž�� �� ��ȣ ���ظ� ���� �޷� ������ ����',
'MBTI�� Type Calendar�� ���������� Ȱ���� �ھ� Ž�� �� ��ȣ ���ظ� ���� �޷� ������ �����Դϴ�. 16���� �������� �� �� ���� ������ ���� Ű����� ��������, ���� ��� ���� ���Ͽ� �� �� �ֽ��ϴ�. ������ ���� ���� Ž���� ���Ҿ� 2�� 1�� ��Ȳ���� MBTI�縦 Ȱ���Ͽ� ���θ� �����ϴ� �� ȿ������ �ǽ� �����Դϴ�. ����, ģ��, ����, ����� ���� ���������� ���ϰ� ���̸� �����ϰ� ���� ��, �˻��� ������ ������ ������ �޶� ���� ������ ã�� ���� �� �����ϰ� ���� �� �ֽ��ϴ�.

* ����
? ���� ��� �ȳ�
? 4���� ��ȣ��ǥ ����
? 16���� �������� ��
   (�ո�: Keywords, Ư¡)
   (�޸�: �簢����(Blind spot), ���� ��� ��)');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+30000, 'MBTI ��¡�̹���_����', 7500, '���Ÿ', '��Ÿ', '���Ÿ', 'Y',
'�ֱ�ɺ� �̹����� �׿� ���õ� ���� ���ɸ������С��� �������� ����',
'�ֱ�ɺ� �̹����� �׿� ���õ� ���� ���ɸ������С��� �������� �����Ͽ����ϴ�.
�� ������ �� 8���� �������� �����Ǿ� �־� ��Ȳ�� ���� �����ϰ� �����ϰ� �޴��� �� �ֽ��ϴ�');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+30000, '����ī��', 700, '���Ÿ', '��Ÿ', '���Ÿ', 'Y',
'�� ������ Ư¡�� �����Ͽ� �� ���� ī�忡 ������ �����ν� �� ������ ���ظ� ���� ���� �� �� �ֵ��� �����ݴϴ�',
'�� ������ Ư¡�� �����Ͽ� �� ���� ī�忡 ������ �����ν� �� ������ ���ظ� ���� ���� �� �� �ֵ��� �����ݴϴ�');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+30000, '16���� �������� ��ǥ', 8500, '���Ÿ', '��Ÿ', '���Ÿ', 'Y',
'A1������� ���õ� ���̷� �׷��� ��� ���� ����ǥ�� �� ���� ���� ���� Ȯ���� �� �ִ� �ڷ��Դϴ�',
'A1������� ���õ� ���̷� �׷��� ��� ���� ����ǥ�� �� ���� ���� ���� Ȯ���� �� �ִ� �ڷ��Դϴ�');

--------------------------------------------------------------------------------------------------------------------------------------------
create or replace NONEDITIONABLE procedure DELETEORDERS
(
    orderNo number
)
is
begin
    insert into intostock
    select INTOSTOCK_SEQ.nextval, book_no, orders_qty, sysdate
    from ORDERBOOKVIEW 
    where orders_no = orderNo;

    insert into sales(sales_no, sales_category_no, sales_name, sales_price)
    select sales_seq.nextval, 1, book_title, (book_price * orders_qty * -1)
    from ORDERBOOKVIEW 
    where orders_no = orderNo;

    update orders_detail
    set orders_state = '취소 신청'
    where orders_no = orderNo;

    commit;

EXCEPTION
    WHEN OTHERS THEN
	raise_application_error(-20001, ' 실패!');
        ROLLBACK;
end;