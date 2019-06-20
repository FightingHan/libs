package cn.edu.swun.bnb.libs.service;

import cn.edu.swun.bnb.libs.pojo.LibUser;

public interface LoginService {
	
	public LibUser login(String studId,String password);
}
