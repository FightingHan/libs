package cn.edu.swun.bnb.libs.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import cn.edu.swun.bnb.libs.pojo.Student;

public class StudentMapper implements RowMapper<Student> {
	
	@Override
	public Student mapRow(ResultSet rs,int roeNum) throws SQLException {
        Student student = new Student();
        student.setStudId(rs.getString("stud_id"));
        student.setStudName(rs.getString("stud_name"));
        student.setInsId(rs.getLong("stud_ins"));
        student.setMajorId(rs.getLong("stud_major"));
        student.setInsName(rs.getString("ins_name"));
        student.setMajorName(rs.getString("major_name"));
        return student;
	}

}
