package com.myClass.CommonController;

import java.security.Principal;
import java.util.Date;
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
import com.myClass.Service.TeacherService;
import com.myClass.Service.UserService;

@Controller
public class TeacherController {
	@Autowired
	UserService userService;
	
	@Autowired
	TeacherService teacherService;
	
	@Autowired
	ClassesService classesService;
	
	@RequestMapping(value="/teacher/classes/manageClasses")
	public ModelAndView manageClasses (
			Principal principal,
			@RequestParam(value="type", defaultValue="1") int type,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("/teacher/manage-classes");
		Member member = userService.get(principal.getName());
		
		List<Map<String, Object>> classes = classesService.getList(member.getId());
		
		
//		classes.add(classes.size() + 1, classesService.number(member.getId()));
		
		mav.addObject("classes", classes);
		mav.addObject("member", member);
		return mav;
	}
	
	@RequestMapping(value="/teacher/classes/classRoom")
	public ModelAndView ClassRoom (
			Principal principal,
			@RequestParam( value="id", defaultValue="0", required=false ) int id,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("/teacher/class-room");
		Member member = userService.get(principal.getName());
		
		Classes classes = new Classes();
		
		if ( id > 0 ) {
			classes = classesService.get(id);
		}
		
//		classes.add(classes.size() + 1, classesService.number(member.getId()));
		
		mav.addObject("classes", classes);
		mav.addObject("member", member);
		return mav;
	}
	
	@RequestMapping(value="/teacher/classes/setClasses")
	public ModelAndView setClasses(
			Principal principal,
			@RequestParam( value="id", defaultValue="0", required=false ) int id,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/teacher/set-classes");
		
		Member member = userService.get(principal.getName());
		
		Classes classes = new Classes();
		
		if ( id > 0 ) {
			classes = classesService.get(id);
		}
		
		mav.addObject("classes", classes);
		mav.addObject("member", member);
		
		return mav;
	}
	
	@RequestMapping(value="/teacher/classes/manageClassMember")
	public ModelAndView manageClassMember(
			@RequestParam( value="classId", required=true ) int classId,
			HttpServletRequest request, HttpServletResponse response
			) {
		
		int teacherId = teacherService.getTeacherId(classId);
		ModelAndView mav = new ModelAndView("/teacher/manage-class-member");
		mav.addObject("student", teacherService.myStudentList(teacherId));
		return mav;
	}
	
	@RequestMapping( value="/teacher/member/findStudent" )
	public ModelAndView findStudent (
			@RequestParam( value="classId", required=true ) int classId,
			HttpServletRequest request, HttpServletResponse response
			) {
		ModelAndView mav = new ModelAndView("/teacher/find-student");
		
		mav.addObject("student", teacherService.findStudent());
		return mav;
	}
}
