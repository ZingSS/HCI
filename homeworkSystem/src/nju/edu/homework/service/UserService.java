package nju.edu.homework.service;

import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.User;
import nju.edu.homework.util.ResultMessage;
import nju.edu.homework.vo.StatStudentCourseNumVO;
import nju.edu.homework.vo.StudentFuzzyVO;
import nju.edu.homework.vo.StudentInOrAssisVO;
import nju.edu.homework.vo.StudentSubmitGradeVO;

public interface UserService {
	
	public User login(String userId, String password);
	
	public List<User> getAllUsers();
	
	public List<User> getUserByRole(String role);
	
	public List<User> getStudentByFuzzy(StudentFuzzyVO vo);
 	
	public User getUserById(int id);
	
	public ResultMessage register(User user);
	
	public ResultMessage update(User user);
	
	public ResultMessage delete(User user);
	
	public ResultMessage deleteById(int id);

	public Course getAssistantCourseByid(int id);

	public User getuserByUserId(String userId);

	public int getTeacherCourseNumBySemester(int id, String semester);

	public int getStudentCourseNumBySemester(int id, String semester);

	public List<Course> getTeacherCourseBySemester(int id, String semester);
	
	public List<Course> getStudentCourseBySemester(int id, String semester);

	public boolean isAssistant(int id);

	public boolean isAssistantInSemester(int id, String semester);

	public StatStudentCourseNumVO getSACourseNumBySemester(int userId,String semester);

	public StudentSubmitGradeVO getStudentSubmitAndGrade(int id, int homeworkId);

	public StudentInOrAssisVO isInOrAssis(int id, int courseId);
	
}
