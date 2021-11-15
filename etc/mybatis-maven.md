# Mybaits : <https://mybatis.org/>

* * *
#### 1. code flow of mybatis

```bash
1) pom.xml
  setting mybaits
2) web.xml
  setting servlet-context.xml
3) servlet-context.xml
  - setting beans that are dataSource, sqlSessionFactory, sqlSession
  - setting mapper.xml(sel query) using mapperLocations in sqlSessionFactory bean
4) setting mapper.xml(sel query)
  - namespace : full path of interfacedao class
  - resultType : full path of dto class
  - id : a name of this query
5) DTO class
  - setting dto class
  - default Constructor required (None arguments)
  - getters and setters
6) DAO interface
  declare id of mapper(query) (in step4)
7) impl class
  call mapper(sql query)
```

* * *
#### 2. code example
#### 1) pom.xml
```bash
		<!--# JDBC connector -->
		<!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
		<dependency>
		    <groupId>mysql</groupId>
		    <artifactId>mysql-connector-java</artifactId>
		    <version>8.0.25</version>
		</dependency>
				
		<!-- https://mvnrepository.com/artifact/org.postgresql/postgresql -->
		<dependency>
		    <groupId>org.postgresql</groupId>
		    <artifactId>postgresql</artifactId>
		    <version>42.2.23</version>
		</dependency>

		<!--# mybatis -->
		<dependency>
			<groupId>org.mybatis</groupId>
			<artifactId>mybatis-spring</artifactId>
			<version>1.2.2</version>
		</dependency>
		<dependency>
			<groupId>org.mybatis</groupId>
			<artifactId>mybatis</artifactId>
			<version>3.2.8</version>
		</dependency>
		<!-- https://mvnrepository.com/artifact/org.apache.ibatis/ibatis-sqlmap -->
		<dependency>
			<groupId>org.apache.ibatis</groupId>
			<artifactId>ibatis-sqlmap</artifactId>
			<version>2.3.4.726</version>
		</dependency>

```

#### 2) web.xml
```bash
	<!-- Processes application requests -->
	<servlet>
		<servlet-name>appServlet</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<!-- <param-value>/WEB-INF/spring/appServlet/*-context.xml</param-value> -->
			<param-value>/WEB-INF/spring/appServlet/servlet-context.xml</param-value>
		</init-param>
		<load-on-startup>1</load-on-startup>
	</servlet>
```

#### 3) servlet-context.xml
```bash
    <beans:bean id="dataSource"
        class="org.springframework.jdbc.datasource.DriverManagerDataSource">
        <beans:property name="driverClassName"
            value="com.mysql.jdbc.Driver" />
        <beans:property name="url"
            value="jdbc:mysql://127.0.0.1:3306/testDB" />
        <beans:property name="username" value="maria" />
        <beans:property name="password" value="maria" />
    </beans:bean>

    <beans:bean id="sqlSessionFactory"
        class="org.mybatis.spring.SqlSessionFactoryBean">
        <beans:property name="dataSource" ref="dataSource"></beans:property>
        <beans:property name="mapperLocations"
            value="classpath:com/spring/test/mapper/*.xml"></beans:property>
    </beans:bean>

    <beans:bean id="sqlSession"
        class="org.mybatis.spring.SqlSessionTemplate">
        <beans:constructor-arg index="0"
            ref="sqlSessionFactory"></beans:constructor-arg>
    </beans:bean>
```

#### 4) mapper.xml(sel query)
```bash
<!-- mariadb -->
<mapper namespace="com.spring.test.dao.InterfaceDao">
  <select id="listDao" resultType="com.spring.test.dto.MemberDto">
    SELECT id, name, title FROM test_table
  </select>
</mapper>
```

#### 5) DTO class
```bash
public class MemberDto {

	private int id;
	private String name;
	private String title;
	
	public MemberDto() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
```

#### 6) DAO interface
```bash
public interface InterfaceDao {

	public ArrayList<MemberDto> listDao();
	public ArrayList<AccountDto> accountListDao();
}
```

#### 7) impl class
```bash
		InterfaceDao MemberSession = sqlSession.getMapper(InterfaceDao.class);
		model.addAttribute("memberList", MemberSession.listDao());
```
