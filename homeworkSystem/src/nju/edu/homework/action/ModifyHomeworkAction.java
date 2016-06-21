package nju.edu.homework.action;

import nju.edu.homework.model.Homework;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.HomeworkService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

public class ModifyHomeworkAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	@Autowired
	private CourseService courseService;
	@Autowired
	private HomeworkService homeworkService;

	private Homework homework;
	private int courseId;
	private int homeworkId;

	@Action(
			value = "toModifyHomework",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/modifyHomework.jsp"),
			})
	public String execute() throws Exception {
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		setCourseId(courseId);
		setHomeworkId(homeworkId);
		setHomework(homeworkService.getHomeworkById(homeworkId));
		return SUCCESS;
	}

	@Action(
			value = "modifyHomework",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/toApprovalHomework.action", type = "redirect",
							params = {"homeworkId", "${homeworkId}", "courseId", "${courseId}"}),
			})
	public String modifyHomework() throws Exception {
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		setCourseId(courseId);
		setHomeworkId(homeworkId);
		homework.setId(homeworkId);
		homeworkService.update(homework);
		return SUCCESS;
	}

	public Homework getHomework() {
		return homework;
	}

	public void setHomework(Homework homework) {
		this.homework = homework;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getHomeworkId() {
		return homeworkId;
	}

	public void setHomeworkId(int homeworkId) {
		this.homeworkId = homeworkId;
	}
}
