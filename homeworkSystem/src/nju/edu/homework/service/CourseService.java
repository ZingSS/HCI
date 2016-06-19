package nju.edu.homework.service;

import java.util.List;
import java.util.Set;

import nju.edu.homework.model.Announcement;
import nju.edu.homework.model.Course;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.User;
import nju.edu.homework.util.ResultMessage;
import nju.edu.homework.vo.CourseUpdateVO;
import nju.edu.homework.vo.StatStudentHomeworkVO;

public interface CourseService {
	
	public ResultMessage addCourse(Course course, int semesterId);
	
	public ResultMessage delete(Course course);
	
	public ResultMessage update(Course course);
	
	public void update(CourseUpdateVO vo);
	
	public List<Course> getAllCourse();
	
	public Course getCourseById(int id);
	
	public List<Course> getCourseByTeacherId(int teacherId);
	
	public ResultMessage addStudent(int courseId, int studentId);
	
	public ResultMessage addTeacher(int teacherId, int courseId);
	
	public ResultMessage removeTeacher(int teacherId, int courseId);

	public Set<User> getStudentsByCourseId(int parseInt);

	public ResultMessage removeStudent(int courseId, int studentId);

	public ResultMessage addAssistant(int courseId, int studentId);

	public ResultMessage removeAssistant(int courseId, int studentId);

	public List<User> getAssistantByCourse(int id);

	public List<Homework> getHomeworkByCourseId(int id);

	public List<Course> getCourseByStudentId(int id);

	public String getCourseNameById(int courseId);
	
	public List<Boolean> isUserInCourse(List<User> teacherList, int id);

	public int getMonthHomeworkNumber(int courseId, String month);

	public List<Homework> getMonthHomework(int courseId, String month);

	public List<Homework> getPassHomworkByMonth(int courseId, String month);

	public StatStudentHomeworkVO getStatAssisHomeworkByMonth(int courseId, String month);

	public StatStudentHomeworkVO getStatStHomeworkByMonth(int courseId, String month);

	public List<Announcement> getAnnouncementByCid(int id);



	

	
	
	

}
