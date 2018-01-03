package cn.tedu.ttms.system.dao;

import org.apache.ibatis.annotations.Param;

import cn.tedu.ttms.common.dao.BaseDao;
import cn.tedu.ttms.system.entity.UserRole;

public interface UserRoleDao extends BaseDao<UserRole> {

	/**
	 * 判断用户角色表中是否存在用户占用此角色
	 * @param roleId
	 */
	int isExist(@Param("roleId")Integer roleId);

}
