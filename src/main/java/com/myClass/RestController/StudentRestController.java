package com.myClass.RestController;

import java.util.Arrays;
import java.util.List;

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

import com.myClass.Model.Member;
import com.myClass.Service.StudentService;

@Controller
public class StudentRestController {
	
	@Autowired
	StudentService studentService;
	
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
}
