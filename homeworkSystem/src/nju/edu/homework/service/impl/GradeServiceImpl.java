package nju.edu.homework.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.edu.homework.dao.GradeDao;
import nju.edu.homework.dao.HomeworkDao;
import nju.edu.homework.dao.UserDao;
import nju.edu.homework.model.Grade;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.User;
import nju.edu.homework.service.GradeService;
import nju.edu.homework.util.ResultMessage;
import nju.edu.homework.vo.ExcelVO;
import nju.edu.homework.vo.GradeSaveVO;
import nju.edu.homework.vo.StudentExcelVO;
import nju.edu.homework.vo.StudentGradeVO;

@Service
public class GradeServiceImpl implements GradeService{
	
	@Autowired
	private GradeDao gradeDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private HomeworkDao homeworkDao;

	@Override
	public ResultMessage addGrade(GradeSaveVO vo) {
		Homework homework = homeworkDao.getHomeworkById(vo.getHomeworkId());
		User user = userDao.getUserById(vo.getStudentId());
		Grade grade = vo.getGrade();
		grade.setHomework(homework);
		grade.setUser(user);
		gradeDao.saveAndGetId(grade);
		
		homework.getGrades().add(grade);
		user.getGrades().add(grade);
		homeworkDao.updateHomeworkById(homework);
		return userDao.updateByUserId(user);
	}

	@Override
	public ResultMessage delete(Grade grade) {
		return gradeDao.delete(grade);
	}

	@Override
	public ResultMessage update(Grade grade) {
		return gradeDao.updateGradeById(grade);
	}
	
	@Override
	public ResultMessage update(GradeSaveVO vo) {
		Grade grade = getGradeByUserAndHomework(vo.getStudentId(), vo.getHomeworkId());
		grade.setGrade(vo.getGrade().getGrade());
		grade.setComment(vo.getGrade().getComment());
		return update(grade);
	}

	@Override
	public List<Grade> getGradesByHomeworkId(int homeworkId) {
		Homework homework = homeworkDao.getHomeworkById(homeworkId);
		Set<Grade> grades = homework.getGrades();
		if (grades == null) {
			return new ArrayList<Grade>();
		}
		return new ArrayList<Grade>(grades);
	}

	@Override
	public List<Grade> getAllGrades() {
		return gradeDao.getAllGrades();
	}

	@Override
	public Grade getGradeByUserAndHomework(int studentId, int homeworkId) {
		List<Grade> list = getGradesByHomeworkId(homeworkId);
		for(Grade grade : list){
			if (grade.getUser().getId() == studentId) {
				return grade;
			}
		}
		return null;
	}

	@Override
	public List<String> getGradesByStudentsAndHomeworkId(List<User> courseStudentList, int homeworkId) {
		List<String> grades = new ArrayList<String>();
		for(User user : courseStudentList){
			Grade grade = getGradeByUserAndHomework(user.getId(), homeworkId);
			if (grade == null) {
				grades.add("无成绩");
			}
			else{
				grades.add(grade.getGrade());
			}
		}
		return grades;
	}

	@Override
	public List<String> getGradesByStudentIdAndHomeworks(int studentId, List<Homework> homeworkList) {
		List<String> grades = new ArrayList<String>();
		for(Homework homework : homeworkList){
			Grade grade = getGradeByUserAndHomework(studentId, homework.getId());
			if (grade == null) {
				grades.add("无");
			}
			else{
				grades.add(grade.getGrade());
			}
		}
		return grades;
	}

	@Override
	public List<String> getCommentsByStudentsAndHomeworkId(List<User> courseStudentList, int homeworkId) {
		List<String> comments = new ArrayList<String>();
		for(User user : courseStudentList){
			Grade grade = getGradeByUserAndHomework(user.getId(), homeworkId);
			if (grade == null) {
				comments.add("");
			}
			else {
				comments.add(grade.getComment());
			}
		}
		return comments;
	}

	@Override
	public List<String> getCommentsByStudentIdAndHomeworks(int studentId,List<Homework> homeworkList) {
		List<String> comments = new ArrayList<String>();
		for( Homework homework : homeworkList){
			Grade grade = getGradeByUserAndHomework(studentId, homework.getId());
			if (grade == null) {
				comments.add("");
			}
			else {
				comments.add(grade.getComment());
			}
		}
		return comments;
	}

	@Override
	public boolean haveGrade(int homeworkId, int studentId) {
		return getGradeByUserAndHomework(studentId, homeworkId)==null?false:true;
	}

	@Override
	public List<ExcelVO> getStudentGradeById(int homeworkId) {
		List<ExcelVO> vos = new ArrayList<ExcelVO>();
		List<Grade> list = getGradesByHomeworkId(homeworkId);
		for(Grade grade : list){
			User user = grade.getUser();
			StudentExcelVO vo = new StudentExcelVO(user.getUserId(), user.getName(), grade.getGrade(), grade.getComment());
			vos.add(vo);
		}
		return null;
	}

	@Override
	public ResultMessage changeGrade(String grade, int studentId, int homeworkId) {
		if (!haveGrade(homeworkId, studentId)) {
			return ResultMessage.FAILURE;
		}
		Grade g = getGradeByUserAndHomework(studentId, homeworkId);
		g.setGrade(grade);
		update(g);
		return ResultMessage.SUCCESS;
	}

	@Override
	public ResultMessage changeComment(String comment, int studentId, int homeworkId) {
		if (!haveGrade(homeworkId, studentId)) {
			return ResultMessage.FAILURE;
		}
		Grade g = getGradeByUserAndHomework(studentId, homeworkId);
		g.setComment(comment);
		update(g);
		return ResultMessage.SUCCESS;
	}

}
