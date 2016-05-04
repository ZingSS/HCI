package nju.edu.homework.vo;

import nju.edu.homework.model.Course;

public class StatStudentCourseVo {
	
	private Course course;
	private HomeworkStateNumVO homeworkNum;
	private int reCorrect;
	
	private int submit;
	private double average;
	
	public StatStudentCourseVo(Course course, HomeworkStateNumVO homeworkNum, int reCorrect) {
		this.course = course;
		this.homeworkNum = homeworkNum;
		this.reCorrect = reCorrect;
	}
	
	public StatStudentCourseVo(Course course, HomeworkStateNumVO homeworkNum, int submit, double average) {
		this.course = course;
		this.homeworkNum = homeworkNum;
		this.submit = submit;
		this.average = average;
	}
	
	public Course getCourse() {
		return course;
	}

	public int getReCorrect() {
		return reCorrect;
	}

	public int getSubmit() {
		return submit;
	}

	public double getAverage() {
		return average;
	}

	public HomeworkStateNumVO getHomeworkNum() {
		return homeworkNum;
	}

}
