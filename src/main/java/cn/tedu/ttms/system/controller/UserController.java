package cn.tedu.ttms.system.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tedu.ttms.common.web.JsonResult;
import cn.tedu.ttms.common.web.PageObject;
import cn.tedu.ttms.system.entity.User;
import cn.tedu.ttms.system.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Resource
	private UserService userService;
	
	/**
	 * 用户列表页面
	 */
	@RequestMapping("listUI")
	@RequiresPermissions("sys:user:view")
	public String listUI(){
		return "system/user_list";
	}
	
	/**
	 * 查询用户列表
	 */
	@RequestMapping("findObjects")
	@ResponseBody
	public JsonResult findObjects(User user,PageObject pageObject){
		Map<String, Object> map = userService.findObjects(user,pageObject);
		return new JsonResult(map);
	}
	
	/**
	 * 跳转到用户编辑页面（新增/修改）
	 */
	@RequestMapping("editUserUI")
	public String editUser(){
		return "system/user_edit";
	}
	
	/**
	 * 查询所有角色列表
	 */
	@RequestMapping("findRoleList")
	@ResponseBody
	public JsonResult findRoleList(){
		List<Map<String, Object>> list = userService.findRoleList();
		return new JsonResult(list);
	}
	
	/**
	 * 保存用户
	 */
	@RequestMapping("saveUser")
	@ResponseBody
	public JsonResult saveUser(User user,String roleIdList){
		userService.saveUser(user,roleIdList);
		return new JsonResult();
	}
	
	/**
	 * 根据id查询用户信息，用于回显
	 */
	@RequestMapping("findUserById")
	@ResponseBody
	public JsonResult findUserById(Integer userId){
		Map<String, Object> map = userService.findUserById(userId);
		return new JsonResult(map);
	}
	
	/**
	 * 修改更新用户信息
	 */
	@RequestMapping("updateUser")
	@ResponseBody
	public JsonResult updateUser(User user,String roleIdList){
		userService.updateUser(user,roleIdList);
		return new JsonResult();
	}
	
	/**
	 * 启用/禁用
	 */
	@RequestMapping("changeValid")
	@ResponseBody
	public JsonResult changeValid(Integer userId,Integer valid){
		userService.changeState(userId,valid);
		return new JsonResult();
	}

}
