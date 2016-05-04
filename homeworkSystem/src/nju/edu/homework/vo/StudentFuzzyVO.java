package nju.edu.homework.vo;

public class StudentFuzzyVO {
	
	private String studentId;
	private String name;
	
	
	public StudentFuzzyVO(String studentId, String name) {
		this.name = name;
		this.studentId = studentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
}
