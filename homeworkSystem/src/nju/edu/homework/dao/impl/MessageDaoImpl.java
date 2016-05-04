package nju.edu.homework.dao.impl;


import nju.edu.homework.dao.BaseDao;
import nju.edu.homework.dao.MessageDao;
import nju.edu.homework.model.Message;
import nju.edu.homework.util.ResultMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MessageDaoImpl implements MessageDao{
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public ResultMessage save(Message message) {
		return baseDao.save(message);
	}

	@Override
	public Message getById(int id) {
		return baseDao.getById(Message.class, id);
	}

}
