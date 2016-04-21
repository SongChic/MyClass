package com.myClass.RestController;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Arrays;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myClass.Common.FileUpload;
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
			Principal principal,
			MultipartHttpServletRequest form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int req = 0;
		
		Member member = new Member();
		
		FileUpload fileUpload = new FileUpload("/WEB-INF/views/img/profile", form);
		
		if ( request.getParameter("oldFileName") != null ) {
        	fileUpload.setOldFileName(request.getParameter("oldFileName"));
        }
		
		String fileNames = fileUpload.upload();
		
		Iterator<String> iterator = form.getFileNames();
		
		if ( iterator.hasNext() ) {
			member.setProfile(fileNames);
		} else {
			member.setProfile(request.getParameter("profile"));
		}
		
		if ( fileNames != null || fileNames.length() > 0 ) {
			member.setProfile(fileNames);
		} else {
			member.setProfile(form.getParameter("profile"));
		}
		
		member.setId(Integer.parseInt(form.getParameter("id")));
		member.setMemId(form.getParameter("memId"));
		member.setMemPw(form.getParameter("memPw"));
		member.setName(form.getParameter("name"));
		member.setEmail(form.getParameter("email"));
		member.setPhone(form.getParameter("phone"));
		member.setUserType(Integer.parseInt(form.getParameter("userType")));
		member.setGender(Integer.parseInt(form.getParameter("gender")));
		member.setBirthdayYear(Integer.parseInt(form.getParameter("birthdayYear")));
		member.setBirthdayMonth(Integer.parseInt(form.getParameter("birthdayMonth")));
		member.setBirthdayDay(form.getParameter("birthdayDay"));
		member.setSchool(form.getParameter("schoolName"));
		
		if ( member.getUserType() == 2 ) {
			int parentId = userService.setMember(member);
			if ( parentId > 0 ) {
				req = parentService.setStudentMapper(parentId, form.getParameter("studentArr"));
			}
		} else {
			req = userService.setMember(member);
		}
		
		if ( member.getId() > 0 ) {
			HttpSession session = request.getSession();
			session.setAttribute("member", userService.get(principal.getName()));
		}
		
		
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType( MediaType.APPLICATION_JSON );
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value="/rest/getSchool", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ResponseEntity<JSONArray> test(
			@RequestParam(value="url", required=false) String url,
			@RequestParam(value="searchSchulNm", required=false) String searchSchulNm,
			HttpServletRequest request, HttpServletResponse response) {
		
		String editUrl = "";
		JSONArray req = new JSONArray();
		if ( searchSchulNm != "" ) {
			editUrl = url + "&searchSchulNm=" + searchSchulNm;
			try {
				CloseableHttpClient httpClient = HttpClients.createDefault();
				
				HttpGet get = new HttpGet(editUrl);
				
				CloseableHttpResponse httpResponse = httpClient.execute(get);
				
				try {
					req.add(EntityUtils.toString(httpResponse.getEntity()));
				} finally {
					httpResponse.close();
				}
				
			} catch ( Exception e) {
				e.printStackTrace();
			}
		}
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType( MediaType.APPLICATION_JSON );
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<JSONArray>(req, headers, HttpStatus.OK);
	}
}
