package com.myClass.CommonController;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myClass.Dao.UserDao;
import com.myClass.Model.Member;
import com.myClass.Service.UserService;

@Controller
public class HomeController {
	@Autowired
	UserService userService;
	
	
	@RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/login");
		
		return mav;
	}
	
	@RequestMapping(value="/signup", method = RequestMethod.GET)
	public ModelAndView signUp () {
		ModelAndView mav = new ModelAndView("/user/signup");
		return mav;
	}
	
	@RequestMapping(value = "/loginProc", method = RequestMethod.GET)
	@ResponseBody
	public Object login(
			@RequestParam(value="memId", required=true) String memId,
			HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println(memId);
		Member member = userService.login(memId);
		
		return member;
	}

}
