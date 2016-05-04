package nju.edu.homework.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "grade")
public class Grade implements Serializable, Comparable<Grade>{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String grade;
	
	private String comment;
	
	@ManyToOne(cascade = CascadeType.MERGE )
	private User user;
	
	@ManyToOne(cascade = CascadeType.MERGE )
	private Homework homework;
	
	public Grade() {
	}
	
	public Grade(String grade, String comment) {
		this.grade = grade;
		this.comment = comment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Homework getHomework() {
		return homework;
	}

	public void setHomework(Homework homework) {
		this.homework = homework;
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

	@Override
	public int compareTo(Grade o) {
		return (int)(Double.parseDouble(this.getGrade()) - Double.parseDouble(o.getGrade()));
	}
	
	

}
