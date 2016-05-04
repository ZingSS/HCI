package nju.edu.homework.vo;

public class StatStudentCourseNumVO {
	
	private int courseNum;
	private int assistantCourseNum;
	
	public StatStudentCourseNumVO(int courseNum, int assistantCourseNum) {
		this.courseNum = courseNum;
		this.assistantCourseNum = assistantCourseNum;
	}

	public int getCourseNum() {
		return courseNum;
	}

	public int getAssistantCourseNum() {
		return assistantCourseNum;
	}

}
