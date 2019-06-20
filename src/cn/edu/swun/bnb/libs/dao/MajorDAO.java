package cn.edu.swun.bnb.libs.dao;

import java.util.List;

import cn.edu.swun.bnb.libs.pojo.Major;

public interface MajorDAO {
	public List<Major> listmajor();
	public List<Major> findmajors(Integer insId);

}
