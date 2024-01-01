
## Reason: Failed to determine suitable jdbc url 问题解决
> 错误原因
> 在pom中引入了mybatis-spring-boot-starter ，Spring boot默认会加载org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration类，DataSourceAutoConfiguration类使用了@Configuration注解向spring注入了dataSource bean。因为工程中没有关于dataSource相关的配置信息，当spring创建dataSource bean因缺少相关的信息就会报错。
> 解决错误
> 第一种方法： 在Spring boot的启动引导类上增加@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})，阻止Spring boot自动注入dataSource
> 第二种方法：
> @Configuration
>public class ServerConfiguration {
>    @Bean
>    @Primary
>    @ConfigurationProperties(prefix = "spring.datasource")
>    public DataSource dataSource() {
>        // 配置数据源（注意，我使用的是 HikariCP 连接池），以上注解是指定数据源，否则会有冲突
>        return DataSourceBuilder.create().build();
>    }
> }