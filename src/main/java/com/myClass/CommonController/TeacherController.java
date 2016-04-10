package com.myClass.CommonController;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myClass.Model.Classes;
import com.myClass.Model.Member;
import com.myClass.Service.ClassesService;
import com.myClass.Service.UserService;

@Controller
public class TeacherController {
	@Autowired
	UserService userService;
	
	@Autowired
	ClassesService classesService;
	
	@RequestMapping(value="/teacher/classes/manageClasses")
	public ModelAndView manageClasses (
			Principal principal,
			@RequestParam(value="type", defaultValue="1") int type,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("/teacher/manage-classes");
		Member member = userService.get(principal.getName());
		
		List<Map<String, Object>> classes = classesService.get(member.getId());
		
		
//		classes.add(classes.size() + 1, classesService.number(member.getId()));
		
		mav.addObject("classes", classes);
		mav.addObject("member", member);
		return mav;
	}
	
	@RequestMapping(value="/teacher/classes/setClasses")
	public ModelAndView setClasses(
			Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/teacher/set-classes");
		
		
		Member member = userService.get(principal.getName());
		
		mav.addObject("member", member);
		
		return mav;
	}
}
