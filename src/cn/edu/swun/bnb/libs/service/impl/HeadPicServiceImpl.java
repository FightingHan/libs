package cn.edu.swun.bnb.libs.service.impl;

import java.util.List;

import cn.edu.swun.bnb.libs.dao.HeadpicDAO;
import cn.edu.swun.bnb.libs.pojo.HeadPic;
import cn.edu.swun.bnb.libs.service.HeadPicService;

public class HeadPicServiceImpl implements HeadPicService {
	HeadpicDAO headpicDao;
	public void setheadpicDao(HeadpicDAO headpicDao) {
		this.headpicDao = headpicDao;
	}
	public List<HeadPic> list(){
		return headpicDao.list();
	}

}
