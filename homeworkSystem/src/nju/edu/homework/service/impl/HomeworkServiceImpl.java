package nju.edu.homework.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.edu.homework.dao.CourseDao;
import nju.edu.homework.dao.HomeworkDao;
import nju.edu.homework.model.Announcement;
import nju.edu.homework.model.Course;
import nju.edu.homework.model.File;
import nju.edu.homework.model.Grade;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.User;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.util.Common;
import nju.edu.homework.util.ResultMessage;
import nju.edu.homework.vo.ExcelVO;
import nju.edu.homework.vo.StatGradesVO;
import nju.edu.homework.vo.StudentGradeVO;

@Service
public class HomeworkServiceImpl implements HomeworkService{

	@Autowired
	private HomeworkDao homeworkDao;

	@Autowired
	private CourseDao courseDao;

	@Override
	public int addHomework(Homework homework, int courseId) {
		Course course = courseDao.getCourseById(courseId);
		homework.setCourse(course);
		homeworkDao.saveAndGetId(homework);
		course.getHomeworks().add(homework);
		courseDao.updateByCourseId(course);
		return homework.getId();
	}

	@Override
	public ResultMessage delete(Homework homework) {
		return homeworkDao.delete(homework);
	}

	@Override
	public ResultMessage update(Homework homework) {
		return homeworkDao.updateHomeworkById(homework);
	}

	@Override
	public List<Homework> getAllHomeworks() {
		return homeworkDao.getAllHomeworks();
	}


	@Override
	public Homework getHomeworkById(int homeworkId) {
		return homeworkDao.getHomeworkById(homeworkId);
	}

	@Override
	public void changeToApproval(int homeworkId) {
		Homework homework = getHomeworkById(homeworkId);
		homework.setState(Common.APPROVAL);
		homeworkDao.updateHomeworkById(homework);
	}

	@Override
	public void changeToFailed(int homeworkId) {
		Homework homework = getHomeworkById(homeworkId);
		homework.setState(Common.COMMIT);
		homework.setFailedTimes(homework.getFailedTimes()+1);
		homeworkDao.updateHomeworkById(homework);
	}

	@Override
	public void changeToPass(int homeworkId) {
		Homework homework = getHomeworkById(homeworkId);
		homework.setState(Common.PASS);
		homework.setPublishedTime(new Timestamp(System.currentTimeMillis()));
		homeworkDao.updateHomeworkById(homework);
	}

	@Override
	public StatGradesVO getStatGrades(int id) {
		List<Grade> grades = new ArrayList<Grade>(getHomeworkById(id).getGrades());
		if (grades == null || grades.size() == 0) {
			return new StatGradesVO(0, 0, 0);
		}
		Collections.sort(grades);
		int length = grades.size();
		double average = 0;
		for(Grade grade : grades){
			average += (Double.parseDouble(grade.getGrade())); 
		}
		average = average/length;
		StatGradesVO vo = new StatGradesVO((int)(Double.parseDouble(grades.get(length-1).getGrade())),
				(int)(Double.parseDouble(grades.get(0).getGrade())),  average);
		return vo;
	}

	@Override
	public boolean isStudentSubmit(int homeworkId, int studentId) {
		Homework homework = getHomeworkById(homeworkId);
		List<File> files = new ArrayList<File>(homework.getFiles());
		for(File file : files){
			if (file.getUser().getId() == studentId) {
				return true;
			}
		}
		return false;
	}

	@Override
	public double getGradeByStudent(int homeworkId, int studentId) {
		List<Grade> grades = new ArrayList<Grade>(getHomeworkById(homeworkId).getGrades());
		for(Grade g: grades){
			if (g.getUser().getId() == studentId) {
				return Double.parseDouble(g.getGrade());
			}
		}
		return 0;
	}

	@Override
	public List<ExcelVO> getStudentGrade(int homeworkId) {
		List<Grade> grades = new ArrayList<Grade>(getHomeworkById(homeworkId).getGrades());
		List<ExcelVO> vos = new ArrayList<ExcelVO>();
		for(Grade grade : grades){
			User user = grade.getUser();
			StudentGradeVO vo = new StudentGradeVO(user, grade.getGrade());
			vos.add(vo);
		}
		return vos;
	}

	@Override
	public void addAnnouncement(Announcement an) {
		homeworkDao.saveAnnouncement(an);
	}


}
