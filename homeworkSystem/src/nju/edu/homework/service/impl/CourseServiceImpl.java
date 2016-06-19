package nju.edu.homework.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.edu.homework.dao.CourseDao;
import nju.edu.homework.dao.SemesterDao;
import nju.edu.homework.dao.UserDao;
import nju.edu.homework.model.Announcement;
import nju.edu.homework.model.Course;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.Semester;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.util.Common;
import nju.edu.homework.util.ResultMessage;
import nju.edu.homework.vo.CourseUpdateVO;
import nju.edu.homework.vo.HomeworkStateListVO;
import nju.edu.homework.vo.HomeworkStateNumVO;
import nju.edu.homework.vo.StatStudentHomeworkVO;

@Service
public class CourseServiceImpl implements CourseService{
	
	@Autowired
	private CourseDao courseDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private SemesterDao semesterDao;
	
	
	@Override
	public ResultMessage addCourse(Course course, int semesterId) {
		Semester semester = semesterDao.getSemesterById(semesterId);
		course.setSemester(semester);
		courseDao.saveAndGetId(course);
		semester.getCourses().add(course);
		return semesterDao.update(semester);
	}

	@Override
	public ResultMessage delete(Course course) {
		return courseDao.delete(course);
	}
	
	@Override
	public ResultMessage update(Course course) {
		return courseDao.updateByCourseId(course);
	}

	@Override
	public void update(CourseUpdateVO vo) {
		Course course = getCourseById(vo.getId());
		course.setCourseId(vo.getCourseId());
		course.setName(vo.getName());
		course.setLocation(vo.getPosition());
		course.setCredit(vo.getCredit());
		course.setType(vo.getType());
		course.setTime(vo.getTime());
		update(course);
	}
	
	@Override
	public List<Course> getAllCourse() {
		return Common.sortCourse(courseDao.getAllCourse());
	}

	@Override
	public Course getCourseById(int id) {
		String columns[] = {"id"};
		Object values[] = {id};
		List<Course> courses = courseDao.find(columns, values);
		if (courses == null) {
			return null;
		}
		return courses.get(0);
	}

	@Override
	public List<Course> getCourseByTeacherId(int teacherId) {
		return Common.sortCourse(new ArrayList<Course>(userDao.getUserById(teacherId).getTeacherCourse()));
	}

	@Override
	public ResultMessage addStudent(int courseId, int studentId) {
		Course course = courseDao.getCourseById(courseId);
		User student = userDao.getUserById(studentId);
		if (student.getStudentCourse().add(course)) {
			course.getStudent().add(student);
			userDao.merge(student);
			return courseDao.merge(course);
		}
		System.out.println("添加失败");
		return ResultMessage.FAILURE;
		
	}

	@Override
	public Set<User> getStudentsByCourseId(int courseId) {
		Course course = courseDao.getCourseById(courseId);
		return course.getStudent();
	}

	@Override
	public ResultMessage removeStudent(int courseId, int studentId) {
		Course course = courseDao.getCourseById(courseId);
		Set<User> students = course.getStudent();
		User deleteS = new User();
		for (User s : students) {
			if (s.getId() == studentId) {
				deleteS = s;
			}	
		}
		if (deleteS.getStudentCourse().remove(course)) {
			System.out.println("删除成功啦");
		}
		if (course.getStudent().remove(deleteS)) {
			System.out.println("这个也成功啦");
		}
		userDao.updateByUserId(deleteS);			// 结果是两边都要更新……
		return courseDao.merge(course);
	}

	@Override
	public ResultMessage removeTeacher(int teacherId, int courseId) {
		Course course = courseDao.getCourseById(courseId);
		Set<User> teachers = course.getTeachers();
		User deleteS = new User();
		for (User s : teachers) {
			if (s.getId() == teacherId) {
				deleteS = s;
			}	
		}
		if (deleteS.getTeacherCourse().remove(course)) {
			System.out.println("删除成功啦");
		}
		if (course.getTeachers().remove(deleteS)) {
			System.out.println("这个也成功啦");
		}
		userDao.updateByUserId(deleteS);			// 结果是两边都要更新……
		return courseDao.merge(course);
	}

