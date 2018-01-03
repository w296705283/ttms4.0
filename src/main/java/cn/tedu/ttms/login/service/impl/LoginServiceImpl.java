package cn.tedu.ttms.login.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.tedu.ttms.login.service.LoginService;
import cn.tedu.ttms.system.dao.UserDao;
import cn.tedu.ttms.system.entity.User;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService {
	
	@Resource
	private UserDao userDao;
	

	@Override
	public User isExist(String username) {
		if(username==null){
			throw new NullPointerException("登录，用户名不能为空！");
		}
		int i = userDao.isExist(username);
		if(i!=1){
			throw new UnknownAccountException("该用户不存在！");
		}
		//根据用户名找到用户信息
		User user = userDao.findObjectByName(username);
		return user;
	}

	


}
