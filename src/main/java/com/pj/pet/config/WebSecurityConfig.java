package com.pj.pet.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	@Override
	public void configure(WebSecurity web) throws Exception {
		// security 필터에서 벗어날 파일들을 설정한다.
		web.ignoring()
		.antMatchers("/resources/**");
		// resources 모든 접근을 허용하는 설정을 해버리면
		// HttpSecurity 설정한 Admin권한을 가진 사용자만 resources 접근가능한 설정을 무시해버린다.
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// 특정 권한을 가진 사용자만 접근 가능하게 설정할 수 있음
		http
			.authorizeRequests()
					.antMatchers("/").permitAll() //index화면은 권한없는 사람도 볼 수 있어야 하니까
					.antMatchers("/user/**", "/resources/**").permitAll() //회원가입, 로그인도 권한 없는 사람이 접근할 수 있어야 하니까
					// antMatchers 설정한 리소스의 접근을 인증절차 없이 허용한다는 의미 입니다.
					
					//.antMatchers("/admin/**").hasAnyRole("ADMIN") //관리자 페이지는 관리자만 접근할 수 있어야 하니까
					//이 때 role을 admin으로 설정하기 위해 roleVo가 필요하다..
					//리소스 admin으로 시작하는 모든 URL은 인증후 ADMIN 레벨의 권한을 가진 사용자만 접근을 허용한다는 의미입니다.
					.anyRequest().authenticated()
					.and()
				.formLogin()
					.loginPage("/user/login")
					.successForwardUrl("/") //login 성공시 이동할 url
					.permitAll()
					.and()
				.rememberMe()
					.tokenValiditySeconds(2592000)
					.key("rememberKey")
					.and()
				.logout()
					.logoutRequestMatcher(new AntPathRequestMatcher("/user/logout"))
					.logoutSuccessUrl("/")
					.invalidateHttpSession(true)
					.deleteCookies("JSESSIONID")
						.permitAll();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	public class MyLoginSuccessHandler implements AuthenticationSuccessHandler{
		@Override
		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
				Authentication authentication) throws IOException, ServletException {
			HttpSession session = request.getSession();
			
			/* session.setAttribute("greeting", authentication.getName()+"님 반갑습니다."); */
			
			response.sendRedirect("/");
			
		}
	}
}
