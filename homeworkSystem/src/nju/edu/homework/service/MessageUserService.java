package nju.edu.homework.service;

import java.util.List;
import nju.edu.homework.model.MessageUser;
import nju.edu.homework.util.ResultMessage;

public interface MessageUserService {
	
	public ResultMessage save(MessageUser messageUser);

	public ResultMessage setRead(MessageUser messageUser);
	
	public ResultMessage setRead(int userId);
	
	public ResultMessage setRead(int messageId, int userId);

	public List<MessageUser> getUserUnreadMessage(int userId);
	
	public int getUnreadNum(int userId);
}
