package com.sportylight.config;

import java.io.IOException;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.FileSystemResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

// Dispatcher 활성화
@EnableWebMvc
@ComponentScan(basePackages = { "com.sportylight.controller", "com.sportylight.exception"})
public class ServletConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		System.out.println("ResourceHandler done");
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		System.out.println("Resolver Done");
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		registry.viewResolver(bean);
	}
	
	@Bean(name="multipartResolver")
	public CommonsMultipartResolver getResolver() throws IOException {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		
		resolver.setMaxUploadSize(-1);
		resolver.setMaxUploadSizePerFile(-1);
		resolver.setMaxInMemorySize(1024*1024*10); // 10MB
		
		resolver.setUploadTempDir(new FileSystemResource("c:\\upload\\tmp"));
		resolver.setDefaultEncoding("UTF-8");
		
		return resolver;
	}
	
//	@Bean
//	public JavaMailSenderImpl mailSender() {
//	    JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
//	    mailSender.setHost("smtp.gmail.com");
//	    mailSender.setPort(587);
//	    mailSender.setUsername("sportylight4@gmail.com");
//	    mailSender.setPassword("pqohkitdoqnqjhvg"); 
//	    mailSender.setDefaultEncoding("utf-8");
//
//	    Properties javaMailProperties = new Properties();
//	    javaMailProperties.put("mail.transport.protocol", "smtp");
//	    javaMailProperties.put("mail.smtp.auth", "true");
//	    javaMailProperties.put("mail.smtp.starttls.enable", "true");
//	    javaMailProperties.put("mail.debug", "true");
//
//	    mailSender.setJavaMailProperties(javaMailProperties);
//
//	    return mailSender;
//	}
}