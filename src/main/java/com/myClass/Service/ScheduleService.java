package com.myClass.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myClass.Dao.ScheduleDao;
import com.myClass.Model.Schedule;

@Service
public class ScheduleService {
	@Autowired
	ScheduleDao scheduleDao;
	
	public List<Schedule> get() {
		return scheduleDao.get();
	}
	
	public int setSchedule(int id, long created) {
		return scheduleDao.setSchedule(id, created);
	}
}
