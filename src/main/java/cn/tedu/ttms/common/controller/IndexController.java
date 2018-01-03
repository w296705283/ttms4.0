package cn.tedu.ttms.common.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tedu.ttms.common.web.JsonResult;
import cn.tedu.ttms.system.service.UserService;

@Controller
public class IndexController {
	
	@Resource
	private UserService userService;
	
	/**首页控制器*/
	@RequestMapping("indexUI.do")
	public String indexUI(){
		return "index";
	}
	
	/**
	 * 获取用户可以加载的菜单列表
	 */
	@RequestMapping("menuList")
	@ResponseBody
	public JsonResult menuList(){
		List<Map<String, Object>> list = userService.menuList();
		return new JsonResult(list);
	}
}
