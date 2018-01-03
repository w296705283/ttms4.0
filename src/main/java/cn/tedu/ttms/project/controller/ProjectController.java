package cn.tedu.ttms.project.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tedu.ttms.common.web.JsonResult;
import cn.tedu.ttms.common.web.PageObject;
import cn.tedu.ttms.project.entity.Project;
import cn.tedu.ttms.project.service.ProjectService;
/**
 * 产品项目管理控制器对象
 */
@Controller
@RequestMapping("/project")
public class ProjectController {
	@Resource
	private ProjectService projectService;
	@RequestMapping("/listUI")
	@RequiresPermissions("product:project:view")
	public String listUI(){
		return "project/project_list";
	}
	@RequestMapping("/editUI")
	@RequiresPermissions("product:project:add")
	public String editUI(){
		return "project/project_edit";
	}
	@RequestMapping("/findPageObjects")
	@ResponseBody
	@RequiresPermissions("product:project:view")
	public JsonResult doFindPageObjects(Project project,PageObject pageObject){//pageCurrent
		Map<String,Object> map= projectService.
			findPageObjects(project,pageObject);
	    return new JsonResult(map);//state=1,message=ok,data=map
	}
	/**启用禁用*/
	@RequestMapping("/doValidById")
	@ResponseBody
	@RequiresPermissions("product:project:update")
	public JsonResult doValidById(String checkedIds,Integer valid){
		projectService.validById(checkedIds, valid);
		return new JsonResult();//state=1,message=ok;
	}
	/**保存项目信息*/
	@RequestMapping("/doSaveProject")
	@ResponseBody
	@RequiresPermissions("product:project:add")
	public JsonResult doSaveProject(Project project){
		projectService.saveObject(project);
		return new JsonResult();
	}
	/**查找项目信息*/
	@RequestMapping("/doFindById")
	@ResponseBody
	@RequiresPermissions("product:project:update")
	public JsonResult doFindProjectById(
			Integer id){
	    Map<String, Object> project=
	    projectService.findObjectById(id);
		return new JsonResult(project);
	}
	/**修改项目信息*/
	@RequestMapping("/doUpdateProject")
	@ResponseBody
	@RequiresPermissions("product:project:update")
	public JsonResult doUpdateProject(Project project){
		projectService.updateObject(project);
		return new JsonResult();//state=1,message="ok"
	}
}




