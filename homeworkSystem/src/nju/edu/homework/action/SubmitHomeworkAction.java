package nju.edu.homework.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Grade;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.FileService;
import nju.edu.homework.service.GradeService;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.service.UserService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.AssistantStudentHomworkVO;
import nju.edu.homework.vo.OnlineUserVO;
import nju.edu.homework.vo.StudentHomeworkVO;
import nju.edu.homework.vo.StudentSubmitGradeVO;

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
	private List<Grade> homeworkGrades;
	
	private Timestamp currentTime;
	private boolean submit;
	
	// -------------------- 显示图表使用 ------------------------
	private List<AssistantStudentHomworkVO> studentList;
	private int full = 0;	//满分是多少？如果所有成绩里的最高分在10以下（含），full等于最高分。10以上，就是100.
	
	//如果full == 100,60以下一组，60以上隔10一组。否则，从0开始到最高分，隔1分一组
	private List<List<AssistantStudentHomworkVO>> grades;
	
	private List<Integer> heights;
	// -------------------- 显示图表使用 ------------------------
	
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
	
	@SuppressWarnings("unchecked")
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
		StudentSubmitGradeVO ssgVo = userService.getStudentSubmitAndGrade(user.getId(), homeworkId);
		setSubmit(ssgVo.isSubmit());
		if(homework.getState().equals(Common.PASS)){
			Grade grade = gradeService.getGradeByUserAndHomework(user.getId(), homework.getId());
			
			homeworkVO = new StudentHomeworkVO(homework, ssgVo.isSubmit(), grade.getGrade(), grade.getComment());
			setHomeworkVO(homeworkVO);
			
			setHomeworkGrades(gradeService.getGradesByHomeworkId(homework.getId()));
		}
		
		// TODO 下面的算法效率很低但是我喜欢 by dxh
		// TODO 下面的代码虽然是复制的但是我喜欢 by cylong
		
		List<User> students = new ArrayList<User>(courseService.getStudentsByCourseId(courseId));
		studentList = new ArrayList<AssistantStudentHomworkVO>();
		for(User student : students){
			StudentSubmitGradeVO ssgvo = userService.getStudentSubmitAndGrade(student.getId(), homeworkId);
			boolean submit = ssgvo.isSubmit();
			Grade grade = ssgvo.getGrade();
			AssistantStudentHomworkVO vo = null;
			if (grade == null) {
				vo = new AssistantStudentHomworkVO(student.getId(), student.getUserId(),
						student.getName(), submit, "", "");
			}
			else{
				vo = new AssistantStudentHomworkVO(student.getId(), student.getUserId(),
						student.getName(), submit, grade.getGrade(), grade.getComment());
			}
			studentList.add(vo);			
		}
		
		int max = 0;
		for (AssistantStudentHomworkVO vo : studentList) {
			if (getGrade(vo) > max) max = getGrade(vo);
		}
		
		if (max > 10) full = 100;
		else full = max;
		
		grades = new ArrayList<List<AssistantStudentHomworkVO>>();
		if (full == 100) {
			for (int i=0; i<5;i++) {
				grades.add(new ArrayList<AssistantStudentHomworkVO>());
			}
			for (AssistantStudentHomworkVO student : studentList) {
				if (getGrade(student) < 60) grades.get(0).add(student);
				else if (getGrade(student) < 70) grades.get(1).add(student);
				else if (getGrade(student) < 80) grades.get(2).add(student);
				else if (getGrade(student) < 90) grades.get(3).add(student);
				else grades.get(4).add(student);
			}
		}
		else {
			for (int i=0; i<full + 1; i++) {	//如果满分3分，就会有0 1 2 3四段
				grades.add(new ArrayList<AssistantStudentHomworkVO>());
			}
			for (AssistantStudentHomworkVO student : studentList) {
				grades.get(getGrade(student)).add(student);
			}
		}
		
		heights = new ArrayList<Integer>();
		for (int i=0;i<grades.size();i++) {
			heights.add(grades.get(i).size());
		}
		
		return SUCCESS;
	}
	
	private int getGrade(AssistantStudentHomworkVO student) {
		if (student.getGrade() == null) return 0;
		if (student.getGrade().length() == 0) return 0;
		if (student.getGrade().contains(".")) {
			return Integer.parseInt(student.getGrade().substring(0, student.getGrade().indexOf('.')));
		}
		else{
			return Integer.parseInt(student.getGrade());
		}
	}
	
	@SuppressWarnings("unchecked")
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

	public List<Grade> getHomeworkGrades() {
		return homeworkGrades;
	}

	public void setHomeworkGrades(List<Grade> homeworkGrades) {
		this.homeworkGrades = homeworkGrades;
	}

	public boolean isSubmit() {
		return submit;
	}

	public void setSubmit(boolean isSubmit) {
		this.submit = isSubmit;
	}
	
	public int getFull() {
		return full;
	}
	
	public void setFull(int full) {
		this.full = full;
	}

	public List<List<AssistantStudentHomworkVO>> getGrades() {
		return grades;
	}
	
	public void setGrades(List<List<AssistantStudentHomworkVO>> grades) {
		this.grades = grades;
	}
	
	public List<Integer> getHeights() {
		return heights;
	}

	public void setHeights(List<Integer> heights) {
		this.heights = heights;
	}

	public List<AssistantStudentHomworkVO> getStudentList() {
		return studentList;
	}
	
	public void setStudentList(List<AssistantStudentHomworkVO> studentList) {
		this.studentList = studentList;
	}
	
}
