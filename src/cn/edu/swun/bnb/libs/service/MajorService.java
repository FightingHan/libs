package cn.edu.swun.bnb.libs.service;

import java.util.List;

import cn.edu.swun.bnb.libs.pojo.Major;

public interface MajorService {
	public List<Major> listAllMajor();
    public List<Major> findmajors(Integer insId);
}
