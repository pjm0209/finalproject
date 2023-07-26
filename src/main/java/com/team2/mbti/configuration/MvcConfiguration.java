package com.team2.mbti.configuration;

import org.springframework.context.annotation.Configuration;
//import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		/*
		 * registry.addInterceptor(new LoginInterceptor())
		 * .addPathPatterns("/shop/cart/*", "/shop/order/*",
		 * "/member/memberEdit","/member/memberOut");
		 * 
		 * registry.addInterceptor(new AdminLoginInterceptor())
		 * .excludePathPatterns("/admin/login/adminLogin")
		 * .addPathPatterns("/admin/**");
		 */


	}

	/*
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver 
		= new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8"); // 파일 인코딩 설정
		multipartResolver.setMaxUploadSizePerFile(2 * 1024 * 1024); // 파일당 업로드 크기 제한 (2MB)
		return multipartResolver;
	}
*/
	
	//리액트 - 쿠키 적용
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
		.allowedOrigins("http://localhost:3000")
		.allowedMethods("GET", "POST")
		.allowCredentials(true);
	}

	/*
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/pd_images/**").addResourceLocations("file:///C:/lecture/pd_images/");
		
	}
*/	
}