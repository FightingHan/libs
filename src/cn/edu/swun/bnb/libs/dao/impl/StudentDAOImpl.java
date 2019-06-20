package cn.edu.swun.bnb.libs.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import cn.edu.swun.bnb.libs.dao.StudentDAO;
import cn.edu.swun.bnb.libs.mapper.StudentMapper;
import cn.edu.swun.bnb.libs.pojo.Student;

public class StudentDAOImpl implements StudentDAO {
    
	private JdbcTemplate jdbcTemplate;
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Student> list(String studName,String studId,Long studIns) {
		StringBuffer sql = new StringBuffer();
		sql.append("select sr.*,i.ins_name,m.major_name from school_roll sr left outer join institute i on sr.stud_ins = i.ins_id left outer join major m on sr.stud_major = m.major_id where 1=1");
		if(studName != null && !studName.trim().isEmpty())
			sql.append(" and stud_name like'%"+studName+"%'");
		if(studId != null && !studId.trim().isEmpty())
			sql.append(" and stud_id like'%"+studId+"%'");
		if(studIns != 0)
			sql.append(" and stud_ins ="+studIns);
		List<Student> studlist = jdbcTemplate.query(sql.toString(),new StudentMapper());
		return studlist;
	}
	public boolean del(String studId) {
		String sql = "delete from school_roll where stud_id = ?";
		if(jdbcTemplate.update(sql,Long.valueOf(studId)) == 0)
		    return false;
		else
			return true;
	}
	public List<Student> search(String studName,String studId,String studIns) {
		String sql = "select sr.*,i.ins_name,m.major_name from school_roll sr left outer join institute i on sr.stud_ins = i.ins_id left outer join major m on sr.stud_major = m.major_id where 1 =1";
		if(studName == null || studName.trim().isEmpty())
			studName = "%";
		if(studId == null || studId.trim().isEmpty())
			studId = "";
		if(studIns == null || studIns.trim().isEmpty())
			studIns = "%";
		List<Student> studlist = jdbcTemplate.query(sql,new StudentMapper(),studIns);
		return studlist;
	}
	public boolean add(Student stud) {
		Student stu = getstu(stud.getStudId());
		if(stu == null) {
		String sql = "insert into school_roll values(?,?,?,?)";
		if(jdbcTemplate.update(sql,stud.getStudId(),stud.getStudName(),stud.getInsId(),stud.getMajorId()) == 0)
			return false;
		else
			return true;
		}
		return false;
	}
	public Student getstu(String studId) {
		String sql = "select sr.*,i.ins_name,m.major_name from school_roll sr left outer join institute i on sr.stud_ins = i.ins_id left outer join major m on sr.stud_major = m.major_id where stud_id = ?";
		List<Student> studlist = jdbcTemplate.query(sql,new StudentMapper(),studId);
		if(studlist.isEmpty())
			return null;
		else
			return studlist.get(0);
	}
	public boolean update(Student stud) {
		String sql = "update school_roll set stud_name=?,stud_ins=?,stud_major=? where stud_id=?";
		if(jdbcTemplate.update(sql,stud.getStudName(),stud.getInsId(),stud.getMajorId(),stud.getStudId()) == 0)
			return false;
		else
		    return true;
	}

}
