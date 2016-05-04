package nju.edu.homework.vo;

public class StudentExcelVO extends ExcelVO{

	private String studentId;
	private String name;
	private String grade;
	private String comment;
	
	public StudentExcelVO(String studentId, String name, String grade, String comment) {
		this.studentId = studentId;
		this.name = name;
		this.grade = grade;
		this.comment = comment;
	}

	public String getStudentId() {
		return studentId;
	}
	
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String[] toStringArray(){
		String result[] = {studentId, name, grade, comment};
		return result;
	}

	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	
}
