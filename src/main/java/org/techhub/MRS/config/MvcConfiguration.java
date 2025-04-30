package org.techhub.MRS.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages = "org.techhub.MRS")
@EnableWebMvc
public class MvcConfiguration implements WebMvcConfigurer {

	@Bean
	public ViewResolver getViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	/*
	 * @Bean(name = "dataSource") public DriverManagerDataSource getdatasource() {
	 * DriverManagerDataSource datasource = new DriverManagerDataSource();
	 * datasource.setDriverClassName("com.mysql.cj.jdbc.Driver");
	 * datasource.setPassword("Nihal@123");
	 * datasource.setUrl("jdbc:mysql://localhost:3306/moviewebsystem");
	 * datasource.setUsername("root"); return datasource; }
	 */
	@Bean(name = "dataSource")
	public DriverManagerDataSource getdatasource() {
		DriverManagerDataSource datasource = new DriverManagerDataSource();
		datasource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		datasource.setPassword("f&Aq;Okf?Cku");
		datasource.setUrl("jdbc:mysql://localhost:3306/smprowor_moviewebsystem");
		datasource.setUsername("smprowor_sangram");
		return datasource;
	}

	@Bean(name = "template")
	public JdbcTemplate getTemplate() {

		JdbcTemplate template = new JdbcTemplate();
		template.setDataSource(this.getdatasource());
		return template;
	}

	// @Bean
//	public MultipartResolver multipartResolver() {
//		return new StandardServletMultipartResolver();
//
//	}
	@Bean
	public MultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
		// resolver.(10485760); // 10 MB
		// return resolver;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

}
