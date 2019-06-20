package cn.edu.swun.bnb.libs.service.impl;

import java.util.List;

import cn.edu.swun.bnb.libs.dao.MajorDAO;
import cn.edu.swun.bnb.libs.pojo.Major;
import cn.edu.swun.bnb.libs.service.MajorService;

public class MajorServiceImpl implements MajorService {
	private MajorDAO majorDao;
	public void setMajorDao(MajorDAO majorDao) {
		this.majorDao = majorDao;
	}
	public List<Major> listAllMajor(){
		return majorDao.listmajor();
	}
    public List<Major> findmajors(Integer insId){
    	return majorDao.findmajors(insId);
    }
}
