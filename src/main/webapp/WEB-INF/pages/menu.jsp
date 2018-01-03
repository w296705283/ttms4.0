<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<div class="navbar navbar-inverse" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> 
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><img src="${basePath }/images/logo.png"height="100%" /></a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav" id="menuList">
				<li class="active"><a class="icon-bar">旅游管理系统</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a>欢迎您,${currentUser.username }</a></li>
				<li><a href="logout.do">安全退出</a></li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript" src="${basePath }/js/common/menu.js"></script>
<script type="text/javascript">
$(function(){
	loadMenuList()
	$('#menuList').on('click','.menuBtn',loadContainer);
});
</script>
