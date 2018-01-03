package cn.tedu.ttms.attachement.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.tedu.ttms.attachement.entity.Attachement;
import cn.tedu.ttms.attachement.service.AttachementService;
import cn.tedu.ttms.common.web.JsonResult;

@Controller
@RequestMapping("/attach")
public class AttachementController {
	@Resource
	private AttachementService attachementService;
	@RequestMapping("/uploadUI")
	public String uploadUI(){
		return "attachement/attachement";
	}
	@RequestMapping("/doSaveObject")
	@ResponseBody
	public JsonResult doSaveObject(
		String title,
		Integer athType,
		Integer belongId,
		MultipartFile mFile,
		HttpServletRequest request){//<input type="file" name="upFile">
		//http://localhost:8080/ttms2.0/....
		String serverPath=
		request.getServletContext()
		       .getRealPath("/");
		System.out.println("realPath="+serverPath);
		
		
		attachementService.saveObject(
				title,athType,belongId,
				mFile,serverPath);
		return new JsonResult();
	}
	
	@RequestMapping("/doFindObjects")
	@ResponseBody
	public JsonResult doFindObjects(){
		List<Attachement> list=
		attachementService.findObjects();
		return new JsonResult(list);
	}
	@RequestMapping("/doDownload")
	@ResponseBody
	public byte[] doDownload(Integer id,
		HttpServletResponse response)throws IOException{
		File file=
		attachementService.findObjectById(id);
		//设置响应消息头(下载时的固定写法)
		response.setContentType(
		"appliction/octet-stream");
		response.setHeader(
		"Content-disposition",
		"attachment;filename="+file.getName());
		//根据文件真实路径构建一个Path对象　
		Path path=Paths.get(file.getPath());
		//将文件的字节返回(spring mvc 会自动将这字节写入到文件)
        return Files.readAllBytes(path);
		//return file;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
