package nju.edu.homework.vo;

public class AssistantStudentHomworkVO {
	
	private int id;
	private String studentId;
	private String name;
	private boolean submit;
	private String grade;
	private String comment;
	
	public AssistantStudentHomworkVO(int id, String studentId, String name, boolean submit, String grade, String comment) {
		this.id = id;
		this.studentId = studentId;
		this.name = name;
		this.submit = submit;
		this.grade = grade;
		this.comment = comment;
	}
	
	public int getId() {
		return id;
	}
	public String getStudentId() {
		return studentId;
	}
	public String getName() {
		return name;
	}
	public boolean isSubmit() {
		return submit;
	}
	public String getGrade() {
		return grade;
	}
	public String getComment() {
		return comment;
	}
	
	

}
