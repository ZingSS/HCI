package nju.edu.homework.vo;

import nju.edu.homework.model.Grade;

public class GradeSaveVO {
	
	private Grade grade;
	private int homeworkId;
	private int studentId;
	
	public GradeSaveVO(Grade grade, int homeworkId, int studentId) {
		this.grade = grade;
		this.homeworkId = homeworkId;
		this.studentId = studentId;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public int getHomeworkId() {
		return homeworkId;
	}

	public void setHomeworkId(int homeworkId) {
		this.homeworkId = homeworkId;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int userId) {
		this.studentId = userId;
	}

}
