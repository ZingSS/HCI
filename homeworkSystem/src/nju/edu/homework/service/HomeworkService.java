package nju.edu.homework.service;

import java.util.List;

import nju.edu.homework.model.Announcement;
import nju.edu.homework.model.Homework;
import nju.edu.homework.util.ResultMessage;
import nju.edu.homework.vo.ExcelVO;
import nju.edu.homework.vo.StatGradesVO;

public interface HomeworkService {
	
	public int addHomework(Homework homework, int courseId);
	
	public ResultMessage delete(Homework homework);
	
	public ResultMessage update(Homework homework);
	
	public List<Homework> getAllHomeworks();
	
	public Homework getHomeworkById(int homeworkId);

	public void changeToApproval(int homeworkId);
	
	public void changeToFailed(int homeworkId);
	
	public void changeToPass(int homeworkId);

	public StatGradesVO getStatGrades(int id);

	public boolean isStudentSubmit(int homeworkId, int studentId);

	public double getGradeByStudent(int homeworkId, int studentId);

	public List<ExcelVO> getStudentGrade(int id);
	
	public void addAnnouncement(Announcement an);

}
