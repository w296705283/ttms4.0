package cn.tedu.ttms.system.dao;
import java.util.List;
import java.util.Map;

import cn.tedu.ttms.common.dao.BaseDao;
import cn.tedu.ttms.system.entity.Role;

public interface RoleDao extends BaseDao<Role> {

	List<Map<String, Object>> findRoleList();

	

}
