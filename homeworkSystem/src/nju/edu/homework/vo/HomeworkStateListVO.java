package nju.edu.homework.vo;

import java.util.List;

import nju.edu.homework.model.Homework;

public class HomeworkStateListVO {
	
	private List<Homework> overHomeworks;
	private List<Homework> passHomeworks;
	
	public HomeworkStateListVO(List<Homework> overHomeworks, List<Homework> passHomeworks) {
		this.overHomeworks = overHomeworks;
		this.passHomeworks = passHomeworks;
	}
	
	public List<Homework> getOverHomeworks() {
		return overHomeworks;
	}
	public void setOverHomeworks(List<Homework> overHomeworks) {
		this.overHomeworks = overHomeworks;
	}
	public List<Homework> getPassHomeworks() {
		return passHomeworks;
	}
	public void setPassHomeworks(List<Homework> passHomeworks) {
		this.passHomeworks = passHomeworks;
	}
	
	

}
