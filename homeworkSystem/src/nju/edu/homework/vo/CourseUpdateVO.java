package nju.edu.homework.vo;

public class CourseUpdateVO {
	
	private int id;
	
	private String courseId;
	private String name;
	private String time;
	private String position;
	private String credit;
	private String type;
	
	public CourseUpdateVO() {
	}
	
	public CourseUpdateVO(int id, String courseId, String name, String time, String position, String credit, String type) {
		this.id = id;
		this.courseId = courseId;
		this.name = name;
		this.time = time;
		this.position = position;
		this.credit = credit;
		this.type = type;
	}
	
	
	
	public void setId(int id) {
		this.id = id;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCourseId() {
		return courseId;
	}
	public String getName() {
		return name;
	}
	public String getTime() {
		return time;
	}
	public String getPosition() {
		return position;
	}
	public String getCredit() {
		return credit;
	}
	public String getType() {
		return type;
	}
	public int getId() {
		return id;
	}
	
}
