package nju.edu.homework.dao;

import java.util.List;

import nju.edu.homework.model.CourseFile;
import nju.edu.homework.util.ResultMessage;

public interface CourseFileDao {

	public ResultMessage saveFile(CourseFile courseFile);
	
	public List<CourseFile> getAll();
	
}
