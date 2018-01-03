var SUCCESS = 1;

doGetObjects()

//条件查询
$('#formHead').on('click','.btn-search',criteriaDoGetObjects)
//新增
$('#formHead').on('click','.btn_add',showAddRolePage)
//修改
$('#formHead').on('click','.btn_update',showEditRolePage)
//删除
$('#formHead').on('click','.btn_delete',deleteRole)

//删除角色
function deleteRole(){
	var selectedOption = getCheckedId();
	if(!selectedOption){
		alert('请选择要删除的选项！');
		return;
	}
	var param = {'roleId':selectedOption};
	var url = 'role/deleteRole.do';
	$.post(url,param,function(result){
		if(result.state==SUCCESS){
			alert('删除成功！');
			criteriaDoGetObjects();
		}else{
			alert(result.message);
		}
	})
}

//显示修改角色页面
function showEditRolePage(){
	var selectedOption = getCheckedId();
	if(!selectedOption){
		alert('请选择要修改的选项！');
		return;
	}
	$('#container').data('roleId',selectedOption);
	$('#container').load('role/editRoleUI.do');
}

//显示新增页面
function showAddRolePage(){
	var url = 'role/editRoleUI.do';
	$('#container').load(url);
}

//条件查询  -- 每次条件查询要将当前也设为1
function criteriaDoGetObjects(){
	var curPage = 1;
	doGetObjects(curPage);
}

function doGetObjects(curPage){
	var params = getParams();
	var currentPage = curPage?curPage:$("#pageId").data('pageCurrent');
	if(currentPage){
		params.pageCurrent=currentPage
	}
	var url = 'role/findObjects.do';
	$.post(url,params,function(result){
		if(result.state==SUCCESS){
			 setTableRows(result.data.list);
			 setPagination(result.data.pageObj);
		}else{
			alert(result.message);
		}
	})
}

//获取条件查询条件
function getParams(){
	var roleName = $('#roleName').val();
	var params = {'name':roleName}
	return params;
}

//初始化列表页面
function setTableRows(list){
	var tBody=$('tbody');
	tBody.empty();
	var tds='<td><input type="radio" name="checkedItem" value="[id]"></td>'+
	        '<td>[roleId]</td>'+
	        '<td>[name]</td>'+
	        '<td>[note]</td>';
	for(var i in list){
	    var tr=$('<tr></tr>');
	    tr.append(tds.replace('[id]',list[i].id)
	    		  .replace('[roleId]',list[i].id)
	    		  .replace('[name]',list[i].name)
	    		  .replace('[note]',list[i].note));
	    
	    tBody.append(tr);
	}
}

//获得选中的id，然后拼接成字符串
function getCheckedId(){
	var checkedId;
	$('tbody input[name="checkedItem"]').each(function(){
		if($(this).is(':checked')){  //或者用prop('checked')
			checkedId=$(this).val();
		}
	})
	return checkedId;
}