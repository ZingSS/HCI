package nju.edu.homework.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.UserService;
import nju.edu.homework.vo.OnlineUserVO;

/**
 * 系统发送邮件 Action
 * @author cylong
 * @version 2016年6月20日 下午2:17:18
 */
public class MailAction extends BaseAction {

	/** serialVersionUID */
	private static final long serialVersionUID = -3792184110027740847L;

	@Autowired
	private CourseService courseService;
	@Autowired
	private UserService userService;
	
	private Course course;
	private String courseName;
	private int courseId;
	private List<Course> courseList;
	private String semester;
	/** 收件人，主要用到他的 userId 和 name */
	private User user;
	private String identity;
	private String sendState;

	public String getSendState() {
		return sendState;
	}

	public void setSendState(String sendState) {
		this.sendState = sendState;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	/**
	 * 展示发送邮件的界面
	 * @return
	 * @throws Exception
	 * @author cylong
	 * @version 2016年6月22日  上午1:35:40
	 */
	@SuppressWarnings("unchecked")
	@Action(
			value = "showMailView",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/showMailView.jsp"),
			})
	public String showMailView() throws Exception {
		int id = Integer.parseInt(request.getParameter("courseId"));
		setCourse(courseService.getCourseById(id));
		setCourseName(course.getName());
		setCourseId(id);
		String term = courseService.getCourseById(id).getSemester().getName();
		session.put("semester", term);
		setSemester(term);
		OnlineUserVO vo = (OnlineUserVO)session.get("onlineUser");
		List<Course> cList = courseService.getCourseByStudentId(vo.getId());
		courseList = new ArrayList<Course>();
		for(Course course : cList) {
			if (term.equals(course.getSemester().getName())) {
				courseList.add(course);
			}
		}
		setCourseList(courseList);
		// 以上代码是从 HomeworkAction 复制过来的
		// 以下代码是 cylong 写的有问题说一下
		
		// 收件人 ID
		String userId = request.getParameter("userId");
		user = userService.getuserByUserId(userId);
		String identity=request.getParameter("identity");
		setIdentity(identity);
		return SUCCESS;
	}
	
	/**
	 * 发送邮件
	 * @return
	 * @throws Exception
	 * @author cylong
	 * @version 2016年6月22日  上午1:35:53
	 */
	@SuppressWarnings("unchecked")
	@Action(
			value = "sendMail",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/successMail.jsp"),
			})
	public String sendMail() throws Exception {
		int id = Integer.parseInt(request.getParameter("courseId"));
		setCourse(courseService.getCourseById(id));
		setCourseName(course.getName());
		setCourseId(id);
		String term = courseService.getCourseById(id).getSemester().getName();
		session.put("semester", term);
		setSemester(term);
		OnlineUserVO vo = (OnlineUserVO)session.get("onlineUser");
		List<Course> cList = courseService.getCourseByTeacherId(vo.getId());
		courseList = new ArrayList<Course>();
		for(Course course : cList) {
			if (term.equals(course.getSemester().getName())) {
				courseList.add(course);
			}
		}
		setCourseList(courseList);
		String identity=request.getParameter("identity");
		setIdentity(identity);
		
		// 以上代码是从 HomeworkAction 复制过来的
		// 以下代码是 cylong 写的有问题说一下
		
		String address = request.getParameter("address");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String courseUrl = "课程链接请点击： http://localhost:8080/homeworkSystem/jsp/teacher/showTeacherHomeworkList.action?courseId=" + id + "&name=" + course.getName();
		content = content + "\n\n" + courseUrl;
		String from = "cylong1016@163.com";
		String password = "lsy940815";
		boolean isSuccess = sendMail(from, password, address, subject, content);
		if(isSuccess){
			setSendState("success");
		}else{
			setSendState("fail");
		}
		return SUCCESS;
	}

	/**
	 * @param from 发件人邮箱
	 * @param password 发件人密码【如果是网易邮箱这个是授权码
	 * @param address 收件人邮箱
	 * @param subject 邮件主题
	 * @param content 邮件内容
	 * @author cylong
	 * @version 2016年6月20日 下午7:23:39
	 */
	public boolean sendMail(String from, String password, String address, String subject, String content) {

		Properties props = new Properties();
		// 开启 debug 调试  
		props.setProperty("mail.debug", "true");
		// 邮件发送服务器需要身份验证  
		props.setProperty("mail.smtp.auth", "true");
		// 设置邮件发送服务器主机名  
		// 去你的邮件设置里可以看到 SMTP/POP3/IMAP 服务器地址。我这里用的是网易163邮箱
		props.setProperty("mail.host", "smtp.163.com");
		// 邮件发送协议 SMTP【邮件接收协议是 POP3/IMAP
		props.setProperty("mail.transport.protocol", "smtp");

		// 通过 Properties 生成 Session 服务，并验证发件人身份
		Session session = Session.getInstance(props, new Authenticator() {

			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		// 通过 Session 创建邮件对象，包括邮件标题、发件人、收件人、邮件内容等等
		Message msg = new MimeMessage(session);
		try {
			// 设置邮件主题
			msg.setSubject(subject);
			// 设置邮件内容  
			msg.setText(content);
			// 设置发件人 
			msg.setFrom(new InternetAddress(from));
			// 设置收件人
			msg.setRecipient(RecipientType.TO, new InternetAddress(address));
			Transport.send(msg);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}