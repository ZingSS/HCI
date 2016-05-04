package nju.edu.homework.vo;

import java.sql.Timestamp;

public class CourseHomeworkExcelVO extends ExcelVO{
	
	private String name;
	private Timestamp studentDDL;
	private Timestamp assistantDDL;
	
	public CourseHomeworkExcelVO() {
	}
	
	public CourseHomeworkExcelVO(String name, Timestamp studentDDL, Timestamp assistantDDL) {
		this.name = name;
		this.studentDDL = studentDDL;
		this.assistantDDL = assistantDDL;
	}
	
	public String getName() {
		return name;
	}

	public Timestamp getStudentDDL() {
		return studentDDL;
	}

	public Timestamp getAssistantDDL() {
		return assistantDDL;
	}

	public String[] toStringArray(){
		String result[] = {name, studentDDL.toString(), assistantDDL.toString()};
		return result;
	}

}
