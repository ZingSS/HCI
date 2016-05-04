package nju.edu.homework.dao;

import java.util.List;

import nju.edu.homework.model.MessageUser;
import nju.edu.homework.util.ResultMessage;

public interface MessageUserDao {

	public ResultMessage save(MessageUser messageUser);
	
	public ResultMessage update(MessageUser messageUser);
	
	public MessageUser getById(int messageId, int studentId);

	public List<MessageUser> getUnreadNum(int userId);

	public List<MessageUser> getByUserId(int userId);
}
