package nju.edu.homework.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Message")
public class Message implements Serializable, Comparable<Message>{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	private String content;
	private String type;
	private Timestamp createdTime;
	
	@ManyToOne
	@JoinColumn
	private Course course;
	
	public Message() {
		createdTime = new Timestamp(System.currentTimeMillis());
	}
	
	public Message(String title, String content, String type) {
		this.title = title;
		this.content = content;
		this.type = type;
		createdTime = new Timestamp(System.currentTimeMillis());
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Timestamp getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Timestamp createdTime) {
		this.createdTime = createdTime;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}

	@Override
	public int compareTo(Message o) {
		return o.getCreatedTime().compareTo(this.getCreatedTime());
	}
	
	
	
	

}
