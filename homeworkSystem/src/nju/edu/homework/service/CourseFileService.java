package nju.edu.homework.service;

import nju.edu.homework.model.CourseFile;

public interface CourseFileService {

	public void addCourseFile(CourseFile savedFile, int courseId);
	
	public boolean hasExported(int courseId);

	public CourseFile getFileByCourseId(int courseId);
}
