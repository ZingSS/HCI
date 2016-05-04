package nju.edu.homework.vo;

public class CourseStudentExcelVO extends ExcelVO{
	
	private String userId;
	private String name;
	
	public CourseStudentExcelVO() {
	}
	
	public CourseStudentExcelVO(String userId, String name) {
		this.userId = userId;
		this.name = name;
	}

	public String getUserId() {
		return userId;
	}

	public String getName() {
		return name;
	}
	
	public String[] toStringArray(){
		String result[] = {userId, name};
		return result;
	}
	
}
