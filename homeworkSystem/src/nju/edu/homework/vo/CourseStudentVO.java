package nju.edu.homework.vo;

public class CourseStudentVO {
	
	private int id;
	private String userId;
	private String name;
	
	private boolean isIn;
	private int assistantCourseId;
	
	public CourseStudentVO(int id, String userId, String name, boolean isIn, int assistantCourseId) {
		this.id = id;
		this.userId = userId;
		this.name = name;
		this.isIn = isIn;
		this.assistantCourseId = assistantCourseId;
	}
	
	public String getUserId() {
		return userId;
	}

	public String getName() {
		return name;
	}

	public boolean isIsIn() {
		return isIn;
	}

	public int getId() {
		return id;
	}

	public int getAssistantCourseId() {
		return assistantCourseId;
	}

	

}
