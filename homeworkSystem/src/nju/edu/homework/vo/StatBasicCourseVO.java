package nju.edu.homework.vo;

import nju.edu.homework.model.Course;

public class StatBasicCourseVO {
	
	private Course course;
	private int homeworkNum;
	
	public StatBasicCourseVO(Course course, int homeworkNum) {
		this.course = course;
		this.homeworkNum = homeworkNum;
	}
	
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public int getHomeworkNum() {
		return homeworkNum;
	}
	public void setHomeworkNum(int homeworkNum) {
		this.homeworkNum = homeworkNum;
	}
	

}
