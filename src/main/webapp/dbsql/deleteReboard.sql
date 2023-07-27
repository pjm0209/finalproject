create or replace procedure deleteReboard --���ν��� �̸� 
(
--�Ű�����
    m_no number,
    m_step number,
    m_groupno number
)
is
--���������
    cnt number;
begin
    /*
    �亯�� �ִ� �������� ��쿡�� ���ڵ带 �������� ���� DelFlag = "Y" �� update 
    */
    
    --�������� ���
    if m_step = 0 then 
        --�亯���� �����ϴ��� üũ
        select count(*) into cnt from reboard
        where groupNo = m_groupno;
        
        --�亯���� �����ϴ� ���
        if cnt >1 then
            update reboard set DelFlag = 'Y'
            where no = m_no;         
        else --�亯���� ���� ���
            delete reboard where no=m_no; 
        end if; 
    else --�亯�� ��ü�� ���
        delete reboard where no=m_no;
    end if;
    
    commit;


EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, '�� ���� ����!');
        ROLLBACK;
end;
