package nju.edu.homework.dao.impl;

import java.util.List;

import nju.edu.homework.dao.BaseDao;
import nju.edu.homework.dao.MessageUserDao;
import nju.edu.homework.model.MessageUser;
import nju.edu.homework.util.ResultMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MessageUserDaoImpl implements MessageUserDao{
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public ResultMessage save(MessageUser messageUser) {
		return baseDao.save(messageUser);
	}

	@Override
	public ResultMessage update(MessageUser messageUser) {
		return baseDao.update(messageUser);
	}

	@Override
	public MessageUser getById(int messageId, int studentId) {
		String columns[] = {"messageId", "userId"};
		Object values[] ={messageId, studentId};
		List<MessageUser> list = baseDao.findByColunms(MessageUser.class, columns, values);
		if (list == null || list.size() == 0) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public List<MessageUser> getUnreadNum(int userId) {
		String columns[] = {"userId"};
		Object values[] ={userId};
		String nullColumn[] = {"readTime"};
		return baseDao.findByColunmsHasNull(MessageUser.class, columns, values, nullColumn);
	}

	@Override
	public List<MessageUser> getByUserId(int userId) {
		String columns[] = {"userId"};
		Object values[] ={userId};
		return baseDao.findByColunms(MessageUser.class, columns, values);
	}

}
