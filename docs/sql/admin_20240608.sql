-- ----------------------------
-- 1、部门表
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
-- 初始化-部门表数据
-- ----------------------------
select getdate()
--  Explicit value specified for identity field in table 'testdb.dbo.sys_dept' when 'SET IDENTITY_INSERT' is OFF.
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(0,   '0', '若依科技',   0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(100, '0,100',      '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(100, '0,100',      '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(101, '0,100,101',  '研发部门',   1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(101, '0,100,101',  '市场部门',   2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(101, '0,100,101',  '测试部门',   3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(101, '0,100,101',  '财务部门',   4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(101, '0,100,101',  '运维部门',   5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(102, '0,100,102',  '市场部门',   1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)
insert into sys_dept(parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) values(102, '0,100,102',  '财务部门',   2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', getdate(), '', null)

go
-- ----------------------------
-- 2、用户信息表
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
-- 初始化-用户信息表数据
-- ----------------------------
insert into sys_user(dept_id,user_name,nick_name,user_type,email,phonenumber,sex,avatar ,password,status ,del_flag,login_ip,login_date,create_by,create_time,update_by,update_time,remark) values(103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', getdate(), 'admin', getdate(), '', null, '管理员')
insert into sys_user(dept_id,user_name,nick_name,user_type,email,phonenumber,sex,avatar ,password,status ,del_flag,login_ip,login_date,create_by,create_time,update_by,update_time,remark) values(105, 'ry',    '若依', '00', 'ry@qq.com',  '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', getdate(), 'admin', getdate(), '', null, '测试员')

-- ----------------------------
-- 3、岗位信息表
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
-- 初始化-岗位信息表数据
-- ----------------------------
insert into sys_post(post_code,post_name,post_sort,status,create_by,create_time,update_by,update_time,remark) values('ceo',  '董事长',    1, '0', 'admin', getdate(), '', null, '')
insert into sys_post(post_code,post_name,post_sort,status,create_by,create_time,update_by,update_time,remark) values('se',   '项目经理',  2, '0', 'admin', getdate(), '', null, '')
insert into sys_post(post_code,post_name,post_sort,status,create_by,create_time,update_by,update_time,remark) values('hr',   '人力资源',  3, '0', 'admin', getdate(), '', null, '')
insert into sys_post(post_code,post_name,post_sort,status,create_by,create_time,update_by,update_time,remark) values('user', '普通员工',  4, '0', 'admin', getdate(), '', null, '')

-- ----------------------------
-- 4、角色信息表
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
-- 初始化-角色信息表数据
-- ----------------------------
insert into sys_role(role_name,role_key,role_sort,data_scope,menu_check_strictly,dept_check_strictly,status,del_flag,create_by,create_time,update_by,update_time,remark) values('超级管理员',  'admin',  1, '1', 1, 1, '0', '0', 'admin', getdate(), '', null, '超级管理员')
insert into sys_role(role_name,role_key,role_sort,data_scope,menu_check_strictly,dept_check_strictly,status,del_flag,create_by,create_time,update_by,update_time,remark) values('普通角色',    'common', 2, '2', 1, 1, '0', '0', 'admin', getdate(), '', null, '普通角色')

-- ----------------------------
-- 5、菜单权限表
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
-- 初始化-菜单信息表数据
-- ----------------------------
-- 一级菜单
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('系统管理', 0, 1, 'system',           null, '', 1, 0, 'M', '0', '0', '', 'system',   'admin', getdate(), '', null, '系统管理目录')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('系统监控', 0, 2, 'monitor',          null, '', 1, 0, 'M', '0', '0', '', 'monitor',  'admin', getdate(), '', null, '系统监控目录')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('系统工具', 0, 3, 'tool',             null, '', 1, 0, 'M', '0', '0', '', 'tool',     'admin', getdate(), '', null, '系统工具目录')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('若依官网', 0, 4, 'http://ruoyi.vip', null, '', 0, 0, 'M', '0', '0', '', 'guide',    'admin', getdate(), '', null, '若依官网地址')
-- 二级菜单
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('用户管理', 1,   1, 'user',       'system/user/index',        '', 1, 0, 'C', '0', '0', 'system:user:list',        'user',          'admin', getdate(), '', null, '用户管理菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('角色管理', 1,   2, 'role',       'system/role/index',        '', 1, 0, 'C', '0', '0', 'system:role:list',        'peoples',       'admin', getdate(), '', null, '角色管理菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('菜单管理', 1,   3, 'menu',       'system/menu/index',        '', 1, 0, 'C', '0', '0', 'system:menu:list',        'tree-table',    'admin', getdate(), '', null, '菜单管理菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('部门管理', 1,   4, 'dept',       'system/dept/index',        '', 1, 0, 'C', '0', '0', 'system:dept:list',        'tree',          'admin', getdate(), '', null, '部门管理菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('岗位管理', 1,   5, 'post',       'system/post/index',        '', 1, 0, 'C', '0', '0', 'system:post:list',        'post',          'admin', getdate(), '', null, '岗位管理菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('字典管理', 1,   6, 'dict',       'system/dict/index',        '', 1, 0, 'C', '0', '0', 'system:dict:list',        'dict',          'admin', getdate(), '', null, '字典管理菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('参数设置', 1,   7, 'config',     'system/config/index',      '', 1, 0, 'C', '0', '0', 'system:config:list',      'edit',          'admin', getdate(), '', null, '参数设置菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('通知公告', 1,   8, 'notice',     'system/notice/index',      '', 1, 0, 'C', '0', '0', 'system:notice:list',      'message',       'admin', getdate(), '', null, '通知公告菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('日志管理', 1,   9, 'log',        '',                         '', 1, 0, 'M', '0', '0', '',                        'log',           'admin', getdate(), '', null, '日志管理菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('在线用户', 2,   1, 'online',     'monitor/online/index',     '', 1, 0, 'C', '0', '0', 'monitor:online:list',     'online',        'admin', getdate(), '', null, '在线用户菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('定时任务', 2,   2, 'job',        'monitor/job/index',        '', 1, 0, 'C', '0', '0', 'monitor:job:list',        'job',           'admin', getdate(), '', null, '定时任务菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('数据监控', 2,   3, 'druid',      'monitor/druid/index',      '', 1, 0, 'C', '0', '0', 'monitor:druid:list',      'druid',         'admin', getdate(), '', null, '数据监控菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('服务监控', 2,   4, 'server',     'monitor/server/index',     '', 1, 0, 'C', '0', '0', 'monitor:server:list',     'server',        'admin', getdate(), '', null, '服务监控菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('缓存监控', 2,   5, 'cache',      'monitor/cache/index',      '', 1, 0, 'C', '0', '0', 'monitor:cache:list',      'redis',         'admin', getdate(), '', null, '缓存监控菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('缓存列表', 2,   6, 'cacheList',  'monitor/cache/list',       '', 1, 0, 'C', '0', '0', 'monitor:cache:list',      'redis-list',    'admin', getdate(), '', null, '缓存列表菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('表单构建', 3,   1, 'build',      'tool/build/index',         '', 1, 0, 'C', '0', '0', 'tool:build:list',         'build',         'admin', getdate(), '', null, '表单构建菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('代码生成', 3,   2, 'gen',        'tool/gen/index',           '', 1, 0, 'C', '0', '0', 'tool:gen:list',           'code',          'admin', getdate(), '', null, '代码生成菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('系统接口', 3,   3, 'swagger',    'tool/swagger/index',       '', 1, 0, 'C', '0', '0', 'tool:swagger:list',       'swagger',       'admin', getdate(), '', null, '系统接口菜单')
-- 三级菜单
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('操作日志', 108, 1, 'operlog',    'monitor/operlog/index',    '', 1, 0, 'C', '0', '0', 'monitor:operlog:list',    'form',          'admin', getdate(), '', null, '操作日志菜单')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor',    'admin', getdate(), '', null, '登录日志菜单')
-- 用户管理按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('用户查询', 100, 1,  '', '', '', 1, 0, 'F', '0', '0', 'system:user:query',          '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('用户新增', 100, 2,  '', '', '', 1, 0, 'F', '0', '0', 'system:user:add',            '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('用户修改', 100, 3,  '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit',           '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('用户删除', 100, 4,  '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove',         '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('用户导出', 100, 5,  '', '', '', 1, 0, 'F', '0', '0', 'system:user:export',         '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('用户导入', 100, 6,  '', '', '', 1, 0, 'F', '0', '0', 'system:user:import',         '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('重置密码', 100, 7,  '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd',       '#', 'admin', getdate(), '', null, '')
-- 角色管理按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('角色查询', 101, 1,  '', '', '', 1, 0, 'F', '0', '0', 'system:role:query',          '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('角色新增', 101, 2,  '', '', '', 1, 0, 'F', '0', '0', 'system:role:add',            '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('角色修改', 101, 3,  '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit',           '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('角色删除', 101, 4,  '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove',         '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('角色导出', 101, 5,  '', '', '', 1, 0, 'F', '0', '0', 'system:role:export',         '#', 'admin', getdate(), '', null, '')
-- 菜单管理按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('菜单查询', 102, 1,  '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query',          '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('菜单新增', 102, 2,  '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add',            '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('菜单修改', 102, 3,  '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit',           '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('菜单删除', 102, 4,  '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove',         '#', 'admin', getdate(), '', null, '')
-- 部门管理按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('部门查询', 103, 1,  '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query',          '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('部门新增', 103, 2,  '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add',            '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('部门修改', 103, 3,  '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit',           '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('部门删除', 103, 4,  '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove',         '#', 'admin', getdate(), '', null, '')
-- 岗位管理按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('岗位查询', 104, 1,  '', '', '', 1, 0, 'F', '0', '0', 'system:post:query',          '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('岗位新增', 104, 2,  '', '', '', 1, 0, 'F', '0', '0', 'system:post:add',            '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('岗位修改', 104, 3,  '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit',           '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('岗位删除', 104, 4,  '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove',         '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('岗位导出', 104, 5,  '', '', '', 1, 0, 'F', '0', '0', 'system:post:export',         '#', 'admin', getdate(), '', null, '')
-- 字典管理按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query',          '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add',            '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit',           '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove',         '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export',         '#', 'admin', getdate(), '', null, '')
-- 参数设置按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query',        '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add',          '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit',         '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove',       '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export',       '#', 'admin', getdate(), '', null, '')
-- 通知公告按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query',        '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add',          '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit',         '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove',       '#', 'admin', getdate(), '', null, '')
-- 操作日志按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query',      '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove',     '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export',     '#', 'admin', getdate(), '', null, '')
-- 登录日志按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query',   '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove',  '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export',  '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock',  '#', 'admin', getdate(), '', null, '')
-- 在线用户按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query',       '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', getdate(), '', null, '')
-- 定时任务按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query',          '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add',            '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit',           '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove',         '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus',   '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export',         '#', 'admin', getdate(), '', null, '')
-- 代码生成按钮
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query',             '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit',              '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove',            '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import',            '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview',           '#', 'admin', getdate(), '', null, '')
insert into sys_menu(menu_name,parent_id,order_num,path,component,query,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) values('生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code',              '#', 'admin', getdate(), '', null, '')

-- ----------------------------
-- 6、用户和角色关联表  用户N-1角色
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
-- 初始化-用户和角色关联表数据
-- ----------------------------
insert into sys_user_role(user_id,role_id) values (1, 1)
insert into sys_user_role(user_id,role_id) values (2, 2)

-- ----------------------------
-- 7、角色和菜单关联表  角色1-N菜单
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
-- 初始化-角色和菜单关联表数据
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
-- 8、角色和部门关联表  角色1-N部门
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
-- 初始化-角色和部门关联表数据
-- ----------------------------
insert into sys_role_dept(role_id,dept_id) values (2, 100)
insert into sys_role_dept(role_id,dept_id) values (2, 101)
insert into sys_role_dept(role_id,dept_id) values (2, 105)

-- ----------------------------
-- 9、用户与岗位关联表  用户1-N岗位
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
-- 初始化-用户与岗位关联表数据
-- ----------------------------
insert into sys_user_post(user_id, post_id) values (1, 1)
insert into sys_user_post(user_id, post_id) values (2, 2)

-- ----------------------------
-- 10、操作日志记录
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
-- 11、字典类型表
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

insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('用户性别', 'sys_user_sex',        '0', 'admin', getdate(), '', null, '用户性别列表')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('菜单状态', 'sys_show_hide',       '0', 'admin', getdate(), '', null, '菜单状态列表')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('系统开关', 'sys_normal_disable',  '0', 'admin', getdate(), '', null, '系统开关列表')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('任务状态', 'sys_job_status',      '0', 'admin', getdate(), '', null, '任务状态列表')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('任务分组', 'sys_job_group',       '0', 'admin', getdate(), '', null, '任务分组列表')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('系统是否', 'sys_yes_no',          '0', 'admin', getdate(), '', null, '系统是否列表')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('通知类型', 'sys_notice_type',     '0', 'admin', getdate(), '', null, '通知类型列表')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('通知状态', 'sys_notice_status',   '0', 'admin', getdate(), '', null, '通知状态列表')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('操作类型', 'sys_oper_type',       '0', 'admin', getdate(), '', null, '操作类型列表')
insert into sys_dict_type(dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) values('系统状态', 'sys_common_status',   '0', 'admin', getdate(), '', null, '登录状态列表')

-- ----------------------------
-- 12、字典数据表
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

insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values(  1,  '男',       '0',       'sys_user_sex',        '',   '',        'Y', '0', 'admin', getdate(), '', null, '性别男')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values(  2,  '女',       '1',       'sys_user_sex',        '',   '',        'N', '0', 'admin', getdate(), '', null, '性别女')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values(  3,  '未知',     '2',       'sys_user_sex',        '',   '',        'N', '0', 'admin', getdate(), '', null, '性别未知')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values(  1,  '显示',     '0',       'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', getdate(), '', null, '显示菜单')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values(  2,  '隐藏',     '1',       'sys_show_hide',       '',   'danger',  'N', '0', 'admin', getdate(), '', null, '隐藏菜单')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values(  1,  '正常',     '0',       'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', getdate(), '', null, '正常状态')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values(  2,  '停用',     '1',       'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', getdate(), '', null, '停用状态')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values(  1,  '正常',     '0',       'sys_job_status',      '',   'primary', 'Y', '0', 'admin', getdate(), '', null, '正常状态')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values(  2,  '暂停',     '1',       'sys_job_status',      '',   'danger',  'N', '0', 'admin', getdate(), '', null, '停用状态')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1,  '默认',     'DEFAULT', 'sys_job_group',       '',   '',        'Y', '0', 'admin', getdate(), '', null, '默认分组')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2,  '系统',     'SYSTEM',  'sys_job_group',       '',   '',        'N', '0', 'admin', getdate(), '', null, '系统分组')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1,  '是',       'Y',       'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', getdate(), '', null, '系统默认是')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2,  '否',       'N',       'sys_yes_no',          '',   'danger',  'N', '0', 'admin', getdate(), '', null, '系统默认否')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1,  '通知',     '1',       'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', getdate(), '', null, '通知')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2,  '公告',     '2',       'sys_notice_type',     '',   'success', 'N', '0', 'admin', getdate(), '', null, '公告')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1,  '正常',     '0',       'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', getdate(), '', null, '正常状态')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2,  '关闭',     '1',       'sys_notice_status',   '',   'danger',  'N', '0', 'admin', getdate(), '', null, '关闭状态')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 99, '其他',     '0',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', getdate(), '', null, '其他操作')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1,  '新增',     '1',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', getdate(), '', null, '新增操作')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2,  '修改',     '2',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', getdate(), '', null, '修改操作')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 3,  '删除',     '3',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', getdate(), '', null, '删除操作')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 4,  '授权',     '4',       'sys_oper_type',       '',   'primary', 'N', '0', 'admin', getdate(), '', null, '授权操作')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 5,  '导出',     '5',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', getdate(), '', null, '导出操作')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 6,  '导入',     '6',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', getdate(), '', null, '导入操作')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 7,  '强退',     '7',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', getdate(), '', null, '强退操作')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 8,  '生成代码', '8',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', getdate(), '', null, '生成操作')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 9,  '清空数据', '9',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', getdate(), '', null, '清空操作')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 1,  '成功',     '0',       'sys_common_status',   '',   'primary', 'N', '0', 'admin', getdate(), '', null, '正常状态')
insert into sys_dict_data(dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) values( 2,  '失败',     '1',       'sys_common_status',   '',   'danger',  'N', '0', 'admin', getdate(), '', null, '停用状态')

-- ----------------------------
-- 13、参数配置表
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

insert into sys_config(config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) values('主框架页-默认皮肤样式名称',     'sys.index.skinName',            'skin-blue',     'Y', 'admin', getdate(), '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow' )
insert into sys_config(config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) values('用户管理-账号初始密码',         'sys.user.initPassword',         '123456',        'Y', 'admin', getdate(), '', null, '初始化密码 123456' )
insert into sys_config(config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) values('主框架页-侧边栏主题',           'sys.index.sideTheme',           'theme-dark',    'Y', 'admin', getdate(), '', null, '深色主题theme-dark，浅色主题theme-light' )
insert into sys_config(config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) values('账号自助-验证码开关',           'sys.account.captchaEnabled',    'true',          'Y', 'admin', getdate(), '', null, '是否开启验证码功能（true开启，false关闭）')
insert into sys_config(config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) values('账号自助-是否开启用户注册功能', 'sys.account.registerUser',      'false',         'Y', 'admin', getdate(), '', null, '是否开启注册用户功能（true开启，false关闭）')
insert into sys_config(config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) values('用户登录-黑名单列表',           'sys.login.blackIPList',         '',              'Y', 'admin', getdate(), '', null, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）')

-- ----------------------------
-- 14、系统访问记录
-- ----------------------------
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
-- 15、定时任务调度表
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

insert into sys_job(job_name,job_group,invoke_target,cron_expression,misfire_policy,concurrent,status,create_by,create_time,update_by,update_time,remark) values('系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams',        '0/10 * * * * ?', '3', '1', '1', 'admin', getdate(), '', null, '')
insert into sys_job(job_name,job_group,invoke_target,cron_expression,misfire_policy,concurrent,status,create_by,create_time,update_by,update_time,remark) values('系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(ry)',  '0/15 * * * * ?', '3', '1', '1', 'admin', getdate(), '', null, '')
insert into sys_job(job_name,job_group,invoke_target,cron_expression,misfire_policy,concurrent,status,create_by,create_time,update_by,update_time,remark) values('系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(ry, true, 2000L, 316.50D, 100)',  '0/20 * * * * ?', '3', '1', '1', 'admin', getdate(), '', null, '')

-- ----------------------------
-- 16、定时任务调度日志表
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
-- 17、通知公告表
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
-- 初始化-公告信息表数据
-- ----------------------------
insert into sys_notice(notice_title,notice_type,notice_content,status,create_by,create_time,update_by,update_time,remark) values('温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', getdate(), '', null, '管理员')
insert into sys_notice(notice_title,notice_type,notice_content,status,create_by,create_time,update_by,update_time,remark) values('维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容',   '0', 'admin', getdate(), '', null, '管理员')

-- ----------------------------
-- 18、代码生成业务表
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
-- 19、代码生成业务表字段
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