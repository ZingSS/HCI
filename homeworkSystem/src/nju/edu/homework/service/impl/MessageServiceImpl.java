package nju.edu.homework.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.edu.homework.dao.CourseDao;
import nju.edu.homework.dao.MessageDao;
import nju.edu.homework.dao.MessageUserDao;
import nju.edu.homework.dao.UserDao;
import nju.edu.homework.model.Course;
import nju.edu.homework.model.Message;
import nju.edu.homework.model.MessageUser;
import nju.edu.homework.model.User;
import nju.edu.homework.service.MessageService;
import nju.edu.homework.util.Common;
import nju.edu.homework.util.ResultMessage;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageDao messageDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private CourseDao courseDao;
	@Autowired
	private MessageUserDao messageUserDao;

	@Override
	public ResultMessage saveMessage(Message message) {
		messageDao.save(message);
		saveByType(message);
		return ResultMessage.SUCCESS;
	}
	
	@Override
	public ResultMessage saveMessage(Message message, int courseId) {
		Course course = courseDao.getCourseById(courseId);
		message.setCourse(course);
		message.setTitle(course.getName() + message.getTitle());
		messageDao.save(message);
		saveByType(message);
		return ResultMessage.SUCCESS;
	}
	

	@Override
	public List<Message> getMessageByUserId(int userId) {
		List<Message> messages = new ArrayList<Message>();
		List<MessageUser> mUsers = messageUserDao.getByUserId(userId);
		for(MessageUser mu : mUsers){
			messages.add(getById(mu.getMessageId()));
		}
		Collections.sort(messages);
		return messages;
	}
	
	@Override
	public List<Message> getUnreadMessageByUserId(int userId) {
		List<Message> messages = new ArrayList<Message>();
		List<MessageUser> mUsers = messageUserDao.getByUserId(userId);
		for(MessageUser mu : mUsers){
			if (mu.getReadTime() == null) {
				messages.add(getById(mu.getMessageId()));
			}
		}
		Collections.sort(messages);
		return messages;
	}
	
	private void saveByType(Message message){
		String type = message.getType();
		int courseId = message.getCourse().getId();
		Course course = courseDao.getCourseById(courseId);
		List<User> users = new ArrayList<User>();
		if (type.equals(Common.PUBLISH_HOMEWORK)) {
			users.addAll(course.getStudent());
		}
		else if(type.equals(Common.SUBMISSION_DDL) || type.equals(Common.RE_CORRECT) || type.equals(Common.TO_CORRECT_HOMEWORK)){
			users.addAll(course.getAssistant());
		}
		else if(type.equals(Common.PUBLISH_EXAMPLE) || type.equals(Common.PUBLISH_GRADE)){
			users.addAll(course.getStudent());
		}
		else if(type.equals(Common.CORRECTION_OVER)){		// 助教批改结束 要发给教师
			users.addAll(course.getTeachers());
		}else if(type.equals(Common.NEW_ANNOUNCEMENT)){
			users.addAll(course.getStudent());
			users.addAll(course.getAssistant());
		}else if(type.equals(Common.AS_ANNOUNCEMENT)){
			users.addAll(course.getStudent());
			users.addAll(course.getTeachers());
		}
		
		for(User user: users){
			messageUserDao.save(new MessageUser(message.getId(), user.getId()));
		}
	}

	@Override
	public Message getById(int id) {
		return messageDao.getById(id);
	}


}
