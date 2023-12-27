# springboot-demo

https://github.com/fengwenyi/spring-boot-demo/blob/main/pom.xml

```
docker pull datagrip/sybase

导出镜像文件(方便以后可以直接通过 docker load -i 方式加载进行，就不需要重新pull了)
docker save -o /opt/sybase.tar docker.io/datagrip/sybase:latest


/opt/sybase/OCS-16_0/bin/isql -U sa -P myPassword -S MYSYBASE 


```

## The tool to connect Sybase
[dbeaver安装和使用教程](https://blog.csdn.net/tennysonsky/article/details/122397486?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522170368851716800188596788%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=170368851716800188596788&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~top_positive~default-1-122397486-null-null.142^v99^pc_search_result_base1&utm_term=dbeaver&spm=1018.2226.3001.4187)
dbeaver


https://zh.osdn.net/projects/sfnet_id2d/downloads/jdbc%20drivers/jconn4.jar/

https://github.com/a998151/SpringBoot-MyBatis-SyBase

```
Can't open editor connection

原因：
 JZ006: 捕获到 IO 例外:java.io.IOException: JZ0TS: 试图发送 DBeaver 21.3.2 - SQLEditor <Script-2.sql> 时发生截断错误。
```