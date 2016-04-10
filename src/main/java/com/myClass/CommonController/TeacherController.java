package com.myClass.CommonController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TeacherController {
	
	@RequestMapping(value="/teacher/classes/manageClasses")
	public ModelAndView manageClasses (
			@RequestParam(value="type", defaultValue="1") int type,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/teacher/manage-classes");
		
		return mav;
	}
}
