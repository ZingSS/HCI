package nju.edu.homework.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import nju.edu.homework.model.Announcement;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.Message;
import nju.edu.homework.service.FileService;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.service.MessageService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.OnlineUserVO;

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
		OnlineUserVO vo=(OnlineUserVO)session.get("onlineUser");
		Timestamp d = new Timestamp(System.currentTimeMillis()); 
		String[] arr = d.toString().split("\\.");
		Announcement an = new Announcement();
		an.setCid(id);
		an.setContent(content);
		an.setTitle(title);
		an.setTname(vo.getName());
		an.setAtime(arr[0]);
		homeworkService.addAnnouncement(an);
		setMessage(an,id);
		return SUCCESS;
	}

	private void setMessage(Announcement an,int courseId) {
		Message message = new Message("有了新公告", "公告标题：" + an.getTitle(), Common.NEW_ANNOUNCEMENT);
		// 发给学生
		messageService.saveMessage(message, courseId);
		// 发给助教
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
