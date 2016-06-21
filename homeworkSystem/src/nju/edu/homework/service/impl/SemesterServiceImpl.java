package nju.edu.homework.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.edu.homework.dao.SemesterDao;
import nju.edu.homework.model.Course;
import nju.edu.homework.model.Semester;
import nju.edu.homework.service.SemesterService;
import nju.edu.homework.util.Common;
import nju.edu.homework.util.ResultMessage;

@Service
public class SemesterServiceImpl implements SemesterService{

	@Autowired
	private SemesterDao semesterDao;

	@Override
	public ResultMessage addNewSemester(Semester semester) {
		return semesterDao.save(semester);
	}

	@Override
	public ResultMessage updateSemester(Semester semester) {
		Semester updateSemester = getSemester(semester.getName());
		updateSemester.setStartTime(semester.getStartTime());
		updateSemester.setEndTime(semester.getEndTime());
		return semesterDao.update(updateSemester);
	}

	@Override
	public ResultMessage deleteSemester(Semester semeser) {
		return semesterDao.delete(semeser);
	}

	@Override
	public List<Semester> getAllSemesters() {
		return semesterDao.getAllSemesters();
	}

	@Override
	public List<Course> getCourseOfLastSemester() {
		return Common.sortCourse(new ArrayList<Course>(getLastSemester().getCourses()));
	}

	public Semester getLastSemester(){
		List<Semester> semesters = sortSemesters();
		if (semesters == null) {
			return null;
		}
		System.out.println(semesters.get(0).getName() + "   这是最新一个学期");
		return semesters.get(0);
	}

	@Override
	public List<String> getAllStringSemesters() {
		List<Semester> semesters = sortSemesters();
		if (semesters == null) {
			return null;
		}
		List<String> semesterStrings = new ArrayList<String>();
		for(Semester semester : semesters){
			semesterStrings.add(semester.getName());
		}
		return semesterStrings;
	}

	@Override
	public List<String> getValidSemesterName() {
		List<Semester> validSemesters = getValidSemester();
		if (validSemesters == null) {
			return null;
		}
		List<String> semesterStrings = new ArrayList<String>();
		for(Semester semester : validSemesters){
			semesterStrings.add(semester.getName());
		}
		return semesterStrings;
	}

	@Override
	public List<String> getActiveStringSemester() {
		List<Semester> semesters = sortSemesters();
		if (semesters == null) {
			return null;
		}
		List<String> semesterStrings = new ArrayList<String>();
		Date current = new Date(System.currentTimeMillis());
		for(Semester semester : semesters){
			if (current.before(semester.getEndTime())) {
				System.out.println(semester.getName() + "  这个学期可以被加课程");
				semesterStrings.add(semester.getName());
			}
		}
		if (semesterStrings.size() == 0) {
			semesterStrings = null;
		}
		return semesterStrings;
	}

	private List<Semester> sortSemesters(){
		List<Semester> semesters = getAllSemesters();
		if (semesters == null || semesters.size() == 0) {
			return null;
		}
		Collections.sort(semesters);
		return semesters;
	}

	@Override
	public List<Course> getCourseBySemester(String semester) {
		List<Semester> semesters = getAllSemesters();
		for(Semester s : semesters){
			if (semester.equals(s.getName())) {
				return Common.sortCourse( new ArrayList<Course>(s.getCourses()));
			}
		}
		return null;
	}

	@Override
	public int getSemesterByName(String semesterName) {
		List<Semester> semesters = getAllSemesters();
		for(Semester semester : semesters){
			if (semesterName.equals(semester.getName())) {
				return semester.getId();
			}
		}
		return 0;
	}

	@Override
	public Semester getSemester(String semesterName) {
		List<Semester> semesters = getAllSemesters();
		for(Semester semester : semesters){
			if (semesterName.equals(semester.getName())) {
				return semester;
			}
		}
		return null;
	}

	@Override
	public List<Semester> getValidSemester() {
		List<Semester> semesters = sortSemesters();
		List<Semester> validSemesters = new ArrayList<Semester>();
		Date currentDate = new Date(System.currentTimeMillis());
		for (Semester semester : semesters) {
			if (semester.getStartTime().before(currentDate)) {
				validSemesters.add(semester);
			}
		}
		return validSemesters;
	}



}
