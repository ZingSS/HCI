package nju.edu.homework.vo;

import nju.edu.homework.model.Grade;

public class StudentSubmitGradeVO {
	
	private boolean submit;
	private Grade grade;
	
	public StudentSubmitGradeVO(boolean submit, Grade grade) {
		this.submit = submit;
		this.grade = grade;
	}
	
	public boolean isSubmit() {
		return submit;
	}
	public void setSubmit(boolean submit) {
		this.submit = submit;
	}
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	
	

}
