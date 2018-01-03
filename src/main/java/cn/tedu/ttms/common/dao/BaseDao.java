package cn.tedu.ttms.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.tedu.ttms.common.web.PageObject;
import cn.tedu.ttms.system.entity.User;

/**类上定义的泛型用于约束类中方法的
 * 参数类型,方法的返回值类型或属性类型*/
public interface BaseDao<T> {
	int insertObject(T t);
//	int updateObject(T t);
	
	List<Map<String,Object>> findObjects(@Param(value="entity") T entity,@Param(value="pageObject") PageObject pageObject);

	Map<String,Object> findObjectById(Integer id);
	
	int validById(@Param(value="ids")String[] ids,@Param(value="valid")Integer valid);
	
	int save(@Param("entity")T t);
	
	int save(Map<String, Object> map);
	
	int updateObject(@Param("entity")T t);
	
	int getRowCounts(@Param(value="entity") T t);
	
	int deletObject(Integer id);
	
	List<Integer> findRelatedIdListById(Integer id);
	
	int changeState(@Param("id")Integer userId, @Param("valid")Integer valid);
	
	User findObjectByName(String username);
}
