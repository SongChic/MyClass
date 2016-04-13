package com.myClass.RestController;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myClass.Model.Classes;
import com.myClass.Service.ClassesService;


@Controller
public class TeacherRestController {
	
	@Autowired
	ClassesService classesService;
	
	@RequestMapping(value="/rest/teacher/setClass", method={ RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<Integer> setClass (
			HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			MultipartHttpServletRequest request) {
		
		
		Classes classes = new Classes();
		
		Iterator<String> iterator = request.getFileNames();
		
		if ( iterator.hasNext() ) {
			
			MultipartFile multipartFile = request.getFile(iterator.next());
			
			try {
				
				 String path = httpServletRequest.getSession().getServletContext().getRealPath("/WEB-INF/views/img");
				
				/* 파일 이름 (yyyyMMddHHmmss) + (fileName) */
				SimpleDateFormat filePrefix = new SimpleDateFormat("yyyyMMddHHmmss_");
				Date date = new Date();
				String fileName=multipartFile.getOriginalFilename();
				
				/* 폴더 체크 및 생성 */
				File directory = new File( path + "/data/" );
				
				if ( !directory.exists() ) {
					directory.mkdirs();
				}
				
				/* 파일 저장 */
				File file = new File(directory.getAbsolutePath() + "\\" + filePrefix.format(date) + fileName);
				byte[] bytes = multipartFile.getBytes();
				
				BufferedOutputStream stream = new BufferedOutputStream( new FileOutputStream(file) );
				
				stream.write(bytes);
				stream.close();
				
				classes.setPicture(file.getName());
				
			} catch ( Exception e ) {
				e.printStackTrace();
			}
			
		} else {
			classes.setPicture("");
			classes.setThumbnail("");
		}
		
		classes.setId(Integer.parseInt(request.getParameter("id")));
		classes.setName(request.getParameter("name"));
		classes.setStartDate(Long.parseLong(request.getParameter("startDate")));
		classes.setEndDate(Long.parseLong(request.getParameter("endDate")));
		classes.setTarget(Integer.parseInt(request.getParameter("target")));
		classes.setSubject(request.getParameter("subject"));
		classes.setSummary(request.getParameter("summary"));
		classes.setDays(Integer.parseInt(request.getParameter("days")));
		classes.setClassesViewType(Integer.parseInt(request.getParameter("classesViewType")));
		classes.setColor(Integer.parseInt(request.getParameter("color")));

		classes.setFinished(Integer.parseInt(request.getParameter("finished")));
		classes.setMaxNum(Integer.parseInt(request.getParameter("maxNum")));
		
		int req = classesService.setClasses(classes, Integer.parseInt(request.getParameter("teacherId")));
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
	@RequestMapping(value="/rest/teacher/test", method={ RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<Integer> test (
			HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			MultipartHttpServletRequest request) throws Exception {
		int req = 0;
		
		Iterator<String> itrator = request.getFileNames();
		
		System.out.println(itrator.hasNext());
		
        MultipartFile multipartFile = request.getFile(itrator.next());
        
        try {
			
			 String path = httpServletRequest.getSession().getServletContext().getRealPath("/WEB-INF/views/img");
			
			/* 파일 이름 (yyyyMMddHHmmss) + (fileName) */
			SimpleDateFormat filePrefix = new SimpleDateFormat("yyyyMMddHHmmss");
			Date date = new Date();
			String fileName=multipartFile.getOriginalFilename();
			
			/* 폴더 체크 및 생성 */
			File directory = new File( path + "/data/" );
			
			if ( !directory.exists() ) {
				directory.mkdirs();
				System.out.println("folder");
			}
			
			System.out.println(directory.getAbsolutePath() + "\\" + filePrefix.format(date) + fileName);
			
			/* 파일 저장 */
			File file = new File(directory.getAbsolutePath() + "\\" + filePrefix.format(date) + fileName);
			 byte[] bytes = multipartFile.getBytes();
			
			BufferedOutputStream stream = new BufferedOutputStream( new FileOutputStream(file) );
			
			stream.write(bytes);
			stream.close();
			
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		
//		Iterator<String> integer = request.getFileNames();
//		MultipartFile multipartFile = request.getFile(integer.next());
		
		System.out.println(request.getParameter("text"));
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
}
