package com.myClass.RestController;

import java.util.Arrays;
import java.util.Date;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myClass.Model.Question;
import com.myClass.Model.TestPaper;
import com.myClass.Service.QuestionService;

@Controller
public class QuestionRestController {
	@Autowired
	QuestionService questionService;

	@RequestMapping(value = "/rest/exam/setTestPaper", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<Integer> setTestPaper(MultipartHttpServletRequest request,
			HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {

		int req = 0;

		TestPaper testPaper = new TestPaper();

		testPaper.setId(Integer.parseInt(request.getParameter("id")));
		testPaper.setTitle(request.getParameter("title"));
		testPaper.setTeacherId(Integer.parseInt(request.getParameter("teacherId")));
		testPaper.setTextBook(request.getParameter("textBook"));
		testPaper.setSubject(Integer.parseInt(request.getParameter("subject")));
		testPaper.setSchoolLevel(Integer.parseInt(request.getParameter("schoolLevel")));
		testPaper.setSchoolYear(Integer.parseInt(request.getParameter("schoolYear")));
		testPaper.setLimit(Long.parseLong(request.getParameter("limit")));
		
		System.out.println( Long.parseLong(request.getParameter("limit")) );
		
		req = questionService.setTestPaper(testPaper);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/rest/exam/setQuestion", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<Integer> setQuestion(MultipartHttpServletRequest request,
			HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {

		Question question = new Question();
		question.setTitle(request.getParameter("title"));
		question.setSelectNum(Integer.parseInt(request.getParameter("selectNum")));
		question.setQuestionNum(Integer.parseInt(request.getParameter("questionNum")));
		question.setQuestion(request.getParameter("question"));
		question.setAnswer(request.getParameter("answer"));

		question.setAddQuestion(request.getParameter("addQuestion"));
		question.setQuestionImg(request.getParameter("questionImg"));

		int req = questionService.setQuestion(Integer.parseInt(request.getParameter("id")), question,
				Boolean.parseBoolean(request.getParameter("edited")));

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
}
