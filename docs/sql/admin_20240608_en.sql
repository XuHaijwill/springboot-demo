-- ----------------------------
-- 1. Department table
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_dept') and type = 'U')
drop table sys_dept

    go

create table testdb.dbo.sys_dept (
                                     dept_id           bigint     identity,
                                     parent_id         bigint      default 0 ,
                                     ancestors         varchar(50)     default '',
                                     dept_name         varchar(30)     default '' ,
                                     order_num         int         default 0 ,
                                     leader            varchar(20)     default null ,
                                     phone             varchar(11)     default null,
                                     email             varchar(50)     default null ,
                                     status            char(1)         default '0',
                                     del_flag          char(1)         default '0',
                                     create_by         varchar(64)     default '',
                                     create_time 	    datetime,
                                     update_by         varchar(64)     default '',
                                     update_time       datetime
) with identity_gap = 1

      go

ALTER TABLE testdb.dbo.sys_dept ADD CONSTRAINT PK_SYS_DEPT primary key(dept_id)

    go

-- 存在问题，添加失败
-- COMMENT ON TABLE  sys_dept is 'dept storage table'
-- comment on column sys_dept.dept_id '部门id'
-- comment on column sys_dept.parent_id '父部门id'
-- comment on column sys_dept.ancestors '祖级列表'
-- comment on column sys_dept.dept_name '部门名称'
-- comment on column sys_dept.order_num '显示顺序'
-- comment on column sys_dept.leader '负责人'
-- comment on column sys_dept.phone '联系电话'
-- comment on column sys_dept.email '邮箱'
-- comment on column sys_dept.status '部门状态（0正常 1停用）'
-- comment on column sys_dept.del_flag '删除标志（0代表存在 2代表删除）'
-- comment on column sys_dept.create_by '创建者'
-- comment on column sys_dept.create_time '创建时间'
-- comment on column sys_dept.update_by '更新者'
-- comment on column sys_dept.update_time '更新时间'

