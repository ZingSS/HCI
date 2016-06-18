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
public class AddAnnouncement extends BaseAction {

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
	private String title;
	private String content;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Action(
			value = "addAnnouncement",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/getAnnouncement.action", type = "redirect", params = {"courseId", "${courseId}"}),
			})
	public String addAnnouncement() throws Exception {
		int id = Integer.parseInt(request.getParameter("courseId"));
		setCourseId(id);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(title+content);
			return SUCCESS;
	
	}

	private void setMessage(int courseId) {
		Message message = new Message("布置了新作业", "作业标题：" + homework.getName(), Common.PUBLISH_HOMEWORK);
		// 发给学生
		messageService.saveMessage(message, courseId);
		// 发给助教
		Message assistantMessage = new Message("布置了新作业", "作业标题：" + homework.getName() + "。请注意按时批改",
				Common.TO_CORRECT_HOMEWORK);
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

		OnlineUserVO user = (OnlineUserVO) session.get("onlineUser");
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
