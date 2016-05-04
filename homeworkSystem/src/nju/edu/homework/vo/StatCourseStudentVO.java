package nju.edu.homework.vo;

import nju.edu.homework.model.User;

public class StatCourseStudentVO {
	
	private User user;
	private int reCorrect;
	
	private int submit;
	private double average;
	
	public StatCourseStudentVO(User user, int reCorrect) {
		this.user = user;
		this.reCorrect = reCorrect;
	}
	
	public StatCourseStudentVO(User user, int submit, double average) {
		this.user = user;
		this.submit = submit;
		this.average = average;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getReCorrect() {
		return reCorrect;
	}
	public void setReCorrect(int reCorrect) {
		this.reCorrect = reCorrect;
	}
	public int getSubmit() {
		return submit;
	}
	public void setSubmit(int submit) {
		this.submit = submit;
	}
	public double getAverage() {
		return average;
	}
	public void setAverage(double average) {
		this.average = average;
	}
	
	
	

}
