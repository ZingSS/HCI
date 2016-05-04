package nju.edu.homework.action;

import java.util.List;

import nju.edu.homework.model.Message;
import nju.edu.homework.service.MessageService;
import nju.edu.homework.service.MessageUserService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.OnlineUserVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MessageAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private MessageService messageService;
	@Autowired
	private MessageUserService messageUserService;
	
	private List<Message> messageList;

	@Action(
			value = "showUnreadMessage",
			results = {
					@Result(name = Common.ROLE_STUDENT, location = "/jsp/student/message.jsp"),
					@Result(name = Common.ROLE_DIRECTOR, location = "/jsp/director/message.jsp"),
					@Result(name = Common.ROLE_TEACHER, location = "/jsp/teacher/message.jsp"),
					@Result(name = Common.ROLE_ADMIN, location = "/jsp/administor/message.jsp"),
			})
	
	public String showUnreadMessage() throws Exception {
		OnlineUserVO userVO = (OnlineUserVO)session.get("onlineUser");
		int userId = userVO.getId();
		setMessageList(messageService.getUnreadMessageByUserId(userId));
//		setMessageList(messageService.getMessageByUserId(userId));
		setMessageRead(userId);
		return userVO.getRole();
	}
	
	@Action(
			value = "showAllMessage",
			results = {
					@Result(name = Common.ROLE_STUDENT, location = "/jsp/student/message.jsp"),
					@Result(name = Common.ROLE_DIRECTOR, location = "/jsp/director/message.jsp"),
					@Result(name = Common.ROLE_TEACHER, location = "/jsp/teacher/message.jsp"),
					@Result(name = Common.ROLE_ADMIN, location = "/jsp/administor/message.jsp"),
			})
	
	public String showAllMessage() throws Exception {
		OnlineUserVO userVO = (OnlineUserVO)session.get("onlineUser");
		int userId = userVO.getId();
		setMessageList(messageService.getMessageByUserId(userId));
		return userVO.getRole();
	}
	
	public void setMessageRead(int userId){
		messageUserService.setRead(userId);
		session.put("unreadMessage", 0);
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}

}
