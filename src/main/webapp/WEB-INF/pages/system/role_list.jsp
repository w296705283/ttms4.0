<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<script src="${basePath}/js/common/page.js"></script>
<div class="container">
	   <!-- 页面导航 -->
	   <div class="page-header">
			<div class="page-title" style="padding-bottom: 5px">
				<h3>旅游管理系统</h3>
				<ol class="breadcrumb">
				  <li>系统管理</li>
				  <li>角色管理</li>
				  <li class="active">角色信息管理</li>
				</ol>
			</div>
		</div>
		<form method="post" id="formHead">
		    <!-- 查询表单 -->
			<div class="row page-search">
			 <div class="col-md-12">
				<ul class="list-unstyled list-inline">
					<li><input type="text" id="roleName" class="form-control" placeholder="角色名称"></li>
					<li class='O1'><button type="button" class="btn btn-primary btn-search" >查询</button></li>
					<li class='O2'><button type="button" class="btn btn-primary btn_add">新增</button></li>
					<li class='O3'><button type="button" class="btn btn-primary btn_update">修改</button></li>
					<li class='O4'><button type="button" class="btn btn-primary btn_delete">删除</button></li>
				</ul>
			  </div>
			</div>
			<!-- 列表显示内容 -->
			<div class="row col-md-12">
				<table class="table table-bordered" id="roleTable">
					<thead>
						<tr>
						    <th>选择</th>
							<th>角色ID</th>
							<th>角色名称</th>
							<th>备注</th>
						</tr>
					</thead>
					<tbody id="tbody"></tbody>
				</table>
				<%@include file="../common/page.jsp" %>
			</div>
		</form>
	</div>
	
	<script type="text/javascript" src="${basePath}/js/system/role_list.js"></script>