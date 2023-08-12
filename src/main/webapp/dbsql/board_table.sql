create table board
(
	no		        number		primary key,	--번호
	name		varchar2(20)	not null,			--이름	
	pwd			varchar2(20)    not null,            --비밀번호
	title			varchar2(100)	 not null,			--제목
	email		varchar2(80)    null,            --이메일
	regdate 		date			default  sysdate,	--작성일
	--regip		varchar2(15)	 null,			--작성IP
	readcount	number		default 0	 null,		--조회수
	content		clob			null			--내용
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
join member m
on b.no = m.no
left join admin a
on b.admin_no = a.admin_no
order by b.board_no;