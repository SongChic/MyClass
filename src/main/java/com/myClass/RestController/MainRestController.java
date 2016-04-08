package com.myClass.RestController;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.debugger.request.Request;
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

import com.myClass.Dao.ScheduleDao;
import com.myClass.Dao.UserDao;
import com.myClass.Model.Schedule;
import com.myClass.Service.UserService;

@Controller
public class MainRestController {
	@Autowired
	ScheduleDao scheduleDao;
	
	@Autowired
	UserService userService;

	@RequestMapping(value="/rest/setCalendar", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<JSONArray> setCalendar(
			Principal principal,
			HttpServletRequest request, HttpServletResponse response){
		
		
		
		JSONArray calendarArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		for (Schedule schedule : scheduleDao.get()) {
			JSONObject calendarData = new JSONObject();
			
			calendarData.put("id", schedule.getId());
			calendarData.put("title", schedule.getTitle());
			calendarData.put("start", new Date(schedule.getCreated()));
			calendarData.put("color", schedule.getColor());
			
			if (schedule.getCreator().equals(principal.getName())) {
				calendarData.put("editable", true);
			}
			
			
			calendarArr.add(calendarData);
		}
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType( MediaType.APPLICATION_JSON );
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<JSONArray>(calendarArr, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value="/rest/setSchedule", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<Integer> setSchedule (
			@RequestParam(value="id", defaultValue="0", required=false) int id,
			@RequestParam(value="created") long created,
			HttpServletRequest request, HttpServletResponse response) {
		
		int req = 0;
		if (id > 0) {
			req = scheduleDao.setSchedule(id, created);
		}
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType( MediaType.APPLICATION_JSON );
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value="/rest/setSetting", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<Integer> setSetting (
			@RequestParam(value="id") int id,
			@RequestParam(value="mainColor") int mainColor,
			HttpServletRequest request, HttpServletResponse response){
		
		int req = userService.setSetting(id, mainColor);
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType( MediaType.APPLICATION_JSON );
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return new ResponseEntity<Integer>(req, headers, HttpStatus.OK);
	}
	
}
