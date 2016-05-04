package nju.edu.homework.action;

import java.io.File;
import java.io.IOException;

import nju.edu.homework.model.Homework;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.FileService;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.OnlineUserVO;

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
	
	private File file;
	private String fileContentType;
	private String fileFileName;
	
	private int homeworkId;
	private int courseId;
	
	private String courseName;
	private Homework homework;
	
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
		setHomework(homeworkService.getHomeworkById(homeworkId));
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

}
