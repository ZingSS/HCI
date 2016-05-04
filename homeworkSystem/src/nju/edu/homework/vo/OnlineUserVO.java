package nju.edu.homework.vo;

public class OnlineUserVO {
	
	private int id;
	
	private String userId;
	
	private String name;
	
	private String role;
	
	public OnlineUserVO(int id, String userId, String name, String role) {
		this.id = id;
		this.userId = userId;
		this.name = name;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	

}
