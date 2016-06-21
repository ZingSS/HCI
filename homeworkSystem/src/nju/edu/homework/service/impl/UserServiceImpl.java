package nju.edu.homework.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.edu.homework.dao.UserDao;
import nju.edu.homework.model.Course;
import nju.edu.homework.model.File;
import nju.edu.homework.model.Grade;
import nju.edu.homework.model.Semester;
import nju.edu.homework.model.User;
import nju.edu.homework.service.UserService;
import nju.edu.homework.util.ResultMessage;
import nju.edu.homework.vo.StatStudentCourseNumVO;
import nju.edu.homework.vo.StudentFuzzyVO;
import nju.edu.homework.vo.StudentInOrAssisVO;
import nju.edu.homework.vo.StudentSubmitGradeVO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	@Override
	/**
	 * 返回登录结果
	 */
	public User login(String userId, String password) {
		String columns[] = {"userId", "password"};
		String values[] = {userId, password};
		List<User> list = userDao.find(columns, values);
		if (list == null ) {
			System.out.println("登录失败");
			return null;
		}
		else{
			User user = list.get(0);
			System.out.println("登录成功");
			return user;
		}
	}


	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}


	@Override
	public ResultMessage register(User user) {
		return userDao.save(user);
	}


	@Override
	public List<User> getUserByRole(String role) {
		String columns[] = {"role"};
		String values[] = {role};
		return userDao.find(columns, values);
	}


	@Override
	public ResultMessage update(User user) {
		return userDao.updateByUserId(user);
	}


	@Override
	public ResultMessage delete(User user) {
		return userDao.delete(user);
	}


	@Override
	public User getUserById(int id) {
		String columns[] = {"id"};
		Object values[] = {id};
		List<User> users = userDao.find(columns, values);
		if (users == null) {
			return null;
		}
		return users.get(0);
	}


	@Override
	public ResultMessage deleteById(int id) {
		userDao.delelte(id);
		return null;
	}


	@Override
	public List<User> getStudentByFuzzy(StudentFuzzyVO vo) {
		String columns[] = {"userId", "name", "role"};
		String values[] = {vo.getStudentId(), vo.getName(), "student"};
		return userDao.fuzzySearch(columns, values);
	}


	@Override
	public Course getAssistantCourseByid(int id) {
		return userDao.getUserById(id).getAssistantCourse();
	}


	@Override
	public User getuserByUserId(String userId) {
		String columns[] = {"userId"};
		Object values[] = {userId};
		List<User> users = userDao.find(columns, values);
		if (users != null) {
			return users.get(0);
		}
 		return null;
	}

	@Override
	public int getTeacherCourseNumBySemester(int id, String semester) {
		User user = getUserById(id);
		Set<Course> courses = user.getTeacherCourse();
		if (courses == null || courses.size() == 0) {
			return 0;
		}
		return getCourseNumBySemester(courses, semester);
	}


	@Override
	public int getStudentCourseNumBySemester(int id, String semester) {
		User user = getUserById(id);
		Set<Course> courses = user.getStudentCourse();
		if (courses == null || courses.size() == 0) {
			return 0;
		}
		return getCourseNumBySemester(courses, semester);
	}

	private int getCourseNumBySemester(Set<Course> courses, String semester){
		int number = 0;
		for(Course course : courses){
			if(course.getSemester().getName().equals(semester)){
				number++;
			}
		}
		return number;
	}

	private List<Course> getCourseBySemester(Set<Course> courses, String semester){
		List<Course> result = new ArrayList<Course>();
		for(Course course : courses){
			if(course.getSemester().getName().equals(semester)){
				result.add(course);
			}
		}
		return result;
	}


	@Override
	public List<Course> getTeacherCourseBySemester(int id, String semester) {
		User user = getUserById(id);
		Set<Course> courses = user.getTeacherCourse();
		if (courses == null || courses.size() == 0) {
			return null;
		}
		return getCourseBySemester(courses, semester);
	}

	@Override
	public List<Course> getStudentCourseBySemester(int id, String semester) {
		User user = getUserById(id);
		Set<Course> courses = user.getStudentCourse();
		if (courses == null || courses.size() == 0) {
			return null;
		}
		return getCourseBySemester(courses, semester);
	}


	@Override
	public boolean isAssistant(int id) {
		User user = getUserById(id);
		return user.getAssistantCourse()==null?false:true;
	}


	@Override
	public boolean isAssistantInSemester(int id, String semester) {
		User user = getUserById(id);
		if (user.getAssistantCourse()==null) {
			return false;
		}
		Semester s = user.getAssistantCourse().getSemester();
		return s.getName().equals(semester);
	}


	@Override
	public StatStudentCourseNumVO getSACourseNumBySemester(int userId, String semester) {
		int courseNum = getStudentCourseNumBySemester(userId, semester);
		int assistantCourseNum = (isAssistantInSemester(userId, semester)?1:0);

		return new StatStudentCourseNumVO(courseNum, assistantCourseNum);
	}


	@Override
	public StudentSubmitGradeVO getStudentSubmitAndGrade(int userId, int homeworkId) {
		User user = getUserById(userId);
		Set<File> files = user.getFiles();
		boolean submit = false;
		for(File file : files){
			if (file.getHomework().getId() == homeworkId) {
				submit = true;
				break;
			}
		}
		Grade returnGrade = null;
		Set<Grade> grades = user.getGrades();
		for (Grade grade : grades) {
			if (grade.getHomework().getId() == homeworkId) {
				returnGrade = grade;
				break;
			}
		}
		return new StudentSubmitGradeVO(submit, returnGrade);
	}


	@Override
	public StudentInOrAssisVO isInOrAssis(int userId, int courseId) {
		User user = getUserById(userId);

		boolean isIn = false;
		for(Course course: user.getStudentCourse()){
			if (course.getId() == courseId) {
				isIn = true;
				break;
			}
		}
		int assistantCourseId = (user.getAssistantCourse()==null?0:user.getAssistantCourse().getId());
		StudentInOrAssisVO vo = new StudentInOrAssisVO(isIn, assistantCourseId);
		return vo;
	}


}
