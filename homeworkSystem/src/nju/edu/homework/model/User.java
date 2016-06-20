package nju.edu.homework.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "user")
public class User implements Serializable, Comparable<User>{
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id; 	// 主键
	@Column(unique = true)
	private String userId;	// 用户登录的帐号
	private String password;// 用户密码
	private String name;	// 用户名字
	private String role;	// 用户的角色
	private Timestamp createdTime;	// 用户被创建的时间
	
	@ManyToMany(cascade = {CascadeType.PERSIST},fetch=FetchType.LAZY)
	private Set<Course> studentCourse;
	
	@ManyToMany(
		    cascade = {CascadeType.PERSIST, CascadeType.MERGE},
		    mappedBy = "teachers",
		    targetEntity = Course.class,
		    fetch=FetchType.LAZY
		  )
	private Set<Course> teacherCourse;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@Fetch(FetchMode.SELECT)
	private Course assistantCourse;
	
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REFRESH},fetch=FetchType.LAZY)
	@JoinTable(
		    name="user_file",
		    joinColumns=@JoinColumn(name="user_id"),
		    inverseJoinColumns=@JoinColumn(name="file_id")
		  )
	@Fetch(value = FetchMode.SUBSELECT)
	private Set<File> files;
	
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REFRESH}, fetch=FetchType.LAZY)
	@JoinTable(
		    name="user_grade",
		    joinColumns=@JoinColumn(name="user_id"),
		    inverseJoinColumns=@JoinColumn(name="grade_id")
		  )
	@Fetch(value = FetchMode.SUBSELECT)
	private Set<Grade> grades;
	
	public User() {
	}
	
	public User(int id) {
		this.id = id;
	}
	
	public Set<Grade> getGrades() {
		return grades;
	}
	public void setGrades(Set<Grade> grades) {
		this.grades = grades;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public Timestamp getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Timestamp createdTime) {
		this.createdTime = createdTime;
	}
	
	// 可能要添加一对多或者一对一或者多对多的关系
	public Set<Course> getStudentCourse() {
		return studentCourse;
	}
	public void setStudentCourse(Set<Course> studentCourse) {
		this.studentCourse = studentCourse;
	}
	
	public Set<Course> getTeacherCourse() {
		return teacherCourse;
	}
	public void setTeacherCourse(Set<Course> teacherCourse) {
		this.teacherCourse = teacherCourse;
	}
	public Course getAssistantCourse() {
		return assistantCourse;
	}
	public void setAssistantCourse(Course assistantCourse) {
		this.assistantCourse = assistantCourse;
	}
	public Set<File> getFiles() {
		return files;
	}
	public void setFiles(Set<File> files) {
		this.files = files;
	}
	
	@Override
	public int compareTo(User o) {
		return Integer.parseInt(this.getUserId())-Integer.parseInt(o.getUserId());
	}

}
