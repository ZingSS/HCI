package nju.edu.homework.vo;

public class HomeworkStateNumVO {
	
	private int commitNum;
	private int overNum;
	private int passNum;
	
	public HomeworkStateNumVO(int commitNum, int overNum, int passNum) {
		this.commitNum = commitNum;
		this.overNum = overNum;
		this.passNum = passNum;
	}

	public int getCommitNum() {
		return commitNum;
	}

	public void setCommitNum(int commitNum) {
		this.commitNum = commitNum;
	}

	public int getOverNum() {
		return overNum;
	}

	public void setOverNum(int overNum) {
		this.overNum = overNum;
	}

	public int getPassNum() {
		return passNum;
	}

	public void setPassNum(int passNum) {
		this.passNum = passNum;
	}

}
