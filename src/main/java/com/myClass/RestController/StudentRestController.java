package com.myClass.RestController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myClass.Dao.ClassesDao;
import com.myClass.Model.Member;
import com.myClass.Service.ClassesService;
import com.myClass.Service.StudentService;

@Controller
public class StudentRestController {
	
	@Autowired
	StudentService studentService;

	@Autowired
	ClassesService classesService;
	
	@RequestMapping(value="/rest/findStudent", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ResponseEntity<List<Member>> findStudent(
			@RequestParam(value="name") String name,
			HttpServletRequest request, HttpServletResponse response) {
		
		List<Member> member = studentService.findStudent(name);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<List<Member>>(member, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value="/rest/student/teacherFind", method = {RequestMethod.GET, RequestMethod.POST} )
	public ResponseEntity<List<Map<String, Object>>> findTeacher (
			@RequestParam(value="name") String name,
			HttpServletRequest request, HttpServletResponse response) {
		
		List<Map<String, Object>> teacher = studentService.findTeacher(name);
		
		List<Map<String, Object>> teahcerList = new ArrayList<Map<String,Object>>();
		for (int i = 0; i < teacher.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", teacher.get(i).get("id"));
			map.put("name", teacher.get(i).get("name"));
			map.put("profile", teacher.get(i).get("profile"));
			map.put("classes", classesService.getList((Integer) teacher.get(i).get("id")));
			
			teahcerList.add(map);
		}
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<List<Map<String, Object>>>(teahcerList, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value="/rest/student/classRequest", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ResponseEntity<Integer> classRequest (
			@RequestParam(value="teacherId") int teacherId,
			@RequestParam(value="studentId") int studentId,
			HttpServletRequest request, HttpServletResponse response) {
		
		int req = studentService.classRequest(teacherId, studentId); 
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );
		headers.setAccept( Arrays.asList(MediaType.APPLICATION_JSON) );
		
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value="/rest/student/requestCancel", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ResponseEntity<Integer> requestCancel (
			@RequestParam(value="teacherId") int teacherId,
			@RequestParam(value="studentId") int studentId,
			HttpServletRequest request, HttpServletResponse response) {
		
		int req = studentService.requestCancel(teacherId, studentId);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
}
