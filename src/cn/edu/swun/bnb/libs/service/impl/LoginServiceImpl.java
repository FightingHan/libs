package cn.edu.swun.bnb.libs.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.edu.swun.bnb.libs.dao.UserDAO;
import cn.edu.swun.bnb.libs.pojo.LibUser;
import cn.edu.swun.bnb.libs.service.LoginService;

public class LoginServiceImpl implements LoginService {
	
    private Logger log = LoggerFactory.getLogger(LoginServiceImpl.class);
	public UserDAO userDao;
	
    public void setUserDao(UserDAO userDao) {
    	log.debug("userDao");
    	this.userDao = userDao;
    }

	@Override
	public LibUser login(String studId, String password) {
	    LibUser user = userDao.loadUser(studId);
	    if(user==null)
	    	return null;
	    else {
	    	log.debug(user.getPassword());
	    	if(studId.equals(user.getId()) && password.equals(user.getPassword())) {
	    		log.debug("success");
		    	return user;	    		
	    	}
	    	else {
	    		log.debug("fail");
	    		return null;
	    	}
	    }
	}

}
