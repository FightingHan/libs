package cn.edu.swun.bnb.libs.service.impl;

import java.util.List;

import cn.edu.swun.bnb.libs.dao.StudentDAO;
import cn.edu.swun.bnb.libs.pojo.Student;
import cn.edu.swun.bnb.libs.service.StudentService;

public class StudentServiceImpl implements StudentService {
	
	private StudentDAO studentDao;
	
	public void setStudentDao(StudentDAO studentDao) {
		this.studentDao = studentDao;
	}
	public Student getstud(String studId) {
		return studentDao.getstu(studId);
	}
	public boolean update(Student stud) {
		return studentDao.update(stud);
	}
	public boolean add(Student stud) {
		return studentDao.add(stud);
	}
	@Override
	public List<Student> liststudent(String studName,String studNo,Long studIns) {
		return studentDao.list(studName,studNo,studIns);
	}
    public boolean del(String studId) {
    	return studentDao.del(studId);
    }
	public List<Student> search(String studName,String studId,String studIns) {
		return studentDao.search(studName, studId, studIns);
	}
}
