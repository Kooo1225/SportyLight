package com.sportylight.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@ComponentScan(basePackages = {"com.sportylight.controller", "com.sportylight.service"})
@MapperScan(basePackages = {"com.sportylight.mapper"})
public class RootConfig {

	@Autowired
	ApplicationContext applicationContext;

	@Bean
	public DataSourceTransactionManager transactionManager() {
		DataSourceTransactionManager manager = new DataSourceTransactionManager(dataSource());
		
		return manager;
	}
	
	@Bean
	public DataSource dataSource() {
		HikariConfig config = new HikariConfig();
		config.setDriverClassName("com.mysql.cj.jdbc.Driver");
		config.setJdbcUrl("jdbc:mysql://localhost:3306/sportylight_test_db");
		
		config.setUsername("sportylight");
		config.setPassword("1234");

//		config.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
//		config.setJdbcUrl("jdbc:log4jdbc:mysql://106.10.32.142:3306/sportylight_db");
//
//		config.setUsername("sportylight");
//		config.setPassword("Sportylight1!");

		HikariDataSource dataSource = new HikariDataSource(config);
		return dataSource;

	}

	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();

		sqlSessionFactory.setConfigLocation(applicationContext.getResource("classpath:/mybatis-config.xml"));

		// dataSource() 메서드가 등록한 Bean 값을 리턴해라 라는 뜻
		sqlSessionFactory.setDataSource(dataSource());
		return (SqlSessionFactory) sqlSessionFactory.getObject();
	}
	
}
