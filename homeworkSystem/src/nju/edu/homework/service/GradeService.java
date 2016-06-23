package nju.edu.homework.service;

import java.util.List;

import nju.edu.homework.model.Grade;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.User;
import nju.edu.homework.util.ResultMessage;
import nju.edu.homework.vo.ExcelVO;
import nju.edu.homework.vo.GradeSaveVO;

public interface GradeService {

	public ResultMessage addGrade(GradeSaveVO vo);
	
	public ResultMessage delete(Grade grade);
	
	public ResultMessage update(Grade grade);
	
	public ResultMessage update(GradeSaveVO vo);
	
	public List<Grade> getGradesByHomeworkId(int homeworkId);
	
	public List<Grade> getAllGrades();
	
	public Grade getGradeByUserAndHomework(int studentId, int homeworkId);

	public List<String> getGradesByStudentsAndHomeworkId(List<User> courseStudentList, int homeworkId);

	public List<String> getGradesByStudentIdAndHomeworks(int studentId, List<Homework> homeworkList);

	public List<String> getCommentsByStudentsAndHomeworkId(List<User> courseStudentList, int homeworkId);
	
	public List<String> getCommentsByStudentIdAndHomeworks(int studentId, List<Homework> homeworkList);

	public boolean haveGrade(int homeworkId, int studentId);

	public List<ExcelVO> getStudentGradeById(int homeworkId);
	
	public ResultMessage changeGrade(String grade, int studentId, int homeworkId);
	
	public ResultMessage changeComment(String comment, int studentId, int homeworkId);
	
}
