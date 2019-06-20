package cn.edu.swun.bnb.libs.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import cn.edu.swun.bnb.libs.dao.UserDAO;
import cn.edu.swun.bnb.libs.mapper.LoginUserMapper;
import cn.edu.swun.bnb.libs.pojo.LibUser;
import cn.edu.swun.bnb.libs.pojo.Student;

public class UserDAOImpl implements UserDAO {
    private Logger log = LoggerFactory.getLogger(UserDAOImpl.class);	
    private JdbcTemplate jdbctemplate;
    
    public void setDataSource(DataSource datasource) {
    	log.debug("jdbcTemplate");
    	jdbctemplate = new JdbcTemplate(datasource);
    }
    
	@Override
	public LibUser loadUser(String userId) {
		// TODO Auto-generated method stub
		LibUser user = null;
		String sql = "select * from users where user_id = ?";
		try {
		     user = jdbctemplate.queryForObject(sql, new LoginUserMapper(), userId);
	    }catch(EmptyResultDataAccessException e) {//处理空结果集的方法，利用try和catch捕捉异常
	    	log.debug("用户名不存在！");
	    }
		return user;
	}
	public List<LibUser> list(){
		String sql = "select * from users";
		List<LibUser> userlist = jdbctemplate.query(sql,new LoginUserMapper());
		return userlist;
	}
	public LibUser getUser(String userId) {
	    LibUser user = null;
		String sql = "select * from users where user_id = ?";
		List<LibUser> userlist = jdbctemplate.query(sql, new LoginUserMapper(), userId);
		if(userlist.isEmpty())
			return null;
		else
		    user = userlist.get(0);
		return user;
	}
	public boolean enabled(String userId) {
		String sql = null;
		LibUser user = getUser(userId);
		log.debug(userId);
		if(!user.isEnabled()) 
			sql = "update users set enabled=1 where user_id=?";
		else{
	    	sql = "update users set enabled=0 where user_id=?";
	    }
		log.debug(sql);
	    if(jdbctemplate.update(sql,userId)==1)
	    	return true;
	    return false;
	}
	//须判断数据库里是否注册过
	public boolean add(LibUser user) {
		LibUser syuser = getUser(user.getId());
		if(syuser == null) {	
		String sql = "insert into users values(?,?,?,?,?,?,?,?,?)";
		jdbctemplate.update(sql,user.getId(),user.getMale(),user.getPassword(),user.getEmail(),user.getNickname(),user.getRegisterTime(),user.isEnabled(),user.getUserType(),user.getHeadId());
		return true;
		}
		return false;
	}
}
