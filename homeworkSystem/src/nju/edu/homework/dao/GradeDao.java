package nju.edu.homework.dao;

import java.util.List;

import nju.edu.homework.model.Grade;
import nju.edu.homework.util.ResultMessage;

public interface GradeDao {

	public ResultMessage save(Grade grade);
	
	public int saveAndGetId(Grade grade);
	
	public ResultMessage delete(Grade grade);
	
	public ResultMessage updateGradeById(Grade grade);
	
	public List<Grade> find(String[] columns, Object[] values);
	
	public List<Grade> getAllGrades();
	
	public Grade getGradeById(int id);
}
