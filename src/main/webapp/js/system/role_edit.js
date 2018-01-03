/**
 * 点击修改，角色id绑定在container上
 */
var ztree,SUCCESS=1; 
var setting = {
	data : {
		simpleData : {
			enable : true,
			idKey : "id",  //节点数据中保存唯一标识的属性名称
			pIdKey : "parentId",  //节点数据中保存其父节点唯一标识的属性名称
			rootPId : null  //根节点id
		}
	},
	check:{
		enable:true,
		nocheckInherit:true
	}
}

$(function(){
	setBtnVal();
	//点击返回按钮
	$('#editRoleForm').on('click','.btn_return',gobackRoleList)
	//点击添加/修改按钮
	$('#editRoleForm').on('click','.btn_save',commitRoleForm)
})

function setBtnVal(){
	var roleId = $('#container').data('roleId');
	if(roleId){   //如果有值，进行的是修改操作
		$('#editRoleForm .btn_save').val('修改');
		$('#editTitle').text('修改');
		findRoleById(roleId);
	}else{   //进行的添加操作
		$('#editRoleForm .btn_save').val('添加');
		$('#editTitle').text('新增');
		loadTreeData();
	}
}

//根据id查询角色信息
function findRoleById(roleId){
	var param = {'roleId':roleId}
	var url = 'role/findRoleById.do';
	$.post(url,param,function(result){
		if(result.state == SUCCESS){
			loadEditRoleForm(result.data);
		}else{
			alert(result.message);
		}
	})
}

//回显
function loadEditRoleForm(role){
	$('#roleName').val(role.name);
	$('#note').val(role.note);
	loadTreeData(role.menuIdList);
}


//点击确定按钮提交表单信息
function commitRoleForm(){
	if($('#editRoleForm').valid()){
		var params = getParams();
		if(params=='nochoose'){
			alert('请选择授权！');
			return false;
		}
		var roleId = $('#container').data('roleId');
		var url = roleId?'role/updateRole.do':'role/save.do';
		params.id = roleId;
		$.post(url,params,function(result){
			if(result.state ==SUCCESS){
				alert('操作成功！');
				clearData();
				$('#container').load('role/listUI.do');
			}else{
				alert(result.message);
			}
		})
	}
}

//获取参数
function getParams(){
	var roleName = $('#roleName').val();
	var note = $('#note').val();
	//获取选择的授权
	var nodes = ztree.getCheckedNodes(true);
	if(nodes.length==0){
		return 'nochoose';
	}
	var menuIdList = new Array();
	for(var i=0; i<nodes.length; i++) {
		menuIdList.push(nodes[i].id);
	}
	menuIdList = menuIdList.toString();
	var params = {
			'name':roleName,
			'note':note,
			'menuIdList':menuIdList
	}
	return params;
}

//返回角色列表页
function gobackRoleList(){
	clearData();
	$('#container').load('role/listUI.do');
}

//清除数据
function clearData(){
	$('#roleName').val();
	$('#note').val();
	$('#container').data('roleId','');
}

//加载菜单树
function loadTreeData(menuIdList){
	debugger
	var url = 'role/loadMenuTree.do';
	$.getJSON(url,function(result){
		if(result.state==SUCCESS){
			ztree = $.fn.zTree.init($("#menuTree"), setting,result.data);
			if(menuIdList){
				//展开所有节点
				ztree.expandAll(true);
				//勾选角色所拥有的菜单
				var menuIds = menuIdList;
				for(var i=0; i<menuIds.length; i++) {
					var node = ztree.getNodeByParam("id", menuIds[i]);
					ztree.checkNode(node, true, false);
				}
			}
		}else{
			alert(result.message);
		}
	})
}