package nju.edu.homework.dao;


import nju.edu.homework.model.Message;
import nju.edu.homework.util.ResultMessage;

public interface MessageDao {

	public ResultMessage save(Message message);

	public Message getById(int id);
	
	
}
