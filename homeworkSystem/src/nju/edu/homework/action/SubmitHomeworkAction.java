package nju.edu.homework.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Grade;
import nju.edu.homework.model.Homework;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.FileService;
import nju.edu.homework.service.GradeService;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.service.UserService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.OnlineUserVO;
import nju.edu.homework.vo.StudentHomeworkVO;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class SubmitHomeworkAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private FileService fileService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private HomeworkService homeworkService;
	@Autowired
	private GradeService gradeService;
	
	private File file;
	private String fileContentType;
	private String fileFileName;
	
	private int homeworkId;
	private int courseId;
	
	private String courseName;
	private Homework homework;
	private List<Course> courseList;
	private String semester;
	private Course course;
	
	private StudentHomeworkVO homeworkVO;
	private List<String> grades;
	private List<Grade> homeworkGrades;
	
	private Timestamp currentTime;
	
	public Timestamp getCurrentTime() {
		currentTime = new Timestamp(System.currentTimeMillis());
		return currentTime;
	}
	
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	@Autowired
	private UserService userService;
	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}
	
	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}
	
	@Action(
			value = "toSubmitHomework",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/submitHomework.jsp"),
			})
	
	public String toSubmitHomework() throws Exception {
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		setCourseId(courseId);
		setCourseName(courseService.getCourseNameById(courseId));
		setCourse(courseService.getCourseById(courseId));
		setHomework(homeworkService.getHomeworkById(homeworkId));
		courseList = new ArrayList<Course>();
		OnlineUserVO user = (OnlineUserVO)session.get("onlineUser");
		String term =courseService.getCourseById(courseId).getSemester().getName();
		List<Course> cList = courseService.getCourseByStudentId(user.getId());
		session.put("semester", term);
		setSemester(term);
		for(Course course : cList){
			if (term.equals(course.getSemester().getName())) {
				courseList.add(course);
			}
		}
		setCourseList(courseList);
		
		if(homework.getState().equals(Common.PASS)){
			Grade grade = gradeService.getGradeByUserAndHomework(user.getId(), homework.getId());
			homeworkVO = new StudentHomeworkVO(homework, false, grade.getGrade(), grade.getComment());
			setHomeworkVO(homeworkVO);
			
			List<Homework> homeworks = courseService.getHomeworkByCourseId(courseId);
			setGrades(gradeService.getGradesByStudentIdAndHomeworks(user.getId(), homeworks));
			setHomeworkGrades(gradeService.getGradesByHomeworkId(homework.getId()));
		}
		
		return SUCCESS;
	}
	
	@Action(
			value = "submitHomework",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/toSubmitHomework.action", type="redirect", params = {"homeworkId", "${homeworkId}", "courseId", "${courseId}"}),
			})
	
	public String submitHomework() throws Exception {
		
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));

		setHomeworkId(homeworkId);
		setCourseId(courseId);
		// 保存上传的附件
		saveFile(courseId, homeworkId);
		setCourse(courseService.getCourseById(courseId));
		setHomework(homeworkService.getHomeworkById(homeworkId));
		courseList = new ArrayList<Course>();
		OnlineUserVO user = (OnlineUserVO)session.get("onlineUser");
		String term =courseService.getCourseById(courseId).getSemester().getName();
		List<Course> cList = courseService.getCourseByStudentId(user.getId());
		session.put("semester", term);
		setSemester(term);
		for(Course course : cList){
			if (term.equals(course.getSemester().getName())) {
				courseList.add(course);
			}
		}
		setCourseList(courseList);

		System.out.println("filename:" + file.getName());
		return SUCCESS;
	}
	
	private void saveFile(int courseId, int homeworkId) throws IOException {
		String dir = Common.FILE_PATH + "/Course" + courseId + "/Homework" + homeworkId;
		
		File fileLocation = new File(dir);		
		if (!fileLocation.exists()) {
			boolean isCreated  = fileLocation.mkdirs();
            if(!isCreated) {  
                //目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。  
            	System.out.println("目录创建失败");
            	return;
            }  
		}
		OnlineUserVO user = (OnlineUserVO)session.get("onlineUser");
		String fileName = formatFileName(getFileFileName(), user);
		File fileToCreate = new File(dir, fileName);
        FileUtils.copyFile(getFile(), fileToCreate);
        
        nju.edu.homework.model.File fileEntity = new nju.edu.homework.model.File(fileName, dir);
        if (fileService.haveFile(homeworkId, user.getId())) {
			fileService.updateFile(fileEntity, homeworkId, user.getId());
		}
        else{
        	fileService.addFile(fileEntity, homeworkId, user.getId());
        }
		
	}

	public String formatFileName(String name, OnlineUserVO user){
		String savedName = user.getUserId() + "_" + user.getName();
		int position = name.lastIndexOf(".");   
        String extension = name.substring(position);  
		return savedName + extension ;
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

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public Homework getHomework() {
		return homework;
	}

	public void setHomework(Homework homework) {
		this.homework = homework;
	}

	public StudentHomeworkVO getHomeworkVO() {
		return homeworkVO;
	}

	public void setHomeworkVO(StudentHomeworkVO homeworkVO) {
		this.homeworkVO = homeworkVO;
	}

	public List<String> getGrades() {
		return grades;
	}

	public void setGrades(List<String> grades) {
		this.grades = grades;
	}

	public List<Grade> getHomeworkGrades() {
		return homeworkGrades;
	}

	public void setHomeworkGrades(List<Grade> homeworkGrades) {
		this.homeworkGrades = homeworkGrades;
	}

}
