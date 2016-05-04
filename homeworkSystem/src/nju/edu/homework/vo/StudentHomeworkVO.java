package nju.edu.homework.vo;

import nju.edu.homework.model.Homework;

public class StudentHomeworkVO {
	
	private Homework homework;
	private boolean submit;
	private String grade;
	private String comment;
	
	public StudentHomeworkVO(Homework homework, boolean submit, String grade, String comment) {
		this.homework = homework;
		this.submit = submit;
		this.grade = grade;
		this.comment = comment;
	}
	
	public Homework getHomework() {
		return homework;
	}

	public boolean isSubmit() {
		return submit;
	}

	public String getGrade() {
		return grade;
	}
	public String getComment() {
		return comment;
	}


}
