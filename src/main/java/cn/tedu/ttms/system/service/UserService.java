package cn.tedu.ttms.system.service;

import java.util.List;
import java.util.Map;

import cn.tedu.ttms.common.web.PageObject;
import cn.tedu.ttms.system.entity.User;

public interface UserService {

	Map<String, Object> findObjects(User user, PageObject pageObject);

	List<Map<String, Object>> findRoleList();

	void saveUser(User user,String roleIdList);

	Map<String, Object> findUserById(Integer userId);

	void updateUser(User user,String roleIdList);

	void changeState(Integer userId, Integer valid);

	List<String> findPermission(Integer userId);
	/**
	 * 查询用户可见的菜单
	 * @return
	 */
	List<Map<String, Object>> menuList();

}
