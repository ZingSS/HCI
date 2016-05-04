package nju.edu.homework.dao;

import java.util.List;

import nju.edu.homework.model.User;
import nju.edu.homework.util.ResultMessage;

public interface UserDao {
	
	public ResultMessage save(User user);
	
	public ResultMessage merge(User user);
	
	public ResultMessage delete(User user);
	
	public ResultMessage delelte(int id);
	
	public List<User> find(String[] columns, Object[] values);
	
	public User getUserById(int id);
	
	public ResultMessage updateByUserId(User user);
	
	public List<User> getAllUsers();
	
	public List<User> fuzzySearch(String[] columns, String[] values);

}
