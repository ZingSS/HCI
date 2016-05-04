package nju.edu.homework.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "course")
public class Course implements Serializable, Comparable<Course>{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	
	@ManyToOne
	@JoinColumn
	private Semester semester;
	
	private String courseId;
	private String name;
	private String type;
	private String credit;
	private String time;
	private String location;
	
	
	@ManyToMany(cascade = CascadeType.PERSIST,fetch=FetchType.LAZY)
	@JoinTable(
		    name="COURSE_USER",
		    joinColumns=@JoinColumn(name="COURSE_ID"),
		    inverseJoinColumns=@JoinColumn(name="USER_ID")
		  )
	private Set<User> student;
	
	@ManyToMany(cascade = CascadeType.MERGE, fetch=FetchType.EAGER)
	@JoinTable(
		    name="COURSE_TEACHER",
		    joinColumns=@JoinColumn(name="COURSE_ID"),
		    inverseJoinColumns=@JoinColumn(name="USER_ID")
		  )
	private Set<User> teachers;
	
	public Set<User> getTeachers() {
		return teachers;
	}
	public void setTeachers(Set<User> teachers) {
		this.teachers = teachers;
	}
	
	@OneToMany(cascade = CascadeType.MERGE, fetch=FetchType.EAGER)
	@JoinTable(
		    name="COURSE_ASSISTANT",
		    joinColumns=@JoinColumn(name="COURSE_ID"),
		    inverseJoinColumns=@JoinColumn(name="USER_ID")
		  )
	private Set<User> assistant;
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinTable(
		    name="course_homework",
		    joinColumns=@JoinColumn(name="course_id"),
		    inverseJoinColumns=@JoinColumn(name="homework_id")
		  )
	@Fetch(value = FetchMode.SUBSELECT)
	private Set<Homework> homeworks;
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinTable(
		    name="course_message",
		    joinColumns=@JoinColumn(name="course_id"),
		    inverseJoinColumns=@JoinColumn(name="message_id")
		  )
	@Fetch(value = FetchMode.SUBSELECT)
	private Set<Message> messages;
	

	@OneToOne(mappedBy = "course")
	private CourseFile courseFile;
	
	
	public Set<User> getAssistant() {
		return assistant;
	}
	public void setAssistant(Set<User> assistant) {
		this.assistant = assistant;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	

	public Semester getSemester() {
		return semester;
	}
	public void setSemester(Semester semester) {
		this.semester = semester;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCredit() {
		return credit + ".0";
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public Set<User> getStudent() {
		return student;
	}
	public void setStudent(Set<User> student) {
		this.student = student;
	}
	public Set<Homework> getHomeworks() {
		return homeworks;
	}
	public void setHomeworks(Set<Homework> homeworks) {
		this.homeworks = homeworks;
	}
	@Override
	public String toString() {
		return "Course [id=" + id + ", semester=" + semester + ", courseId="
				+ courseId + ", name=" + name + ", type=" + type + ", credit="
				+ credit + ", time=" + time + ", location=" + location
				+ "]";
	}
	@Override
	public int compareTo(Course o) {
		return this.getId() - o.getId();
	}
	public CourseFile getCourseFile() {
		return courseFile;
	}
	public void setCourseFile(CourseFile courseFile) {
		this.courseFile = courseFile;
	}
	
	

	
	
	

}
