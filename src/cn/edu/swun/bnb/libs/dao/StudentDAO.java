package cn.edu.swun.bnb.libs.dao;

import java.util.List;

import cn.edu.swun.bnb.libs.pojo.LibUser;
import cn.edu.swun.bnb.libs.pojo.Student;

public interface StudentDAO {
	public List<Student> list(String studName,String studId,Long studIns);
	public boolean add(Student stud);
	public boolean del(String studId);
	public Student getstu(String studId);
	public boolean update(Student stud);
	public List<Student> search(String studName,String studId,String studIns);
}
