package cn.edu.swun.bnb.libs.service.impl;

import java.util.List;

import cn.edu.swun.bnb.libs.dao.InsDAO;
import cn.edu.swun.bnb.libs.pojo.Ins;
import cn.edu.swun.bnb.libs.service.InsService;

public class InsServiceImpl implements InsService{
	private InsDAO insDao;
	public void setInsDao(InsDAO insDao) {
		this.insDao = insDao;
	}
	public List<Ins> listAllIns(){
		return insDao.listins();	
	}
}
