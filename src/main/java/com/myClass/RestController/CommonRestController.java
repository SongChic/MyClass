package com.myClass.RestController;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myClass.Service.CommonService;

@Controller
public class CommonRestController {
	@Autowired
	CommonService commonService;
	
	@RequestMapping(value="/rest/common/studentStateUpdate")
	@ResponseBody
	public ResponseEntity<Integer> studentStateUpdate(
			@RequestParam(value="teacherId") int teacherId,
			@RequestParam(value="studentId") int studentId,
			@RequestParam(value="state") int state,
			@RequestParam(value="studentState", defaultValue="0", required=false) int studentState,
			HttpServletRequest request, HttpServletResponse response) {
		
		int req = commonService.studentStateUpdate(teacherId, studentId, state, studentState);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
	
}
