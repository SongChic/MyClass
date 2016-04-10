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

import com.myClass.Dao.UserDao;
import com.myClass.Model.Member;
import com.myClass.Service.ParentService;
import com.myClass.Service.UserService;

@Controller
@SessionAttributes("session")
public class UserRestController {
	@Autowired
	UserService userService;
	
	@Autowired
	ParentService parentService;
	
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
	
	@RequestMapping(value="/rest/setMember", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ResponseEntity<Integer> setMember(
			@RequestParam(value="id", defaultValue="0", required=false) int id,
			@RequestParam(value="memId") String memId,
			@RequestParam(value="memPw") String memPw,
			@RequestParam(value="name") String name,
			@RequestParam(value="email") String email,
			@RequestParam(value="phone") String phone,
			@RequestParam(value="userType") int userType,
			@RequestParam(value="gender") int gender,
			@RequestParam(value="birthdayYear") int birthdayYear,
			@RequestParam(value="birthdayMonth") int birthdayMonth,
			@RequestParam(value="birthdayDay") int birthdayDay,
			@RequestParam(value="slogan", defaultValue="", required=false) String slogan,
			@RequestParam(value="studentArr", defaultValue="", required=false) String studentArr,
			HttpServletRequest request, HttpServletResponse response) {
		
		int req = 0;
		System.out.println("sign up");
		
		Member member = new Member();
		
		member.setId(id);
		member.setMemId(memId);
		member.setMemPw(memPw);
		member.setName(name);
		member.setEmail(email);
		member.setPhone(phone);
		member.setGender(gender);
		member.setUserType(userType);
		member.setBirthdayYear(birthdayYear);
		member.setBirthdayMonth(birthdayMonth);
		member.setBirthdayDay(birthdayDay);
		
		if ( member.getUserType() == 2 ) {
			int parentId = userService.setMember(member);
			if ( parentId > 0 ) {
				System.out.println(studentArr);
				req = parentService.setStudentMapper(parentId, studentArr);
			}
		} else {
			req = userService.setMember(member);
		}
		
		System.out.println(req);
		
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType( MediaType.APPLICATION_JSON );
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
}
