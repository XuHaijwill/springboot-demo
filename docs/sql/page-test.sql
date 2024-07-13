---testdb2
-- 创建测试用户表
if exists (select 1 from sysobjects
           where id = object_id('sys_user_1') and type = 'U')
drop table sys_user_1

    go

CREATE TABLE sys_user_1
(
    user_id BIGINT,
    name VARCHAR(30) ,
    age INT  ,
    email VARCHAR(50)
)

ALTER TABLE sys_user_1 ADD CONSTRAINT PK_USER_ID primary key(user_id)


-- 增加测试数据
INSERT INTO sys_user_1 (user_id, name, age, email) VALUES (1, 'Jone', 18, 'test1@baomidou.com')
INSERT INTO sys_user_1 (user_id, name, age, email) VALUES (2, 'Jack', 20, 'test2@baomidou.com')
INSERT INTO sys_user_1 (user_id, name, age, email) VALUES (3, 'Tom', 28, 'test3@baomidou.com')
INSERT INTO sys_user_1 (user_id, name, age, email) VALUES (4, 'Sandy', 21, 'test4@baomidou.com')
INSERT INTO sys_user_1 (user_id, name, age, email) VALUES (5, 'Billie', 24, 'test5@baomidou.com')

select rownum=identity(12), user_id,name,age,email into #t FROM sys_user_1 select * from #t where rownum > 0 and rownum <= 2 drop table #t