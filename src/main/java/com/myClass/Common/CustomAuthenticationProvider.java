package com.myClass.Common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.myClass.Service.UserService;

@SessionAttributes("session")
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {  
	@Autowired
	UserService userService;
	
	
    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
		
		String user_id = (String)authentication.getPrincipal();		
		String user_pw = (String)authentication.getCredentials();
		
		System.out.println("아이디 : " + user_id);
		System.out.println("비밀번호 : " + user_pw);
		
		// check whether user's credentials are valid.
		// if false, throw new BadCredentialsException(messages.getMessage("AbstractUserDetailsAuthenticationProvider.badCredentials", "Bad credentials"));
		
		
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
        roles.add(new SimpleGrantedAuthority("ROLE_USER"));
        
        UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(user_id, user_pw, roles);
        result.setDetails(new CustomUserDetails(user_id, user_pw));
		return result;
        
		
	}
}
