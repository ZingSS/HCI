package nju.edu.homework.vo;

public class StatMonthVO {
	
	private String semester;
	
	private String month;
	
	public StatMonthVO(String semester, String month) {
		this.month = month;
		this.semester = semester;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

}
