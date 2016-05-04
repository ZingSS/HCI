package nju.edu.homework.action;

import java.io.File;
import java.io.IOException;

import nju.edu.homework.model.Homework;
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
public class AddExampleAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private HomeworkService homeworkService;
	@Autowired
	private FileService fileService;
	
	private Homework Homework;
	
	private File file;
	private String fileFileName;
	private String fileContentType;
	
	private int courseId;
	private int homeworkId;
	
	@Action(value = "uploadExample",
			results = {
			@Result( name = SUCCESS, location = "/jsp/teacher/toApprovalHomework.action", 
					type = "redirect", params = {"courseId", "${courseId}", "homeworkId", "${homeworkId}"})
	})
	public String uploadExample() throws Exception{
		setHomeworkId(Integer.parseInt(request.getParameter("homeworkId")));
		setCourseId(Integer.parseInt(request.getParameter("courseId")));
		
		// 上传样例
		if (getFile() != null) {
			saveUploadFile(courseId, homeworkId);	
		}
		
		return SUCCESS;
		
	}
	
	private void saveUploadFile(int courseId, int homeworkId) throws IOException {
		String dir = Common.buildDir(courseId, homeworkId);
		if (dir.equals("")) {
			return;
		}
		String fileName = "作业样例&点评" + Common.getExtensionName(getFileFileName());
		File fileToCreate = new File(dir, fileName);
        FileUtils.copyFile(getFile(), fileToCreate);
        
        nju.edu.homework.model.File fileEntity = new nju.edu.homework.model.File(fileName, dir);
        
        OnlineUserVO user = (OnlineUserVO)session.get("onlineUser");
        fileService.addPublishFile(fileEntity, homeworkId, user.getId());
	}

	public Homework getHomework() {
		return Homework;
	}

	public void setHomework(Homework homework) {
		Homework = homework;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
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
