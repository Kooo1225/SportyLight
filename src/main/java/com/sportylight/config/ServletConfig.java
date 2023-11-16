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
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		registry.viewResolver(bean);
	}
	
	// name 이 없으면 Return Type의 camelCase로 정의 되는데 뭐 그게 안대서 강제로 해놨다라고함;
	@Bean(name="multipartResolver")
	public CommonsMultipartResolver getResolver() throws IOException {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		
		// 파일의 여러개 업로드 할 때 전체의 최대 크기
//		resolver.setMaxUploadSize(1024*1024*10); // 10MB
		resolver.setMaxUploadSize(-1);
		
		// 파일 한 개의 크기
//		resolver.setMaxUploadSizePerFile(1024*1024*2);	// 2MB
		resolver.setMaxUploadSizePerFile(-1);
		
		// 지정한 크기 까지는 메모리에서 처리하겠다 라는 구문
		resolver.setMaxInMemorySize(1024*1024*10); // 10MB
		
		// 지정한 크기보다 더 큰 파일이 업로드 됐을 때는 지정한 디렉토리에서 임시로 보관하겠다
		// 임시 디렉토리라서 그런지 잘 안보임..
		resolver.setUploadTempDir(new FileSystemResource("c:/upload/tmp"));
		resolver.setDefaultEncoding("UTF-8");
		
		return resolver;
		
	}

}