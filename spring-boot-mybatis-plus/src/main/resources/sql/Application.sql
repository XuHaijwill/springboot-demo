
if exists (select 1 from sysobjects
           where id = object_id('sys_user') and type = 'U')
drop table sys_user

    go

create table sys_user (
                          user_id           bigint     not null,
                          dept_id           bigint      default null            ,
                          user_name         varchar(30)     not null                ,
                          nick_name         varchar(30)     not null                ,
                          user_type         varchar(2)      default '00'            ,
                          email             varchar(50)     default ''              ,
                          phonenumber       varchar(11)     default ''              ,
                          sex               char(1)         default '0'             ,
                          avatar            varchar(100)    default ''              ,
                          password          varchar(100)    default ''              ,
                          status            char(1)         default '0'             ,
                          del_flag          char(1)         default '0'             ,
                          login_ip          varchar(128)    default ''              ,
                          login_date        datetime                                ,
                          create_by         varchar(64)     default ''              ,
                          create_time       datetime                                ,
                          update_by         varchar(64)     default ''              ,
                          update_time       datetime                                ,
                          remark            varchar(500)    default null
)

ALTER TABLE sys_user ADD CONSTRAINT PK_SYS_USER_ID primary key(user_id)

insert into sys_user(user_id,dept_id,user_name,nick_name,user_type,email,phonenumber,sex,avatar ,password,status ,del_flag,login_ip,login_date,create_by,create_time,update_by,update_time,remark) values(1,103, 'admin', 'Ruoyi', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', getdate(), 'admin', getdate(), '', getdate(), 'administrator')
insert into sys_user(user_id,dept_id,user_name,nick_name,user_type,email,phonenumber,sex,avatar ,password,status ,del_flag,login_ip,login_date,create_by,create_time,update_by,update_time,remark) values(2,105, 'ry',    'Ruoyi', '00', 'ry@qq.com',  '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', getdate(), 'admin', getdate(), '', getdate(), 'Tester')

