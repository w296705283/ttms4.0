var ztree,SUCCESS=1; 
var setting = {
	data : {
		simpleData : {
			enable : true,
			idKey : "id",  //节点数据中保存唯一标识的属性名称
			pIdKey : "parentId",  //节点数据中保存其父节点唯一标识的属性名称
			rootPId : null  //根节点id
		}
	}
}
//加载编辑页面内容
loadFormData();
//点击上级菜单
$('#editMenuForm').on('click','.text_parentMenu',showMenuLayer);
//取消选择菜单
$('#menuLayer').on('click','.btn_cancle',hideMenuLayer);
//选择菜单点击确定
$('#menuLayer').on('click','.btn_confirm',getOption);
//点击返回
$('#btn_return').click(gobackMenuList);
//点击确定按钮提交
$('#btn_save').click(commitMenuForm);

/**
 * 判断此时是添加还是编辑的关键字  menuId绑定在container上，
 * 上级菜单id绑定在编辑页的editMenuForm表单上
 */

//加载编辑页面内容
function loadFormData(){
	var menuId = $('#container').data('menuId');
	if(menuId){   //有值，说明是修改
		$('#btn_save').val('修改');
		$('#editTitle').text('修改');
		findMenuById(menuId);
	}else{   //无值，说明是添加
		$('#btn_save').val('保存');
		$('#editTitle').text('新增');
	}
}

function findMenuById(menuId){
	var url = 'menu/findMenuById.do';
	var param = {'menuId':menuId};
	$.post(url,param,function(result){
		if(result.state ==SUCCESS){
			loadEditMenuForm(result.data);
		}else{
			alert(result.message);
		}
	})
}

//回显
function loadEditMenuForm(menu){
	debugger
	$('#editMenuForm').data('parentId',menu.parentId);
	$('input[name="menuType"]').each(function(){
		if($(this).val()==menu.type){
			$(this).prop('checked',true);
		}
	})
	$('#menuName').val(menu.name);
	$('#parentName').val(menu.parentName);
	$('#menuUrl').val(menu.url);
	$('#menuPermission').val(menu.permission);
	$('#menuSort').val(menu.sort);
}

//提交表单
function commitMenuForm(){
	debugger
	if($('#editMenuForm').valid()){
		var params = getParams();
		var btnVal = $(this).val();
		var menuId = $('#container').data('menuId');
		var url = menuId?'menu/updateMenu.do':'menu/addMenu.do';
		params.id = menuId;
		$.post(url,params,function(result){
			if(result.state == SUCCESS){
				alert('操作成功！');
				clearEditMenuForm();
				$('#container').load('menu/listUI.do');
			}else{
				alert(result.message);
			}
		})
	}
}

//清空表单数据
function clearEditMenuForm(){
	$('#editMenuForm .dynamicClear').val('');
	$('#container').data('menuId','');
	$('#editMenuForm').data('parentId','');
	$('input[name="menuType"]:first').prop('checked',true);
}

//获取表单参数
function getParams(){
	var type = $('input[name="menuType"]:checked').val();
	var name = $('#menuName').val();
	var parentId = $('#editMenuForm').data('parentId');
	var url = $('#menuUrl').val();
	var permission = $('#menuPermission').val();
	var sort = $('#menuSort').val();
	
	var params = {
			'type':type,
			'name':name,
			'parentId':parentId,
			'url':url,
			'permission':permission,
			'sort':sort
	}
	return params;
}

//返回
function gobackMenuList(){
	clearEditMenuForm();
	var url = 'menu/listUI.do';
	$('#container').load(url);
}



//隐藏选择菜单
function hideMenuLayer(){
	$('#menuLayer').css('display','none');
}

//显示选择菜单
function showMenuLayer(){
	$('#menuLayer').css('display','block');
	loadTreeData();
}

//加载菜单树
function loadTreeData(){
	var url ='menu/treeUI.do';
	$.getJSON(url,function(result){
		if(result.state==SUCCESS){
			ztree = $.fn.zTree.init($("#menuTree"), setting,result.data);
		}else{
			alert(result.message);
		}
	})
}

//获取选择菜单选中项
function getOption(){
	 var node = ztree.getSelectedNodes();
	 var parentId = node[0].id;
	 $('#menuLayer').css('display','none');
	 $('#parentName').val(node[0].name);
	 $('#editMenuForm').data('parentId',node[0].id);
}

