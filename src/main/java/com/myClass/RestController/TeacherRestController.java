package com.myClass.RestController;

import java.security.Principal;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myClass.Model.Classes;
import com.myClass.Service.ClassesService;


@Controller
public class TeacherRestController {
	
	@Autowired
	ClassesService classesService;
	
	@RequestMapping(value="/rest/teacher/setClass", method={ RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<Integer> setClass (
			@RequestParam(value="id", defaultValue="0", required=false) int id,
			@RequestParam(value="name") String name,
			@RequestParam(value="startDate") long startDate,
			@RequestParam(value="endDate") long endDate,
			@RequestParam(value="startTime") long startTime,
			@RequestParam(value="endTime") long endTime,
			@RequestParam(value="target") int target,
			@RequestParam(value="subject") String subject,
			@RequestParam(value="summary") String summary,
			@RequestParam(value="days") int days,
			@RequestParam(value="classesViewType") int classesViewType,
			@RequestParam(value="color") int color,
			@RequestParam(value="picture") String picture,
			@RequestParam(value="thumbnail") String thumbnail,
			@RequestParam(value="finished") int finished,
			@RequestParam(value="maxNum") int maxNum,
			@RequestParam(value="teacherId") int teacherId,
			Principal principal,
			HttpServletRequest request, HttpServletResponse response) {
		
		Classes classes = new Classes();
		
		classes.setId(id);
		classes.setName(name);
		classes.setStartDate(startDate);
		classes.setEndDate(endDate);
		classes.setStartTime(startTime);
		classes.setEndTime(endTime);
		classes.setTarget(target);
		classes.setSubject(subject);
		classes.setSummary(summary);
		classes.setDays(days);
		classes.setClassesViewType(classesViewType);
		classes.setColor(color);
		classes.setPicture(picture);
		classes.setThumbnail(thumbnail);
		classes.setFinished(finished);
		classes.setMaxNum(maxNum);
		
		int req = classesService.setClasses(classes, teacherId);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType( MediaType.APPLICATION_JSON );
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
}
