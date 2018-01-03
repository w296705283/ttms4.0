package cn.tedu.ttms.system.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tedu.ttms.common.web.JsonResult;
import cn.tedu.ttms.system.entity.Menu;
import cn.tedu.ttms.system.service.MenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Resource
	private MenuService menuService;
	
	@RequestMapping("listUI")
	@RequiresPermissions("sys:menu:view")
	public String listUI(){
		return "system/menu_list";
	}
	
	/**
	 * 查找所有菜单
	 * @param entity
	 * @return
	 */
	@RequestMapping("findObjects")
	@ResponseBody
	public JsonResult findObjects(){
		List<Map<String, Object>> list = menuService.findObjects();
		return new JsonResult(list);
	}
	
	/**
	 * 新增
	 */
	@RequestMapping("editUI")
	public String editUI(){
		return "system/menu_edit";
	}
	
	/**
	 * 加载选择菜单树结构
	 */
	@RequestMapping("treeUI")
	@ResponseBody
	public JsonResult treeUI(){
		List<Map<String, Object>> list = menuService.findTreeData();
		return new JsonResult(list);
	}
	
	/**
	 * 添加菜单
	 */
	@RequestMapping("addMenu")
	@ResponseBody
	public JsonResult save(Menu entity){
		menuService.save(entity);
		return new JsonResult();
	}
	
	/**
	 * 根据id查询菜单信息 
	 */
	@RequestMapping("findMenuById")
	@ResponseBody
	public JsonResult findMenuById(Integer menuId){
		Map<String, Object> map = menuService.findMenuById(menuId);
		return new JsonResult(map);
	}
	
	/**
	 * updateMenu
	 */
	@RequestMapping("updateMenu")
	@ResponseBody
	public JsonResult updateMenu(Menu entity){
		menuService.updateMenu(entity);
		return new JsonResult();
	}
	
	/**
	 * 判断要删除的菜单是否有子菜单
	 */
	@RequestMapping("deleteMenu")
	@ResponseBody
	public JsonResult deleteMenu(Integer menuId){
		menuService.deleteMenu(menuId);
		return new JsonResult();
	}

}
