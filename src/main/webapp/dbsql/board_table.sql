create table board
(
	no		        number		primary key,	--��ȣ
	name		varchar2(20)	not null,			--�̸�	
	pwd			varchar2(20)    not null,            --��й�ȣ
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

create procedure DELETEBOARD  --프로시저 이름 
(
--매개변수
    m_no number,
    m_step number,
    m_groupno number
)
is
--변수선언부
    cnt number;
begin
--처리할 내용
    if m_step = 0 then
        --답변글이 존재하는지 체크
        select count(*) into cnt from board
        where board_group_No = m_groupno;

        --답변글이 존재하는 경우
        if cnt > 1 then
            update board set board_Del_Flag = 'Y'
            where board_no = m_no;
        else --답변글이 없는 경우
            delete board where board_no = m_no;
        end if;
    else --답변글 자체인 경우
        delete board where board_no = m_no;
    end if;

    commit;

EXCEPTION
    WHEN OTHERS THEN
	raise_application_error(-20001, ' 실패!');
        ROLLBACK;
end;

create procedure DELETECOMMENTS  --프로시저 이름 
(
--매개변수
    m_no number,
    m_step number,
    m_groupno number
)
is
--변수선언부
    cnt number;
begin
--처리할 내용
    if m_step = 0 then
        --답변글이 존재하는지 체크
        select count(*) into cnt from comments
        where comments_group_No = m_groupno;

        --답변글이 존재하는 경우
        if cnt > 1 then
            update comments set comments_Del_Flag = 'Y'
            where comments_no = m_no;
        else --답변글이 없는 경우
            delete comments where comments_no = m_no;
        end if;
    else --답변글 자체인 경우
        delete comments where comments_no = m_no;
    end if;

    commit;

EXCEPTION
    WHEN OTHERS THEN
	raise_application_error(-20001, ' 실패!');
        ROLLBACK;
end;