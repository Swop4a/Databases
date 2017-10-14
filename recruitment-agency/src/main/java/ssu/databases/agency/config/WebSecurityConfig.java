package ssu.databases.agency.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import ssu.databases.agency.model.enums.Role;

/**
 * Created by Swop4a on 16.05.2017.
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	public void registerGlobalAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.inMemoryAuthentication()
			.withUser("customer").password("qwerty").roles(Role.CUSTOMER.name())
				.and()
			.withUser("company").password("qwerty").roles(Role.COMPANY.name());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
//		http
//			.csrf().disable()								//read about csrf
//			.authorizeRequests()
//				.antMatchers("/").permitAll()
//				.anyRequest().authenticated()
//				.and()
//			.formLogin()
//				.loginPage("/index")
//				.loginProcessingUrl("/login_check")
//				.successForwardUrl("/page")
//				.usernameParameter("username")
//				.passwordParameter("password")
//				.permitAll()
//				.and()
//			.logout()
//				.permitAll();

		//TODO: find the difference between upper and lower versions. To understand why upper is work, but lower isn't

		http
			.csrf().disable()
			.authorizeRequests()
			.antMatchers(
				"/resources/**", "/"
			).permitAll()
			.anyRequest().authenticated().and()
		.formLogin()
			.loginPage("/")
			.successForwardUrl("/auth")
			.failureUrl("/login?error")
			.loginProcessingUrl("/login_check")
			.usernameParameter("username")
			.passwordParameter("password")
			.permitAll().and()
		.logout()
			.permitAll()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/");
//			.invalidateHttpSession(true);
	}
}
