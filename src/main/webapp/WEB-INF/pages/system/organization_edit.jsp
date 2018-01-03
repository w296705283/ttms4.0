<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form  class="form-horizontal" role="form" id="editFormId">
	<div class="form-group">
		<label for="nameId" class="col-sm-2 control-label" >机构名称:</label> 
	    <div class="col-sm-10">
			<input type="text" class="form-control" name="name" id="nameId"  placeholder="请输入名字">
	    </div>
	</div>
	<div class="form-group">
		<label for="codeId" class="col-sm-2 control-label" >机构编码:</label> 
	    <div class="col-sm-10">
			<input type="text" class="form-control" name="code" id="codeId"  placeholder="请输入名字">
	    </div>
	</div>
	 <div class="form-group">
         <label class="col-md-2 control-label"> 有效: </label>
         <div class="col-md-10">
            <label class="radio-inline"><input  type="radio" name="valid" checked value="1" > 启用</label>
            <label class="radio-inline"><input  type="radio" name="valid" value="0"> 禁用</label>
          </div>
    </div>
	<div class="form-group">
		<label for="noteId" class="col-sm-2 control-label">备注:</label>
		<div class="col-sm-10">
		<textarea class="form-control" name="note" id="noteId"></textarea>
		</div> 
	</div>
</form>
<c:url var="url" value="/js/system/organization_edit.js"></c:url>
<script type="text/javascript" src="${url}"></script>