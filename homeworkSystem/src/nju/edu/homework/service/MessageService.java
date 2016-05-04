package nju.edu.homework.service;

import java.util.List;

import nju.edu.homework.model.Message;
import nju.edu.homework.util.ResultMessage;

public interface MessageService {

	public ResultMessage saveMessage(Message message);
	
	public ResultMessage saveMessage(Message message, int CourseId);

	public List<Message> getMessageByUserId(int userId);
	
	public Message getById(int id);

	public List<Message> getUnreadMessageByUserId(int userId);
}
