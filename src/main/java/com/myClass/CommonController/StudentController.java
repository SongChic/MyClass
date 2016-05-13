package com.myClass.CommonController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.myClass.Service.TeacherService;
import com.myClass.Service.UserService;

@Controller
public class StudentController {
	@Autowired
	UserService userService;
	
	@Autowired
	StudentService studentService;
	
	@Autowired
	TeacherService teacherService; 
	
	@RequestMapping(value="/student/myTeacher/manageTeachers")
	public ModelAndView manageTeacher (
			Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		
		
		Member student = userService.get(principal.getName());
		
		List<Map<String, Object>> teacherMap = studentService.getTeacher(student.getId());
		List<Map<String, Object>> teachers = new ArrayList<Map<String,Object>>(); 
		
		for ( Map<String, Object> teacherList : teacherMap ) {
			Map<String, Object> classMap = new HashMap<String, Object>();
			
			int classIds = (Integer) teacherList.get("map_id");
			if ( classIds <= 0 ) {
				classIds = 0;
			}
			List<Map<String, Object>> className = teacherService.getClassName(String.valueOf(classIds));
			
			String classNameString = "";
			for (int i = 0; i < className.size(); i++) {
				classNameString += className.get(i).get("name") + ", ";
			}
			if ( classNameString.length() > 0 ) {
				classNameString = classNameString.substring(0, classNameString.length() - 2 );
			}
			classMap.put("className", classNameString);
			
			classMap.put("profile", teacherList.get("profile"));
			classMap.put("student_state", teacherList.get("student_state"));
			classMap.put("state", teacherList.get("state"));
			classMap.put("id", teacherList.get("id"));
			classMap.put("name", teacherList.get("name"));
			classMap.put("subject", teacherList.get("subject"));
			teachers.add(classMap);
		}
		
		ModelAndView mav = new ModelAndView("/student/myTeacher/manage-teachers");
		
		mav.addObject("teacher", teachers);
		return mav;
	}
	
	@RequestMapping(value="/student/myTeacher/findTeacher")
	public ModelAndView teacherSearch (
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("/student/myTeacher/find-teacher");
		
		return mav;
	}
	
	@RequestMapping( value="/student/classes/ourClasses" )
	public ModelAndView ourClasses(
			Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		
		Member student = userService.get(principal.getName());
		
		List<Map<String, Object>> classes = studentService.getOurClasses(student.getId());
		
		ModelAndView mav = new ModelAndView("/student/ourClass/our-class");
		
		mav.addObject("classes", classes);
		return mav;
		
	}
}
