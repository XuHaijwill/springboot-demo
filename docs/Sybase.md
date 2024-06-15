# Sybase 学习指南



> 进入docker sybase
> 
> source /opt/sybase/SYBASE.sh
> 
> --/opt/sybase/OCS-16_0/bin/isql
> 
> isql -Usa -S127.0.0.1:5000 -X -PmyPassword
> 
> myPassword

```
Sybase数据库常用sql语言 https://www.cnblogs.com/lizm166/p/8109169.html
```
## Sybase SQL
```sql
查看所有数据库名称及大小
sp_helpdb
go
6. 查看所有数据库用户登录信息 
sp_helplogins 
查看所有数据库用户所属的角色信息 
sp_helpsrvrolemember 
9.查看数据库里所有的存储过程和函数 
use @database_name 
sp_stored_procedures 
查看存储过程和函数的源代码 
sp_helptext '@procedure_name' 
查看包含某个字符串@str的数据对象名称
select distinct object_name(id) from syscomments where text like '%@str%'
    创建加密的存储过程或函数在AS前面加WITH ENCRYPTION参数 
解密加密过的存储过程和函数可以用sp_decrypt过程 
                                                 
10.查看数据库里用户和进程的信息 
sp_who 
查看SQL Server数据库里的活动用户和进程的信息 
sp_who 'active' 
查看SQL Server数据库里的锁的情况 
sp_lock 
进程号1--50是SQL Server系统内部用的,进程号大于50的才是用户的连接进程. 
spid是进程编号,dbid是数据库编号,objid是数据对象编号 
查看进程正在执行的SQL语句 
dbcc inputbuffer () 
推荐大家用经过改进后的sp_who3过程可以直接看到进程运行的SQL语句 
sp_who3 
检查死锁用sp_who_lock过程 
sp_who_lock 
                                                 
12.分析SQL Server SQL 语句的方法：
set statistics time {on | off}
    set statistics io {on | off}
    图形方式显示查询执行计划
    在查询分析器->查询->显示估计的评估计划(D)-Ctrl-L 或者点击工具栏里的图形
    文本方式显示查询执行计划
    set showplan_all {on | off}
    set showplan_text { on | off }
    set statistics profile { on | off }                                                 
```

sybase 表插入新增数据自增主键 https://blog.51cto.com/u_16175476/10390147

```
创建一个主键约束：
ALTER TABLE your_table_name
ADD CONSTRAINT your_constraint_name
PRIMARY KEY (column1, column2, ...);
创建一个唯一约束：
ALTER TABLE your_table_name
ADD CONSTRAINT your_constraint_name
UNIQUE (column1, column2, ...);
创建一个非聚集索引：

CREATE INDEX your_index_name
ON your_table_name (column1, column2, ...);
创建一个聚集索引：


CREATE CLUSTERED INDEX your_index_name
ON your_table_name (column1, column2, ...);
```

# 分页插件
https://github.com/pagehelper/Mybatis-PageHelper
## Mybatis-plus分页插件 
https://baomidou.com/plugins/pagination/
```java

mybatis plus 分页插件
MyBatis-Plus 分页插件是一个非常实用的工具，它可以帮助开发者简化分页的实现过程。以下是如何配置和使用 MyBatis-Plus 分页插件的步骤：

添加分页插件依赖：

确保你的项目中已经添加了 MyBatis-Plus 的依赖。

配置分页插件：

在 MyBatis-Plus 的配置类中添加分页插件。

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MybatisPlusConfig {
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }
}

```

```java
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Select;
 
public interface UserMapper extends BaseMapper<User> {
    @Select("SELECT * FROM user")
    IPage<User> selectPageVo(Page<?> page);
}
```

```java
Page<User> page = new Page<>(1, 5); // 第1页，每页5条数据
IPage<User> userIPage = userMapper.selectPageVo(page);
```