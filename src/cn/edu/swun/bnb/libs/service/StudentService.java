package cn.edu.swun.bnb.libs.service;

import java.util.List;
import cn.edu.swun.bnb.libs.pojo.Student;

public interface StudentService {
	
	public List<Student> liststudent(String studName,String studNo,Long studIns);
	public boolean del(String studId);
	public Student getstud(String studId);
	public boolean update(Student stud);
	public boolean add(Student stud);
	public List<Student> search(String studName,String studId,String studIns);
}
