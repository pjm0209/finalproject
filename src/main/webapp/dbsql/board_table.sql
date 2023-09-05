create table board
(
	no		        number		primary key,	--��ȣ
	name		varchar2(20)	not null,			--�̸�	
	pwd			varchar2(20)    not null,            --��й��?
	title			varchar2(100)	 not null,			--����
	email		varchar2(80)    null,            --�̸���
	regdate 		date			default  sysdate,	--�ۼ���
	--regip		varchar2(15)	 null,			--�ۼ�IP
	readcount	number		default 0	 null,		--��ȸ��
	content		clob			null			--����
);

create sequence board_seq
increment by 1
start with 1
nocache;

select * from board;

create or replace view boardview
as
select b.*, A.admin_Id, m.name, m.userId, bf.board_form_Name, bf.board_form_intro, bf.board_file_add_flag, bf.comment_flag, bf.board_flag, Z.fileCount, Z.commentCount
from (
    select b.board_no, count(c.comments_no) as commentCount, count(Y.fileCount) as fileCount
    from (    
        select b.board_no, count(f.file_name) as fileCount
        from board b join board_file f
        on b.board_no = f.board_no
        group by b.board_no
    ) Y
    right join board b
    on Y.board_no = b.board_no
    left join comments c
    on c.board_no = b.board_no
    group by b.board_no
) Z
right join board b
on Z.board_no = b.board_no
join board_form bf
on b.board_form_no = bf.board_form_no
LEFT join member m
on b.no = m.no
left join admin a
on b.admin_no = a.admin_no
order by b.board_no;

create or replace procedure DELETEBOARD
(
    m_no number,
    m_step number,
    m_groupno number
)
is
    cnt number;
    boardcnt number;
    boardcnt1 number;
begin
    if m_step = 0 then
        select count(*) into cnt from board
        where board_group_No = m_groupno;

        if cnt > 1 then
            update board set board_Del_Flag = 'Y'
            where board_no = m_no;
        else
            delete board where board_no = m_no;
        end if;
    else 
        select count(*) into boardcnt from board
        where board_group_no = m_groupno and board_del_flag = 'Y';

        if boardcnt = 1 then
            select count(*) into boardcnt1 from board
            where board_step > 0 and board_group_no = m_groupno;

            if boardcnt1 > 1 then
                delete board where board_no = m_no;
            else
                delete board where board_group_no = m_groupno;
            end if;
        else
            delete board where board_no = m_no;
        end if;
    end if;
    
    commit;

EXCEPTION
    WHEN OTHERS THEN
	raise_application_error(-20001, ' ?�패!');
        ROLLBACK;
end;

create or replace procedure DELETECOMMENTS  
(
    m_no number,
    m_step number,
    m_groupno number
)
is
    cnt number;
    cnt1 number;
    cnt2 number;
begin
    if m_step = 0 then
        select count(*) into cnt from comments
        where comments_group_No = m_groupno;

        if cnt > 1 then
            update comments set comments_Del_Flag = 'Y'
            where comments_no = m_no;
        else 
            delete comments where comments_no = m_no;
        end if;
    else            
        select count(*) into cnt1 from comments
        where comments_del_flag = 'Y' and comments_group_no = m_groupno;
        
        if cnt1 = 1 then
            
            select count(*) into cnt2 from comments
            where comments_step > 0 and comments_group_no = m_groupno;
            
            if cnt2 > 1 then
                delete comments where comments_no = m_no;
            else                
                delete comments where comments_group_no = m_groupno;
            end if;
        else
            delete comments where comments_no = m_no;        
        end if;
    end if;

    commit;

EXCEPTION
    WHEN OTHERS THEN
	raise_application_error(-20001, ' ?�패!');
        ROLLBACK;
end;

--main BoardCategory view
create or replace view boardFormview
as
select bf.*, a.boardCount
from (
    select bf.board_Form_no, count(b.board_no) as boardCount
    from board_Form bf right join board b
    on bf.board_Form_no = b.board_Form_no
    group by bf.board_Form_no
) a
right join board_form bf
on bf.board_Form_no = a.board_form_no
order by bf.board_Form_NO;