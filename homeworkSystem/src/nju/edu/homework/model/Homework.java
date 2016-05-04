package nju.edu.homework.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import nju.edu.homework.util.Common;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "homework")
public class Homework implements Serializable, Comparable<Homework>{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id; 	// 主键
	
	private String name;
	private String description;
	private int fileId;
	private int publishFileId;
	private String fileType;
	private Timestamp studentDDL;
	private Timestamp assistantDDL;
	private Timestamp createdTime;
	private Timestamp publishedTime;
	private String state;
	private int failedTimes;
	
	@ManyToOne
	@JoinColumn
	private Course course;
	
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REFRESH},fetch=FetchType.LAZY)
	@JoinTable(
		    name="homework_file",
		    joinColumns=@JoinColumn(name="homework_id"),
		    inverseJoinColumns=@JoinColumn(name="file_id")
		  )
	@Fetch(value = FetchMode.SUBSELECT)
	private Set<File> files;
	
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REFRESH}, fetch=FetchType.LAZY)
	@JoinTable(
		    name="homework_grade",
		    joinColumns=@JoinColumn(name="homework_id"),
		    inverseJoinColumns=@JoinColumn(name="grade_id")
		  )
	@Fetch(value = FetchMode.SUBSELECT)
	private Set<Grade> grades;
	
	public Homework() {
		createdTime = new Timestamp(System.currentTimeMillis());
		state = Common.COMMIT;
	}
	
	public Homework(int id){
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
	
	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public Timestamp getStudentDDL() {
		return studentDDL;
	}

	public void setStudentDDL(Timestamp studentDDL) {
		this.studentDDL = studentDDL;
	}

	public Timestamp getAssistantDDL() {
		return assistantDDL;
	}

	public void setAssistantDDL(Timestamp assistantDDL) {
		this.assistantDDL = assistantDDL;
	}
	
	public Set<File> getFiles() {
		return files;
	}
	public void setFiles(Set<File> files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "Homework [id=" + id + ", name=" + name + ", description="
				+ description + ", fileId=" + fileId + ", fileType=" + fileType
				+ ", studentDDL=" + studentDDL + ", assistantDDL="
				+ assistantDDL + ", course=" + course.getName() + "]";
	}

	public Timestamp getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Timestamp createdTime) {
		this.createdTime = createdTime;
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}


	public int getPublishFileId() {
		return publishFileId;
	}

	public void setPublishFileId(int publishFileId) {
		this.publishFileId = publishFileId;
	}

	@Override
	public int compareTo(Homework o) {
		return o.getId()-this.getId();
	}

	public int getFailedTimes() {
		return failedTimes;
	}

	public void setFailedTimes(int failedTimes) {
		this.failedTimes = failedTimes;
	}

	public Timestamp getPublishedTime() {
		return publishedTime;
	}

	public void setPublishedTime(Timestamp publishedTime) {
		this.publishedTime = publishedTime;
	}

	
	

}