	@Override
	public ResultMessage addAssistant(int courseId, int studentId) {
		Course course = courseDao.getCourseById(courseId);
		User student = userDao.getUserById(studentId);
		if (!studentIsAssistant(student)) {			// 如果这个学生不是其他课的助教
			student.setAssistantCourse(course);
			System.out.println("该学生不是其他课的助教");
			if (course.getAssistant().add(student)) {
				System.out.println("为什么报错?");
				return courseDao.merge(course);
			}
		}
		System.out.println("添加失败");
		return ResultMessage.IS_ASSISTANT;
	}

	@Override
	public ResultMessage removeAssistant(int courseId, int studentId) {
		Course course = courseDao.getCourseById(courseId);
		Set<User> students = course.getAssistant();
		User student = userDao.getUserById(studentId);
		
		User deleteS = new User();
		for (User s : students) {
			if (s.getId() == studentId) {
				deleteS = s;
			}	
		}
		student.setAssistantCourse(null);
		if (course.getAssistant().remove(deleteS)) {
			System.out.println("删除助教成功啦");
		}
		userDao.updateByUserId(student);
		return courseDao.merge(course);
	}
	


	private boolean studentIsAssistant(User student){
		if (student.getAssistantCourse() != null) {
			System.out.println(student.getAssistantCourse().getCourseId() + "啊为什么");
			return true;
		}
		return false;
	}

	@Override
	public List<User> getAssistantByCourse(int id) {
		Course course = courseDao.getCourseById(id);
		return new ArrayList<User>(course.getAssistant());
	}

	@Override
	public List<Homework> getHomeworkByCourseId(int id) {
		Course course = courseDao.getCourseById(id);
		List<Homework> homeworks = new ArrayList<Homework>(course.getHomeworks());
		Collections.sort(homeworks);
		return homeworks;
	}

	@Override
	public List<Course> getCourseByStudentId(int id) {
		User user = userDao.getUserById(id);
		return Common.sortCourse(new ArrayList<Course>( user.getStudentCourse()));
	}

	@Override
	public String getCourseNameById(int courseId) {
		return courseDao.getCourseById(courseId).getName();
	}
	
	private boolean isHomeworkInMonth(String month, Homework homework){
		long begin = homework.getCreatedTime().getTime();
		Calendar beginCal = Calendar.getInstance();
		beginCal.setTimeInMillis(begin);
		int beginMon = beginCal.get(Calendar.MONTH) + 1;
		
		long end = homework.getStudentDDL().getTime();
		Calendar endCal = Calendar.getInstance();
		endCal.setTimeInMillis(end);
		int endMon = endCal.get(Calendar.MONTH) + 1;
		
		int m = Integer.parseInt(month);
		return ((m-beginMon)>=0 && (endMon-m)>=0)?true:false;
	}

	@Override
	public ResultMessage addTeacher(int teacherId, int courseId) {
		User teacher = userDao.getUserById(teacherId);
		Course course = courseDao.getCourseById(courseId);
		if (teacher.getTeacherCourse().add(course)) {
			course.getTeachers().add(teacher);
			return courseDao.merge(course);
		}
		System.out.println("添加教师失败");
		return ResultMessage.FAILURE;
	}

	@Override
	public List<Boolean> isUserInCourse(List<User> teacherList, int courseId) {
		List<Boolean> isInCourse = new ArrayList<Boolean>();
		Course course = getCourseById(courseId);
		boolean isIn = false;
		for(User teacher : teacherList){
			for( User user: course.getTeachers()){
				if (teacher.getId() == user.getId()) {
					isIn = true;
				}
			}
			isInCourse.add(isIn);
			isIn = false;
		}
		return isInCourse;
	}

