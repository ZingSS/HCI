package nju.edu.homework.vo;

import nju.edu.homework.model.User;

public class StudentGradeVO extends ExcelVO{
	
	private User user;
	private String grade;

	public StudentGradeVO(User user, String grade) {
		this.user = user;
		this.grade = grade;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String[] toStringArray(){
		String result[] = {user.getUserId(), user.getName(), grade};
		return result;
	}

}
