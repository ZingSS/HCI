package nju.edu.homework.vo;

public class StudentInOrAssisVO {
	
	private boolean isIn;
	private int assistantCourseId;
	
	public StudentInOrAssisVO(boolean isIn, int assistantCourseId) {
		this.isIn = isIn;
		this.assistantCourseId = assistantCourseId;
	}
	

	public boolean isIn() {
		return isIn;
	}
	public int getAssistantCourseId() {
		return assistantCourseId;
	}
}
