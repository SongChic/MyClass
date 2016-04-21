package com.myClass.CommonController;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.myClass.Model.Member;
import com.myClass.Service.StudentService;
import com.myClass.Service.UserService;

@Controller
public class StudentController {
	@Autowired
	UserService userService;
	
	@Autowired
	StudentService studentService;
	
	@RequestMapping(value="/student/myTeacher/manageTeachers")
	public ModelAndView manageTeacher (
			Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		
		
		Member student = userService.get(principal.getName());
		
		List<Map<String, Object>> teacherMap = studentService.getTeacher(student.getId());
		ModelAndView mav = new ModelAndView("/student/myTeacher/manage-teachers");
		
		mav.addObject("teacher", teacherMap);
		return mav;
	}
	
	@RequestMapping(value="/student/myTeacher/findTeacher")
	public ModelAndView teacherSearch (
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("/student/myTeacher/find-teacher");
		
		return mav;
	}
}
