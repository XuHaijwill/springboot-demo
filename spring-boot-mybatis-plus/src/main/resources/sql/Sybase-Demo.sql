create table t_user_2
(
    id        bigint       not null
        constraint PK_T_USER_2_ID
            primary key,
    create_date_time datetime NULL,
    create_user_id bigint NULL,
    create_user_name varchar(255) NULL,
    update_date_time datetime NULL,
    update_user_id bigint NULL,
    update_user_name varchar(255) NULL,
    enabled_state tinyint NULL,
    deleted_state tinyint NULL,
    erwin_id varchar(255) NULL,
    password varchar(255) NULL,
    phone varchar(20) NULL,
    nickname varchar(255) NULL,
    sex tinyint NULL,
    avatar varchar(255) NULL,
    locked_state tinyint NULL
)
    go

create table t_goods_2
(
    id        bigint       not null
        constraint PK_T_GOODS_2_ID
            primary key,
    create_date_time datetime NULL,
    create_user_id bigint NULL,
    create_user_name varchar(255) NULL,
    update_date_time datetime NULL,
    update_user_id bigint NULL,
    update_user_name varchar(255) NULL,

    enabled_state tinyint NULL,
    deleted_state tinyint NULL,
    name varchar(255) NULL,

    price decimal(11,2) NULL
)
    go


create table t_role_2
(
    id        bigint       not null
        constraint PK_T_ROLE_2_ID
            primary key,
    create_date_time datetime NULL,
    create_user_id bigint NULL,
    create_user_name varchar(255) NULL,
    update_date_time datetime NULL,
    update_user_id bigint NULL,
    update_user_name varchar(255) NULL,

    enabled_state tinyint NULL,
    deleted_state tinyint NULL,

    role_code varchar(255) NULL,
    role_name varchar(255) NULL
)
    go

create table t_user_role_2
(
    id        bigint       not null
        constraint PK_T_USER_ROLE_2_ID
            primary key,
    create_date_time datetime NULL,
    create_user_id bigint NULL,
    create_user_name varchar(255) NULL,
    update_date_time datetime NULL,
    update_user_id bigint NULL,
    update_user_name varchar(255) NULL,

    enabled_state tinyint NULL,
    deleted_state tinyint NULL,

    user_id bigint NULL,
    role_id bigint NULL
)
    go

create table t_log_2
(
    id        bigint       not null
        constraint PK_T_LOG_2_ID
            primary key,
    create_date_time datetime NULL,
    create_user_id bigint NULL,
    create_user_name varchar(255) NULL,
    update_date_time datetime NULL,
    update_user_id bigint NULL,
    update_user_name varchar(255) NULL,

    log_key varchar(255) NULL,
    biz_id varchar(255) NULL,
    msg varchar(255) NULL,
    data varchar(255) NULL,
    error varchar(255) NULL
)
    go