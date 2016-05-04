package nju.edu.homework.action;

import nju.edu.homework.model.Grade;
import nju.edu.homework.service.GradeService;
import nju.edu.homework.vo.GradeSaveVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class UpdateGradeAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private GradeService gradeService;
	
	private int homeworkId;
	private int courseId;
	
	@Action(value = "updateGrade",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/toCorrectHomework.action", type="redirect",
					params={"homeworkId", "%{homeworkId}", "courseId", "%{courseId}"})
	})
	public String updateGrade() throws Exception{
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		String grade = Double.parseDouble(request.getParameter("grade"))+"";
		String comment = request.getParameter("comment");
		if (gradeService.haveGrade(homeworkId, studentId)) {
			gradeService.update(new GradeSaveVO(new Grade(grade, comment), homeworkId, studentId));
		}
		else{
			gradeService.addGrade(new GradeSaveVO(new Grade(grade, comment), homeworkId, studentId));
		}
		
		setHomeworkId(homeworkId);
		setCourseId(Integer.parseInt(request.getParameter("courseId")));
		return SUCCESS;
	}

	public int getHomeworkId() {
		return homeworkId;
	}

	public void setHomeworkId(int homeworkId) {
		this.homeworkId = homeworkId;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

}