	@Override
	public int getMonthHomeworkNumber(int courseId, String month) {
		int number = 0;
		List<Homework> homeworks = getHomeworkByCourseId(courseId);
		if (homeworks == null || homeworks.size() == 0) {
			System.out.println("这个课程根本没有布置作业");
			return number;
		}
		for (Homework homework : homeworks) {
			if (isHomeworkInMonth(month, homework)) {
				number++;
			}
		}
		return number;
	}

	@Override
	public List<Homework> getMonthHomework(int courseId, String month) {
		List<Homework> homeworks = getHomeworkByCourseId(courseId);
		if (homeworks == null || homeworks.size() == 0) {
			return null;
		}
		List<Homework> monthHomeworks = new ArrayList<Homework>();
		for (Homework homework : homeworks) {
			if (isHomeworkInMonth(month, homework)) {
				monthHomeworks.add(homework);
			}
		}
		return monthHomeworks;
	}

	@Override
	public List<Homework> getPassHomworkByMonth(int courseId, String month) {
		List<Homework> homeworks = getHomeworkByCourseId(courseId);
		if (homeworks == null || homeworks.size() == 0) {
			return null;
		}
		List<Homework> passHomeworks = new ArrayList<Homework>();
		for (Homework homework : homeworks) {
			if (homework.getState().equals(Common.PASS) && isHomeworkInMonth(month, homework)) {
				passHomeworks.add(homework);
			}
		}
		return passHomeworks;
	}

	@Override
	public StatStudentHomeworkVO getStatAssisHomeworkByMonth(int courseId, String month) {
		List<Homework> homeworks = getHomeworkByCourseId(courseId);
		List<Homework> passHomeworks = new ArrayList<Homework>();	
		int commit = 0, over = 0, pass = 0;
		if (homeworks == null || homeworks.size() == 0) {
			return null;
		}
		Timestamp current = new Timestamp(System.currentTimeMillis());
		for(Homework homework : homeworks){
			if (!isHomeworkInMonth(month, homework)) {
				continue;
			}
			if(homework.getStudentDDL().after(current)){
				commit+=1;
			}
			else if(!homework.getState().equals(Common.PASS)){
				over+=1;
			}
			else if(homework.getState().equals(Common.PASS)){
				pass+=1;
				over+=1;
				passHomeworks.add(homework);
			}
		}
		HomeworkStateNumVO nums = new HomeworkStateNumVO(commit, over, pass);
		return new StatStudentHomeworkVO(nums, passHomeworks);
	}

	@Override
	public StatStudentHomeworkVO getStatStHomeworkByMonth(int courseId, String month) {
		List<Homework> homeworks = getHomeworkByCourseId(courseId);
		List<Homework> overHomeworks = new ArrayList<Homework>();	
		List<Homework> passHomeworks = new ArrayList<Homework>();	
		int commit = 0, over = 0, pass = 0;
		if (homeworks == null || homeworks.size() == 0) {
			return null;
		}
		Timestamp current = new Timestamp(System.currentTimeMillis());
		for(Homework homework : homeworks){
			if (!isHomeworkInMonth(month, homework)) {
				continue;
			}
			if(homework.getStudentDDL().after(current)){
				commit+=1;
			}
			else if(!homework.getState().equals(Common.PASS)){
				over+=1;
				overHomeworks.add(homework);
			}
			else if(homework.getState().equals(Common.PASS)){
				pass+=1;
				passHomeworks.add(homework);
				over+=1;
				overHomeworks.add(homework);
			}
		}
		HomeworkStateNumVO nums = new HomeworkStateNumVO(commit, over, pass);
		HomeworkStateListVO lists = new HomeworkStateListVO(overHomeworks, passHomeworks);
		return new StatStudentHomeworkVO(nums, lists);
	}

	@Override
	public List<Announcement> getAnnouncementByCid(int id) {
		return courseDao.getAnnouncement(id);
	}
	


}
