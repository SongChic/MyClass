package com.myClass.Model;

public class TestPaper {
	private int id;
	private String title;
	private int teacherId;
	private String textBook;
	private int subject;
	private int schoolLevel;
	private int schoolYear;
	private long created;
	
	private long startDate;
	private long endDate;
	
	private long limit;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	public String getTextBook() {
		return textBook;
	}
	public void setTextBook(String textBook) {
		this.textBook = textBook;
	}
	public int getSubject() {
		return subject;
	}
	public void setSubject(int subject) {
		this.subject = subject;
	}
	public int getSchoolLevel() {
		return schoolLevel;
	}
	public void setSchoolLevel(int schoolLevel) {
		this.schoolLevel = schoolLevel;
	}
	public int getSchoolYear() {
		return schoolYear;
	}
	public void setSchoolYear(int schoolYear) {
		this.schoolYear = schoolYear;
	}
	public long getCreated() {
		return created;
	}
	public void setCreated(long created) {
		this.created = created;
	}
	public long getLimit() {
		return limit;
	}
	public void setLimit(long limit) {
		this.limit = limit;
	}
	public long getStartDate() {
		return startDate;
	}
	public void setStartDate(long startDate) {
		this.startDate = startDate;
	}
	public long getEndDate() {
		return endDate;
	}
	public void setEndDate(long endDate) {
		this.endDate = endDate;
	}
	
}
