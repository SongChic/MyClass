package com.myClass.RestController;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.myClass.Service.UserService;

@Controller
@SessionAttributes("session")
public class UserRestController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/rest/loginCheck", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<Integer> loginCheck(
			@RequestParam(value="memId") String memId,
			@RequestParam(value="memPw") String memPw,
			HttpServletRequest request, HttpServletResponse response) {
		
		int req = userService.idCheck(memId);
		
		if (req > 0) {
			req = userService.pwCheck(memId, memPw) == 1? 2 : 1;
		}
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType( MediaType.APPLICATION_JSON );
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value="/rest/idCheck", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<Integer> idCheck(
			@RequestParam(value="memId") String memId,
			HttpServletRequest request, HttpServletResponse response) {
		
		int req = userService.idCheck(memId);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value="/rest/singUp", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ResponseEntity<Integer> signUp() {
		
		int req = 0;
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType( MediaType.APPLICATION_JSON );
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
}