-- ----------------------------
-- Initialization-department table data
-- ----------------------------
select getdate()
-- Explicit value specified for identity field in table 'testdb.dbo.sys_dept' when 'SET IDENTITY_INSERT' is OFF.
    insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(0, '0', 'Ruoyi Technology', 0, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(100, '0,100', 'Shenzhen Head Office', 1, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(100, '0,100', 'Changsha Branch', 2, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(101, '0,100,101', 'R&D department', 1, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(101, '0,100,101', 'Marketing department', 2, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(101, '0,100,101', 'Testing Department', 3, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(101, '0,100,101', 'Finance Department', 4, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(101, '0,100,101', 'Operation and Maintenance Department', 5, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(102, '0,100,102', 'Marketing Department', 1, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(102, '0,100,102', 'Finance Department', 2, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
    go
-- ----------------------------
-- 2. User Information Table
-- ----------------------------
    if exists (select 1 from sysobjects
    where id = object_id('sys_user') and type = 'U')
drop table sys_user

    go

create table sys_user (
                          user_id           bigint     identity ,
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
) with identity_gap = 1

ALTER TABLE sys_user ADD CONSTRAINT PK_SYS_USER primary key(user_id)

    go
-- ----------------------------
-- Initialization-User Information Table Data
-- ----------------------------
insert into sys_user(dept_id,user_name,nick_name,user_type,email,phonenumber,sex,avatar ,password,status ,del_flag,login_ip,login_date,create_by,create_time,update_by,update_time,remark) values(103, 'admin', 'Ruoyi', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', getdate(), 'admin', getdate(), '', null, 'administrator')
insert into sys_user(dept_id,user_name,nick_name,user_type,email,phonenumber,sex,avatar ,password,status ,del_flag,login_ip,login_date,create_by,create_time,update_by,update_time,remark) values(105, 'ry',    'Ruoyi', '00', 'ry@qq.com',  '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', getdate(), 'admin', getdate(), '', null, 'Tester')

-- ----------------------------
-- 3.Position Information Table Data
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_post') and type = 'U')
drop table sys_post

    go

create table sys_post
(
    post_id       bigint     identity,
    post_code     varchar(64)     not null       ,
    post_name     varchar(50)     not null       ,
    post_sort     int         not null       ,
    status        char(1)         not null       ,
    create_by     varchar(64)     default ''     ,
    create_time   datetime                       ,
    update_by     varchar(64)     default ''		,
    update_time   datetime                       ,
    remark        varchar(500)    default null
) with identity_gap = 1

ALTER TABLE sys_post ADD CONSTRAINT PK_SYS_POST primary key(post_id)

    go

-- ----------------------------
-- Initialize - Position Information Table Data
-- ----------------------------
insert into sys_post(post_code,post_name,post_sort,status,create_by,create_time,update_by,update_time,remark) values('ceo', 'Chairman', 1, '0', 'admin', getdate(), '', null, '')
insert into sys_post(post_code,post_name,post_sort,status,create_by,create_time,update_by,update_time,remark) values('se', 'Project Manager', 2, '0', 'admin', getdate(), '', null, '')
insert into sys_post(post_code,post_name,post_sort,status,create_by,create_time,update_by,update_time,remark) values('hr', 'Human Resources', 3, '0', 'admin', getdate(), '', null, '')
insert into sys_post(post_code,post_name,post_sort,status,create_by,create_time,update_by,update_time,remark) values('user', 'Ordinary employee', 4, '0', 'admin', getdate(), '', null, '')
-- ----------------------------
-- 4. Role Information Table
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_role') and type = 'U')
drop table sys_role

    go

create table sys_role (
                          role_id              bigint      identity ,
                          role_name            varchar(30)     not null            ,
                          role_key             varchar(100)    not null            ,
                          role_sort            int          not null            ,
                          data_scope           char(1)         default '1'         ,
                          menu_check_strictly  tinyint      default 1           ,
                          dept_check_strictly  tinyint      default 1           ,
                          status               char(1)         not null            ,
                          del_flag             char(1)         default '0'         ,
                          create_by            varchar(64)     default ''          ,
                          create_time          datetime                            ,
                          update_by            varchar(64)     default ''          ,
                          update_time          datetime                            ,
                          remark               varchar(500)    default null
) with identity_gap = 1

ALTER TABLE sys_role ADD CONSTRAINT PK_SYS_ROLE primary key(role_id)

    go

-- ----------------------------
-- Initialization-Role Information Table Data
-- ----------------------------
insert into sys_role(role_name,role_key,role_sort,data_scope,menu_check_strictly,dept_check_strictly,status,del_flag,create_by,create_time,update_by,update_time,remark) values('超级administrator',  'admin',  1, '1', 1, 1, '0', '0', 'admin', getdate(), '', null, '超级administrator')
insert into sys_role(role_name,role_key,role_sort,data_scope,menu_check_strictly,dept_check_strictly,status,del_flag,create_by,create_time,update_by,update_time,remark) values('普通角色',    'common', 2, '2', 1, 1, '0', '0', 'admin', getdate(), '', null, '普通角色')

-- ----------------------------
-- 5. Menu Permission Table
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_menu') and type = 'U')
drop table sys_menu

    go

create table sys_menu (
                          menu_id           bigint      identity,
                          menu_name         varchar(50)     not null           ,
                          parent_id         bigint      default 0              ,
                          order_num         int          default 0             ,
                          path              varchar(200)    default ''         ,
                          component         varchar(255)    default null       ,
                          query             varchar(255)    default null       ,
                          is_frame          int          default 1          ,
                          is_cache          int          default 0          ,
                          menu_type         char(1)         default ''         ,
                          visible           char(1)         default 0          ,
                          status            char(1)         default 0          ,
                          perms             varchar(100)    default null       ,
                          icon              varchar(100)    default '#'        ,
                          create_by         varchar(64)     default ''         ,
                          create_time       datetime                           ,
                          update_by         varchar(64)     default ''         ,
                          update_time       datetime                           ,
                          remark            varchar(500)    default ''
) with identity_gap = 1

ALTER TABLE sys_menu ADD CONSTRAINT PK_SYS_MENU primary key(menu_id)

    go

-- ----------------------------
-- Initialize - Menu information table data
-- ----------------------------
-- First level menu
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('System management', 0, 1, 'system', null, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', getdate(), '', null, 'System management directory')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('System monitoring', 0, 2, 'monitor', null, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', getdate(), '', null, 'System monitoring directory')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('System tool', 0, 3, 'tool', null, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', getdate(), '', null, 'System tool directory')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Ruoyi official website', 0, 4, 'http://ruoyi.vip', null, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', getdate(), '', null, 'Ruoyi official website address')
-- Secondary menu
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('User Management', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', getdate(), '', null, 'User Management Menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Role Management', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', getdate(), '', null, 'Role management menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Menu management', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', getdate(), '', null, 'Menu management menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Department management', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', getdate(), '', null, 'Department management menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Position management', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', getdate(), '', null, 'Position management menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Dictionary management', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', getdate(), '', null, 'Dictionary management menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Parameter settings', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', getdate(), '', null, 'Parameter settings menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Notice', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', getdate(), '', null, 'Notice menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Log Management', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', getdate(), '', null, 'Log management menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Online users', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', getdate(), '', null, 'Online user menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Scheduled task', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', getdate(), '', null, 'Scheduled task menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Data monitoring', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', getdate(), '', null, 'Data monitoring menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Service monitoring', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', getdate(), '', null, 'Service monitoring menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Cache monitoring', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', getdate(), '', null, 'Cache monitoring menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Cache list', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', getdate(), '', null, 'Cache list menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Form build', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', getdate(), '', null, 'Form build menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Code generation', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', getdate(), '', null, 'Code generation menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('System interface', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', getdate(), '', null, 'System interface menu')
-- Level 3 menu
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Operation log', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', getdate(), '', null, 'Operation log menu')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Login log', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', getdate(), '', null, 'Login log menu')
-- User management button
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('User query', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('User addition', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('User modification', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('User deletion', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('User export', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('User import', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Reset password', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', getdate(), '', null, '')
-- Role management button
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('role query', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Add new role', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Change role', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Role deletion', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Role export', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', getdate(), '', null, '')
-- Menu management button
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Menu query', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Add menu', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Change menu', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Menu Delete', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', getdate(), '', null, '')
-- Department management button
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Department query', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Department Add', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Department Modify', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Department Delete', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', getdate(), '', null, '')
-- Position management button
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Position query', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Position add', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Position modification', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Position deletion', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Position export', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', getdate(), '', null, '')
-- Dictionary management button
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Dictionary query', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Dictionary addition', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Dictionary modification', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Dictionary deletion', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Dictionary export', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', getdate(), '', null, '')
-- Parameter setting button
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('parameter query', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Parameter addition', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Parameter modification', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Parameter deletion', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Parameter export', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', getdate(), '', null, '')
-- Notice button
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Notice query', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('New announcement', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Modify announcement', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Notice deletion', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', getdate(), '', null, '')
-- Operation log button
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Operation query', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Operation deletion', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Log export', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', getdate(), '', null, '')
-- Login log button
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Login query', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Login deletion', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Log export', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Account unlock', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', getdate(), '', null, '')
-- Online user button
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Online query', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Batch forced logout', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Single forced logout', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', getdate(), '', null, '')
-- Scheduled task button
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Task query', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Task Add', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Task Modify', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Task deletion', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Status modification', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Task export', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Generate query', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Generate modification', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Generate deletion', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Import code', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Preview code', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('Generate code', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', getdate(), '', null, '')

-- ----------------------------
-- 6. User and role association table User N-1 role
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_user_role') and type = 'U')
drop table sys_user_role

    go

create table sys_user_role (
                               user_id   bigint not null,
                               role_id   bigint not null
) with identity_gap = 1

ALTER TABLE sys_user_role ADD CONSTRAINT PK_USER_ROLE_ID primary key(user_id, role_id)

    -- ----------------------------
-- Initialize - user and role association table data
-- ----------------------------
    insert into sys_user_role(user_id,role_id) values (1, 1)
insert into sys_user_role(user_id,role_id) values (2, 2)

-- ----------------------------
-- 7. Role and menu association table Role 1-N menu
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_role_menu') and type = 'U')
drop table sys_role_menu

    go

create table sys_role_menu (
                               role_id   bigint not null,
                               menu_id   bigint not null
)

ALTER TABLE sys_role_menu ADD CONSTRAINT PK_ROLE_MENU_ID primary key(role_id, menu_id)

    go

-- ----------------------------
-- Initialize-character and menu association table data
-- ----------------------------
insert into sys_role_menu(role_id,menu_id) values (2, 1)
insert into sys_role_menu(role_id,menu_id) values (2, 2)
insert into sys_role_menu(role_id,menu_id) values (2, 3)
insert into sys_role_menu(role_id,menu_id) values (2, 4)
insert into sys_role_menu(role_id,menu_id) values (2, 100)
insert into sys_role_menu(role_id,menu_id) values (2, 101)
insert into sys_role_menu(role_id,menu_id) values (2, 102)
insert into sys_role_menu(role_id,menu_id) values (2, 103)
insert into sys_role_menu(role_id,menu_id) values (2, 104)
insert into sys_role_menu(role_id,menu_id) values (2, 105)
insert into sys_role_menu(role_id,menu_id) values (2, 106)
insert into sys_role_menu(role_id,menu_id) values (2, 107)
insert into sys_role_menu(role_id,menu_id) values (2, 108)
insert into sys_role_menu(role_id,menu_id) values (2, 109)
insert into sys_role_menu(role_id,menu_id) values (2, 110)
insert into sys_role_menu(role_id,menu_id) values (2, 111)
insert into sys_role_menu(role_id,menu_id) values (2, 112)
insert into sys_role_menu(role_id,menu_id) values (2, 113)
insert into sys_role_menu(role_id,menu_id) values (2, 114)
insert into sys_role_menu(role_id,menu_id) values (2, 115)
insert into sys_role_menu(role_id,menu_id) values (2, 116)
insert into sys_role_menu(role_id,menu_id) values (2, 117)
insert into sys_role_menu(role_id,menu_id) values (2, 500)
insert into sys_role_menu(role_id,menu_id) values (2, 501)
insert into sys_role_menu(role_id,menu_id) values (2, 1000)
insert into sys_role_menu(role_id,menu_id) values (2, 1001)
insert into sys_role_menu(role_id,menu_id) values (2, 1002)
insert into sys_role_menu(role_id,menu_id) values (2, 1003)
insert into sys_role_menu(role_id,menu_id) values (2, 1004)
insert into sys_role_menu(role_id,menu_id) values (2, 1005)
insert into sys_role_menu(role_id,menu_id) values (2, 1006)
insert into sys_role_menu(role_id,menu_id) values (2, 1007)
insert into sys_role_menu(role_id,menu_id) values (2, 1008)
insert into sys_role_menu(role_id,menu_id) values (2, 1009)
insert into sys_role_menu(role_id,menu_id) values (2, 1010)
insert into sys_role_menu(role_id,menu_id) values (2, 1011)
insert into sys_role_menu(role_id,menu_id) values (2, 1012)
insert into sys_role_menu(role_id,menu_id) values (2, 1013)
insert into sys_role_menu(role_id,menu_id) values (2, 1014)
insert into sys_role_menu(role_id,menu_id) values (2, 1015)
insert into sys_role_menu(role_id,menu_id) values (2, 1016)
insert into sys_role_menu(role_id,menu_id) values (2, 1017)
insert into sys_role_menu(role_id,menu_id) values (2, 1018)
insert into sys_role_menu(role_id,menu_id) values (2, 1019)
insert into sys_role_menu(role_id,menu_id) values (2, 1020)
insert into sys_role_menu(role_id,menu_id) values (2, 1021)
insert into sys_role_menu(role_id,menu_id) values (2, 1022)
insert into sys_role_menu(role_id,menu_id) values (2, 1023)
insert into sys_role_menu(role_id,menu_id) values (2, 1024)
insert into sys_role_menu(role_id,menu_id) values (2, 1025)
insert into sys_role_menu(role_id,menu_id) values (2, 1026)
insert into sys_role_menu(role_id,menu_id) values (2, 1027)
insert into sys_role_menu(role_id,menu_id) values (2, 1028)
insert into sys_role_menu(role_id,menu_id) values (2, 1029)
insert into sys_role_menu(role_id,menu_id) values (2, 1030)
insert into sys_role_menu(role_id,menu_id) values (2, 1031)
insert into sys_role_menu(role_id,menu_id) values (2, 1032)
insert into sys_role_menu(role_id,menu_id) values (2, 1033)
insert into sys_role_menu(role_id,menu_id) values (2, 1034)
insert into sys_role_menu(role_id,menu_id) values (2, 1035)
insert into sys_role_menu(role_id,menu_id) values (2, 1036)
insert into sys_role_menu(role_id,menu_id) values (2, 1037)
insert into sys_role_menu(role_id,menu_id) values (2, 1038)
insert into sys_role_menu(role_id,menu_id) values (2, 1039)
insert into sys_role_menu(role_id,menu_id) values (2, 1040)
insert into sys_role_menu(role_id,menu_id) values (2, 1041)
insert into sys_role_menu(role_id,menu_id) values (2, 1042)
insert into sys_role_menu(role_id,menu_id) values (2, 1043)
insert into sys_role_menu(role_id,menu_id) values (2, 1044)
insert into sys_role_menu(role_id,menu_id) values (2, 1045)
insert into sys_role_menu(role_id,menu_id) values (2, 1046)
insert into sys_role_menu(role_id,menu_id) values (2, 1047)
insert into sys_role_menu(role_id,menu_id) values (2, 1048)
insert into sys_role_menu(role_id,menu_id) values (2, 1049)
insert into sys_role_menu(role_id,menu_id) values (2, 1050)
insert into sys_role_menu(role_id,menu_id) values (2, 1051)
insert into sys_role_menu(role_id,menu_id) values (2, 1052)
insert into sys_role_menu(role_id,menu_id) values (2, 1053)
insert into sys_role_menu(role_id,menu_id) values (2, 1054)
insert into sys_role_menu(role_id,menu_id) values (2, 1055)
insert into sys_role_menu(role_id,menu_id) values (2, 1056)
insert into sys_role_menu(role_id,menu_id) values (2, 1057)
insert into sys_role_menu(role_id,menu_id) values (2, 1058)
insert into sys_role_menu(role_id,menu_id) values (2, 1059)
insert into sys_role_menu(role_id,menu_id) values (2, 1060)

-- ----------------------------
-- 8. Role and department association table Role 1-N Department
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_role_dept') and type = 'U')
drop table sys_role_dept

    go

create table sys_role_dept (
                               role_id   bigint not null,
                               dept_id   bigint not null
)

ALTER TABLE sys_role_dept ADD CONSTRAINT PK_ROLE_DEPT_ID primary key(role_id, dept_id)

    go

-- ----------------------------
-- Initialize the role and department association table data
-- ----------------------------
insert into sys_role_dept(role_id,dept_id) values (2, 100)
insert into sys_role_dept(role_id,dept_id) values (2, 101)
insert into sys_role_dept(role_id,dept_id) values (2, 105)

-- ----------------------------
-- 9. User and position association table User 1-N positions
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_user_post') and type = 'U')
drop table sys_user_post

    go

create table sys_user_post
(
    user_id   bigint not null,
    post_id   bigint not null
)

ALTER TABLE sys_user_post ADD CONSTRAINT PK_ROLE_DEPT_ID primary key(user_id, post_id)

    go

-- ----------------------------
-- Initialize-user and position association table data
-- ----------------------------
insert into sys_user_post(user_id, post_id) values (1, 1)
insert into sys_user_post(user_id, post_id) values (2, 2)

-- ----------------------------
-- 10. Operation log record
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_oper_log') and type = 'U')
drop table sys_oper_log

    go

create table sys_oper_log (
                              oper_id           bigint      identity,
                              title             varchar(50)     default ''         ,
                              business_type     int             default 0          ,
                              method            varchar(200)    default ''         ,
                              request_method    varchar(10)     default ''         ,
                              operator_type     int             default 0          ,
                              oper_name         varchar(50)     default ''         ,
                              dept_name         varchar(50)     default ''         ,
                              oper_url          varchar(255)    default ''         ,
                              oper_ip           varchar(128)    default ''         ,
                              oper_location     varchar(255)    default ''         ,
                              oper_param        varchar(2000)   default ''         ,
                              json_result       varchar(2000)   default ''         ,
                              status            int             default 0          ,
                              error_msg         varchar(2000)   default ''         ,
                              oper_time         datetime                           ,
                              cost_time         bigint      default 0
) with identity_gap = 1

ALTER TABLE sys_oper_log ADD CONSTRAINT PK_SYS_OPER_LOG primary key(oper_id)

    go

-- ----------------------------
-- 11. Dictionary type table
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_dict_type') and type = 'U')
drop table sys_dict_type

    go

create table sys_dict_type
(
    dict_id          bigint     identity ,
    dict_name        varchar(100)    default ''          ,
    dict_type        varchar(100)    default ''          ,
    status           char(1)         default '0'         ,
    create_by        varchar(64)     default ''          ,
    create_time      datetime                            ,
    update_by        varchar(64)     default ''          ,
    update_time      datetime                            ,
    remark           varchar(500)    default null
)with identity_gap = 1

     go

ALTER TABLE sys_dict_type ADD CONSTRAINT PK_SYS_DICT_TYPE primary key(dict_id)
ALTER TABLE sys_dict_type ADD CONSTRAINT UNQ_SYS_DICT_TYPE UNIQUE (dict_type)

    go

insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('user gender', 'sys_user_sex', '0', 'admin', getdate(), '', null, 'user gender list')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('menu status', 'sys_show_hide', '0', 'admin', getdate(), '', null, 'menu status list')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('system switch', 'sys_normal_disable', '0', 'admin', getdate(), '', null, 'System switch list')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('Task status', 'sys_job_status', '0', 'admin', getdate(), '', null, 'Task status list')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('Task group', 'sys_job_group', '0', 'admin', getdate(), '', null, 'Task group list')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('System whether', 'sys_yes_no', '0', 'admin', getdate(), '', null, 'Is the system a list')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('Notification type', 'sys_notice_type', '0', 'admin', getdate(), '', null, 'Notification type list')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('Notification status', 'sys_notice_status', '0', 'admin', getdate(), '', null, 'Notification status list')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('operation type', 'sys_oper_type', '0', 'admin', getdate(), '', null, 'operation type list')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('system status', 'sys_common_status', '0', 'admin', getdate(), '', null, 'login status list')

-- ----------------------------
-- 12. Dictionary data table
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_dict_data') and type = 'U')
drop table sys_dict_data

    go

create table sys_dict_data
(
    dict_code        bigint      identity,
    dict_sort        int          default 0      ,
    dict_label       varchar(100)    default ''  ,
    dict_value       varchar(100)    default ''  ,
    dict_type        varchar(100)    default ''  ,
    css_class        varchar(100)    default null,
    list_class       varchar(100)    default null,
    is_default       char(1)         default 'N' ,
    status           char(1)         default '0' ,
    create_by        varchar(64)     default ''  ,
    create_time      datetime                    ,
    update_by        varchar(64)     default ''  ,
    update_time      datetime                    ,
    remark           varchar(500)    default null
) with identity_gap = 1

ALTER TABLE sys_dict_data ADD CONSTRAINT PK_SYS_DICT_DATA primary key(dict_code)

    go

insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1, 'Male', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', getdate(), '', null, 'gender male')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2, 'Female', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', getdate(), '', null, 'gender female')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 3, 'unknown', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', getdate(), '', null, 'gender unknown')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1, 'display', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', getdate(), '', null, 'Show menu')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2, 'Hide', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', getdate(), '', null, 'Hide menu')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1, 'Normal', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', getdate(), '', null, 'Normal status')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2, 'Disable', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', getdate(), '', null, 'disabled')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1, 'normal', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', getdate(), '', null, 'normal')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2, 'pause', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', getdate(), '', null, 'disabled')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1, 'default', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', getdate(), '', null, 'default grouping')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2, 'system', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', getdate(), '', null, 'system group')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1, 'yes', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', getdate(), '', null, 'The system default is')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2, 'No', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', getdate(), '', null, 'The system default is no')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1, 'Notification', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', getdate(), '', null, 'notification')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2, 'notification', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', getdate(), '', null, 'notification')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1, 'normal', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', getdate(), '', null, 'Normal status')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2, 'Close', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', getdate(), '', null, 'Close status')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 99, 'Other', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', getdate(), '', null, 'Other operations')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1, 'Added', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', getdate(), '', null, 'Add operation')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2, 'Modify', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', getdate(), '', null, 'Modify operation')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 3, 'Delete', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', getdate(), '', null, 'Delete operation')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 4, 'Authorization', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', getdate(), '', null, 'Authorization operation')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 5, 'Export', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', getdate(), '', null, 'Export operation')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 6, 'Import', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', getdate(), '', null, 'Import operation')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 7, 'Forced exit', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', getdate(), '', null, 'Forced exit operation')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 8, 'Generate code', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', getdate(), '', null, 'Generate operation')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 9, 'Clear data', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', getdate(), '', null, 'Clear operation')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1, 'Success', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', getdate(), '', null, 'normal status')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2, 'failed', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', getdate(), '', null, 'disabled status')

