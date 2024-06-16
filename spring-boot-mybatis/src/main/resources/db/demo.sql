---DB testdb2
-- 创建测试用户表
if exists (select 1 from sysobjects
           where id = object_id('t_student') and type = 'U')
drop table t_student

    go

CREATE TABLE t_student
(
    id BIGINT,
    name VARCHAR(30) ,
    age INT  ,
    classname VARCHAR(255)
)

create table t_student
(
    id        bigint       not null
        constraint PK_T_STUDENT_ID
            primary key,
    name      varchar(30)  not null,
    age       int          not null,
    classname varchar(255) not null
)
    go


ALTER TABLE t_student ADD CONSTRAINT PK_T_STUDENT_ID primary key(id)


-- 增加测试数据
    INSERT INTO t_student (id, name, age, classname) VALUES (1, 'Jone', 18, 'Math')
INSERT INTO t_student (id, name, age, classname) VALUES (2, 'Jack', 20, 'Math')
INSERT INTO t_student (id, name, age, classname) VALUES (3, 'Tom', 28, 'English')
INSERT INTO t_student (id, name, age, classname) VALUES (4, 'Sandy', 21, 'Music')
INSERT INTO t_student (id, name, age, classname) VALUES (5, 'Billie', 24, 'Paint')


select a.colid as id,b.name as tab_name,a.name as col_name,c.name as type,a.length as all_length,a.prec as length,a.scale,case isnull(a.status,0) when 0 then 'NOT NULL' ELSE 'NULL' END AS isnull
from syscolumns a,sysobjects b,systypes c
where a.id=b.id and a.usertype=c.usertype and b.name = 't_student'