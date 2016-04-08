package com.myClass.CommonController;

import java.security.Principal;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.myClass.Model.Member;
import com.myClass.Service.UserService;

@Controller
@SessionAttributes("session")
public class HomeController {
	@Autowired
	UserService userService;
	
	public Member getUser() {
		return (Member) SecurityContextHolder.getContext().getAuthentication().getDetails();
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/login");
		return mav;
	}
	
	@RequestMapping(value="/signup", method = RequestMethod.GET)
	public ModelAndView signUp (HttpSession session) {
		ModelAndView mav = new ModelAndView("/user/signup");
		return mav;
	}
	
	@RequestMapping(value= {"/", "/main"}, method = RequestMethod.GET)
	public ModelAndView main (
			HttpSession session,Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		
		Member member = userService.get(principal.getName());
		
		
		ModelAndView mav = new ModelAndView("/common/main");
		session.setAttribute("member", member);
		mav.addObject("member", member);
		return mav;
	}
	
	@RequestMapping(value="/setting", method = RequestMethod.GET)
	public ModelAndView setting (
			Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/common/setting");
		
		Member member = userService.get(principal.getName());
		mav.addObject("member", member);
		return mav;
	}

}
