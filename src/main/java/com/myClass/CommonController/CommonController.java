package com.myClass.CommonController;

import java.security.Principal;
import java.util.ArrayList;
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
import com.myClass.Service.CommonService;
import com.myClass.Service.UserService;

@Controller
public class CommonController {
	
	@Autowired
	ClassesService classesService;
	@Autowired
	UserService userService;
	@Autowired
	CommonService commonService;
	
	@RequestMapping(value="/common/classes/classRoom")
	public ModelAndView ClassRoom (
			Principal principal,
			@RequestParam( value="id", defaultValue="0", required=false ) int id,
			HttpServletRequest request, HttpServletResponse response) {
		
		Member member = userService.get(principal.getName());
		
		ModelAndView mav = new ModelAndView("/common/class-room");
		
		
		Classes classes = new Classes();
		
		List<Map<String, Object>> classStudent = new ArrayList<Map<String,Object>>();
		
		if ( id > 0 ) {
			classes = classesService.get(id);
			classStudent = classesService.getStudentList(id);
		}
		
		
		mav.addObject("classes", classes);
		mav.addObject("classStudent", classStudent);
		
		if ( member.getUserType() == 3 ) {
			Member teacher = commonService.getClassTeacher(id);
			mav.addObject("teacher", teacher);
		}
		
		return mav;
	}
	
}
