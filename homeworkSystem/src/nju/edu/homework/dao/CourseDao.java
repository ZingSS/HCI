package nju.edu.homework.dao;

import java.util.List;

import nju.edu.homework.model.Announcement;
import nju.edu.homework.model.Course;
import nju.edu.homework.util.ResultMessage;

public interface CourseDao {
	
	public ResultMessage save(Course course);
	
	public ResultMessage delete(Course course);
	
	public ResultMessage updateByCourseId(Course course);
	
	public List<Course> find(String[] columns, Object[] values);
	
	public List<Course> getAllCourse();
	
	public Course getCourseById(int id);

	public ResultMessage merge(Course course);
	
	public List<String> getAllSemesters();
	
	public int saveAndGetId(Course course);

	public List<Announcement> getAnnouncement(int id);

}
