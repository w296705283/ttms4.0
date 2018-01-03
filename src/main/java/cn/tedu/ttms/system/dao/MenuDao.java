package cn.tedu.ttms.system.dao;

import java.util.List;
import java.util.Map;

import cn.tedu.ttms.common.dao.BaseDao;
import cn.tedu.ttms.system.entity.Menu;


public interface MenuDao extends BaseDao<Menu> {

	List<Map<String, Object>> findTreeData();

	int hasChild(Integer menuId);

}
