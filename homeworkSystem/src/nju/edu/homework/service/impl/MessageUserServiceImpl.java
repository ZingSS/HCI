package nju.edu.homework.service.impl;

import java.sql.Timestamp;
import java.util.List;

import nju.edu.homework.dao.MessageDao;
import nju.edu.homework.dao.MessageUserDao;
import nju.edu.homework.model.MessageUser;
import nju.edu.homework.service.MessageUserService;
import nju.edu.homework.util.ResultMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageUserServiceImpl implements MessageUserService{
	
	@Autowired
	private MessageUserDao messageUserDao;
	@Autowired
	private MessageDao messageDao;

	@Override
	public ResultMessage save(MessageUser messageUser) {
		return messageUserDao.save(messageUser);
	}

	@Override
	public ResultMessage setRead(MessageUser messageUser) {
		return messageUserDao.update(messageUser);
	}

	@Override
	public ResultMessage setRead(int messageId, int studentId) {
		MessageUser mu = getMessageUserById(messageId, studentId);
		mu.setReadTime(new Timestamp(System.currentTimeMillis()));
		return messageUserDao.update(mu);
	}
	
	private MessageUser getMessageUserById(int messageId, int studentId){
		return messageUserDao.getById(messageId, studentId);
	}

	@Override
	public List<MessageUser> getUserUnreadMessage(int userId) {
		return messageUserDao.getUnreadNum(userId);
	}

	@Override
	public int getUnreadNum(int userId) {
		List<MessageUser> mUsers = messageUserDao.getUnreadNum(userId);
		if (mUsers == null || mUsers.size() == 0) {
			return 0;
		}
		return mUsers.size();
	}

	@Override
	public ResultMessage setRead(int userId) {
		List<MessageUser> mUsers = messageUserDao.getUnreadNum(userId);
		if (mUsers == null || mUsers.size() == 0) {
			return ResultMessage.SUCCESS;
		}
		for (MessageUser mUser : mUsers) {
			mUser.setReadTime(new Timestamp(System.currentTimeMillis()));
			messageUserDao.update(mUser);
		}
		return ResultMessage.SUCCESS;
	}
	
	

}
