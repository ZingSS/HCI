package nju.edu.homework.vo;

import nju.edu.homework.model.Course;

public class StatTeacherInfoVO {
	
	private Course course;
	private int homeworkNum;
	
	public StatTeacherInfoVO(Course course, int homeworkNum) {
		this.course = course;
		this.homeworkNum = homeworkNum;
	}

	public Course getCourse() {
		return course;
	}

	public int getHomeworkNum() {
		return homeworkNum;
	}

}
