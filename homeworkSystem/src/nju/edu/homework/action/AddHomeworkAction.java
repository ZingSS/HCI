package nju.edu.homework.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

import nju.edu.homework.model.Homework;
import nju.edu.homework.model.Message;
import nju.edu.homework.service.FileService;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.service.MessageService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.OnlineUserVO;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


@Controller
public class AddHomeworkAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private HomeworkService homeworkService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private FileService fileService;
	
	private int courseId;
	private Homework homework;
	
	private File file;
	private String fileFileName;
	private String fileContentType;
	
	@Action(
			value = "addHomework",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/showTeacherHomeworkList.action", type = "redirect", params = {"courseId", "${courseId}"}),
					@Result(name = Common.TIME_ERROR, location = "/jsp/teacher/toAddHomework.action", type="redirect", params = {"courseId", "${courseId}", "errorMessage", "请输入正确时间"}),
			})
	public String addHomework() throws Exception {
		int id = Integer.parseInt(request.getParameter("courseId"));
		setCourseId(id);
		String studentDDL = request.getParameter("sddl") + " 23:59:59";
		String assistantDDL = request.getParameter("addl") + " 23:59:59";
		Timestamp now = new Timestamp(System.currentTimeMillis());
		Timestamp sddl = Timestamp.valueOf(studentDDL);
		Timestamp addl = Timestamp.valueOf(assistantDDL);
		if (sddl.compareTo(now) > 0 && sddl.compareTo(addl) < 0) {
			homework.setStudentDDL(sddl);
			homework.setAssistantDDL(addl);
			int homeworkId = homeworkService.addHomework(homework, id);
			// 添加布置了作业的消息并发送给课程的助教和学生
			setMessage(id);
			// 存上传的附件
			if (getFile() != null) {
				saveUploadFile(id, homeworkId);	
			}
			return SUCCESS;
		}
		else{
			super.addFieldError("errorMessage", "请输入正确时间");
			return Common.TIME_ERROR;
		}
	}

	private void setMessage(int courseId) {
		Message message = new Message("布置了新作业", "作业标题："+homework.getName(), Common.PUBLISH_HOMEWORK);
		// 发给学生
		messageService.saveMessage(message, courseId);
		// 发给助教
		Message assistantMessage = new Message("布置了新作业", "作业标题："+homework.getName() + "。请注意按时批改", Common.TO_CORRECT_HOMEWORK);
		messageService.saveMessage(assistantMessage, courseId);
	}
	
	private void saveUploadFile(int courseId, int homeworkId) throws IOException {
		String dir = Common.buildDir(courseId, homeworkId);
		if (dir.equals("")) {
			return;
		}
		String fileName = "作业附件" + Common.getExtensionName(getFileFileName());
		File fileToCreate = new File(dir, fileName);
        FileUtils.copyFile(getFile(), fileToCreate);
        
        nju.edu.homework.model.File fileEntity = new nju.edu.homework.model.File(fileName, dir);
        
        OnlineUserVO user = (OnlineUserVO)session.get("onlineUser");
        fileService.addHomeworkFile(fileEntity, homeworkId, user.getId());
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public Homework getHomework() {
		return homework;
	}

	public void setHomework(Homework homework) {
		this.homework = homework;
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
}
