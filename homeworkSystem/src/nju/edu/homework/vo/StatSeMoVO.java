package nju.edu.homework.vo;

import nju.edu.homework.model.Semester;

public class StatSeMoVO {
	
	private Semester semester;
	private String month;
	
	public StatSeMoVO(Semester semester, String month) {
		this.semester = semester;
		this.month = month;
	}
	
	public Semester getSemester() {
		return semester;
	}
	public void setSemester(Semester semester) {
		this.semester = semester;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	

}
