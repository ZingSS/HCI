package nju.edu.homework.vo;

import nju.edu.homework.model.User;

public class StatStudentVO {
	
	private User user;
	private int courseNum;
	private int assistantCourseNum;
	
	public StatStudentVO(User user, int courseNum, int assistantCourseNum) {
		this.user = user;
		this.courseNum = courseNum;
		this.assistantCourseNum = assistantCourseNum;
	}
	
	public StatStudentVO(User user, int courseNum) {
		this.user = user;
		this.courseNum = courseNum;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getCourseNum() {
		return courseNum;
	}
	public void setCourseNum(int courseNum) {
		this.courseNum = courseNum;
	}

	public int getAssistantCourseNum() {
		return assistantCourseNum;
	}

	public void setAssistantCourseNum(int assistantCourseNum) {
		this.assistantCourseNum = assistantCourseNum;
	}
	
	

}
