package nju.edu.homework.dao;

import java.util.List;

import nju.edu.homework.model.Semester;
import nju.edu.homework.util.ResultMessage;

public interface SemesterDao {

	public ResultMessage save(Semester semester);
	
	public ResultMessage update(Semester semester);
	
	public ResultMessage delete(Semester semester);
	
	public List<Semester> getAllSemesters();

	public Semester getSemesterById(int semesterId);
}