-- ----------------------------
-- 13. Parameter configuration table
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_config') and type = 'U')
drop table sys_config

    go

create table sys_config (
                            config_id         int         identity,
                            config_name       varchar(100)    default '' ,
                            config_key        varchar(100)    default '' ,
                            config_value      varchar(500)    default '' ,
                            config_type       char(1)         default 'N',
                            create_by         varchar(64)     default '' ,
                            create_time       datetime                   ,
                            update_by         varchar(64)     default '' ,
                            update_time       datetime                   ,
                            remark            varchar(500)    default null
) with identity_gap = 1

ALTER TABLE sys_config ADD CONSTRAINT PK_SYS_CONFIG primary key(config_id)

    go

insert into sys_config(config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) values('Main frame page-default skin style name', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', getdate(), '', null, 'Blue skin-blue, green skin-green, purple skin-purple, red skin-red, yellow skin-yellow' )
insert into sys_config(config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) values('User management-account initial password', 'sys.user.initPassword', '123456', 'Y', 'admin', getdate(), '', null, 'Initialization password 123456' )
insert into sys_config(config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) values('Main frame page-sidebar theme', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', getdate(), '', null, 'Dark theme theme-dark, light theme theme-light' )
insert into sys_config(config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) values('Account self-service-captcha switch', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', getdate(), '', null, 'Whether to enable the captcha function (true to enable, false to disable)')
insert into sys_config(config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) values('Account self-service-whether to enable user registration function', 'sys.account.registerUser', 'false', 'Y', 'admin', getdate(), '', null, 'Whether to enable user registration function (true to enable, false to disable)')
insert into sys_config(config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) values('User login-blacklist list', 'sys.login.blackIPList', '', 'Y', 'admin', getdate(), '', null, 'Set login IP blacklist restrictions, multiple matching items are separated by;, and matching (* wildcard, network segment) is supported')

-- ----------------------------
-- 14. System access records
-- -----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_logininfor') and type = 'U')
drop table sys_logininfor

    go

create table sys_logininfor (
                                info_id        bigint     identity,
                                user_name      varchar(50)    default ''  ,
                                ipaddr         varchar(128)   default ''  ,
                                login_location varchar(255)   default ''  ,
                                browser        varchar(50)    default ''  ,
                                os             varchar(50)    default ''  ,
                                status         char(1)        default '0' ,
                                msg            varchar(255)   default ''  ,
                                login_time     datetime
) with identity_gap = 1

ALTER TABLE sys_logininfor ADD CONSTRAINT PK_SYS_LOGININFOR primary key(info_id)

    go

-- ----------------------------
-- 15. Scheduled Tasks
-- ----------------------------

if exists (select 1 from sysobjects
           where id = object_id('sys_job') and type = 'U')
drop table sys_job

    go

create table sys_job (
                         job_id              bigint  identity,
                         job_name            varchar(64)   default ''        ,
                         job_group           varchar(64)   default 'DEFAULT' ,
                         invoke_target       varchar(500)  not null          ,
                         cron_expression     varchar(255)  default ''        ,
                         misfire_policy      varchar(20)   default '3'       ,
                         concurrent          char(1)       default '1'       ,
                         status              char(1)       default '0'       ,
                         create_by           varchar(64)   default ''        ,
                         create_time         datetime                        ,
                         update_by           varchar(64)   default ''        ,
                         update_time         datetime                        ,
                         remark              varchar(500)  default ''
) with identity_gap = 1

ALTER TABLE sys_job ADD CONSTRAINT PK_SYS_JOB primary key(job_id)

    go

insert into sys_job(job_name,job_group,invoke_target,cron_expression,misfire_policy,concurrent,status,create_by,create_time,update_by,update_time,remark) values('System default (no parameters)', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', getdate(), '', null, '')
insert into sys_job(job_name,job_group,invoke_target,cron_expression,misfire_policy,concurrent,status,create_by,create_time,update_by,update_time,remark) values('System default (with parameters)', 'DEFAULT', 'ryTask.ryParams(ry)', '0/15 * * * * ?', '3', '1', '1', 'admin', getdate(), '', null, '')
insert into sys_job(job_name,job_group,invoke_target,cron_expression,misfire_policy,concurrent,status,create_by,create_time,update_by,update_time,remark) values('System default (multiple parameters)', 'DEFAULT', 'ryTask.ryMultipleParams(ry, true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', getdate(), '', null, '')

-- ----------------------------
-- 16. Scheduled task scheduling log table
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_job_log') and type = 'U')
drop table sys_job_log

    go

create table sys_job_log (
                             job_log_id          bigint     identity,
                             job_name            varchar(64)    not null   ,
                             job_group           varchar(64)    not null   ,
                             invoke_target       varchar(500)   not null   ,
                             job_message         varchar(500)              ,
                             status              char(1)        default '0',
                             exception_info      varchar(2000)  default '' ,
                             create_time         datetime
) with identity_gap = 1

ALTER TABLE sys_job_log ADD CONSTRAINT PK_SYS_JOB_LOG primary key(job_log_id)

    go

-- ----------------------------
-- 17. Notice and Announcement Table
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('sys_notice') and type = 'U')
drop table sys_notice
    go

create table sys_notice (
                            notice_id         int          identity,
                            notice_title      varchar(50)     not null            ,
                            notice_type       char(1)         not null            ,
                            notice_content    varbinary        default null        ,
                            status            char(1)         default '0'         ,
                            create_by         varchar(64)     default ''          ,
                            create_time       datetime                            ,
                            update_by         varchar(64)     default ''          ,
                            update_time       datetime                            ,
                            remark            varchar(255)    default null
) with identity_gap = 1

ALTER TABLE sys_notice ADD CONSTRAINT PK_SYS_NOTICE primary key(notice_id)

    go

-- ----------------------------
-- Initialize-Announcement Information Table Data
-- ----------------------------
insert into sys_notice(notice_title,notice_type,notice_content,status,create_by,create_time,update_by,update_time,remark) values('Warm reminder: 2018-07-01 Ruoyi new version released', '2', 'New version content', '0', 'admin', getdate(), '', null, 'administrator')
insert into sys_notice(notice_title,notice_type,notice_content,status,create_by,create_time,update_by,update_time,remark) values('Maintenance notice: 2018-07-01 Ruoyi system early morning maintenance', '1', 'Maintenance content', '0', 'admin', getdate(), '', null, 'administrator')


-- ----------------------------
-- 18. Code generation business table
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('gen_table') and type = 'U')
drop table gen_table

    go

create table gen_table (
                           table_id          bigint      identity,
                           table_name        varchar(200)    default ''     ,
                           table_comment     varchar(500)    default ''     ,
                           sub_table_name    varchar(64)     default null   ,
                           sub_table_fk_name varchar(64)     default null   ,
                           class_name        varchar(100)    default ''     ,
                           tpl_category      varchar(200)    default 'crud' ,
                           tpl_web_type      varchar(30)     default ''     ,
                           package_name      varchar(100)                   ,
                           module_name       varchar(30)                    ,
                           business_name     varchar(30)                    ,
                           function_name     varchar(50)                    ,
                           function_author   varchar(50)                    ,
                           gen_type          char(1)         default '0'    ,
                           gen_path          varchar(200)    default '/'    ,
                           options           varchar(1000)                  ,
                           create_by         varchar(64)     default ''     ,
                           create_time 	    datetime                       ,
                           update_by         varchar(64)     default ''     ,
                           update_time       datetime                       ,
                           remark            varchar(500)    default null
) with identity_gap = 1

ALTER TABLE gen_table ADD CONSTRAINT PK_GEN_TABLE primary key(table_id)

    go

-- ----------------------------
-- 19. Code to generate business table fields
-- ----------------------------
if exists (select 1 from sysobjects
           where id = object_id('gen_table_column') and type = 'U')
drop table gen_table_column

    go

create table gen_table_column (
                                  column_id         bigint  identity,
                                  table_id          bigint                      ,
                                  column_name       varchar(200)                ,
                                  column_comment    varchar(500)                ,
                                  column_type       varchar(100)                ,
                                  java_type         varchar(500)                ,
                                  java_field        varchar(200)                ,
                                  is_pk             char(1)                     ,
                                  is_increment      char(1)                     ,
                                  is_required       char(1)                     ,
                                  is_insert         char(1)                     ,
                                  is_edit           char(1)                     ,
                                  is_list           char(1)                     ,
                                  is_query          char(1)                     ,
                                  query_type        varchar(200)    default 'EQ',
                                  html_type         varchar(200)                ,
                                  dict_type         varchar(200)    default ''  ,
                                  sort              int                         ,
                                  create_by         varchar(64)     default ''  ,
                                  create_time 	    datetime                    ,
                                  update_by         varchar(64)     default ''  ,
                                  update_time       datetime
) with identity_gap = 1

ALTER TABLE gen_table_column ADD CONSTRAINT PK_GEN_TABLE_COLUMN primary key(column_id)

go