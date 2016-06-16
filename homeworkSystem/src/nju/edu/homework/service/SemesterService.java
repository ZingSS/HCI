package nju.edu.homework.service;

import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Semester;
import nju.edu.homework.util.ResultMessage;

public interface SemesterService {
	
	public ResultMessage addNewSemester(Semester semester);
	
	public ResultMessage updateSemester(Semester semester);
	
	public ResultMessage deleteSemester(Semester semeser);
	
	public List<Semester> getAllSemesters();

	public Semester getLastSemester();
	public List<Course> getCourseOfLastSemester();

	public List<String> getAllStringSemesters();
	public List<String> getActiveStringSemester();
	public List<String> getValidSemesterName();

	public List<Course> getCourseBySemester(String semester);

	public int getSemesterByName(String parameter);

	public Semester getSemester(String semester);

	public List<Semester> getValidSemester();
	

}
