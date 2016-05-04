package nju.edu.homework.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.edu.homework.dao.CourseDao;
import nju.edu.homework.dao.CourseFileDao;
import nju.edu.homework.model.Course;
import nju.edu.homework.model.CourseFile;
import nju.edu.homework.service.CourseFileService;

@Service
public class CourseFileServiceImpl implements CourseFileService{

	@Autowired
	private CourseFileDao courseFileDao;
	@Autowired
	private CourseDao courseDao;
	
	@Override
	public void addCourseFile(CourseFile file, int courseId) {
		Course course = courseDao.getCourseById(courseId);
		file.setCourse(course);
		courseFileDao.saveFile(file);
		course.setCourseFile(file);
		courseDao.updateByCourseId(course);
	}

	@Override
	public boolean hasExported(int courseId) {
		List<CourseFile> lists = courseFileDao.getAll();
		for(CourseFile cf : lists){
			if (cf.getCourse().getId() == courseId) {
				return true;
			}
		}
		return false;
	}

	@Override
	public CourseFile getFileByCourseId(int courseId) {
		Course course = courseDao.getCourseById(courseId);
		return course.getCourseFile();
	}

}
