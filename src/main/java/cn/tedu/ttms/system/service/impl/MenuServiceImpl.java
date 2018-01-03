package cn.tedu.ttms.system.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.tedu.ttms.system.dao.MenuDao;
import cn.tedu.ttms.system.entity.Menu;
import cn.tedu.ttms.system.service.MenuService;

@Service("menuService")
@Transactional
public class MenuServiceImpl implements MenuService{
	@Resource
	private MenuDao menuDao;

	@Override
	public List<Map<String, Object>> findObjects() {
		List<Map<String,Object>> list=menuDao.findObjects(null,null);
//		System.err.println(SecurityUtils.getSubject().getPrincipal());
//		System.err.println(SecurityUtils.getSubject().getSession().getAttribute("currentUser").toString());
		 return list;
	}

	@Override
	public List<Map<String, Object>> findTreeData() {
		return menuDao.findTreeData();
	}

	@Override
	public void save(Menu entity) {
		if(entity==null){
			throw new NullPointerException("添加菜单对象不能为空！");
		}
		int i = menuDao.save(entity);
		if(i!=1){
			throw new RuntimeException("添加菜单失败！");
		}
	}

	@Override
	public Map<String, Object> findMenuById(Integer menuId) {
		if(menuId==null){
			throw new NullPointerException("菜单id能为空！");
		}
		Map<String, Object> map = menuDao.findObjectById(menuId);
		if(map==null || map.size()==0){
			throw new RuntimeException("修改菜单信息过程中获取菜单信息失败！");
		}
		return map;
	}

	@Override
	public void updateMenu(Menu entity) {
		if(entity==null){
			throw new NullPointerException("修改菜单信息，菜单对象不能为空！");
		}
		int i = menuDao.updateObject(entity);
		if(i!=1){
			throw new RuntimeException("更新菜单信息失败！");
		}
	}

	@Override
	public void deleteMenu(Integer menuId) {
		if(menuId==null){
			throw new NullPointerException("删除菜单，菜单id不能为空！");
		}
		int count = menuDao.hasChild(menuId);
		if(count!=0){
			throw new RuntimeException("请先删除子菜单或按钮！");
		}
		int i = menuDao.deletObject(menuId);
		if(i!=1){
			throw new RuntimeException("删除菜单失败！");
		}
	}
}
