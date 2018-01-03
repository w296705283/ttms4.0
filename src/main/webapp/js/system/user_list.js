var SUCCESS = 1;
doGetObjects();

//查询
$('#userFormHead').on('click','.btn-search',criteriaDoGetObjects)
//新增
$('#userFormHead').on('click','.btn_add',showAddUserPage)
//修改
$('#userFormHead').on('click','.btn_update',showEditUserPage)
//启用/禁用
$('#tbody').on('click','.changeState',changeState)

//启用/禁用
function changeState(){
	var userId = $(this).parent().parent().data('userId');
	var valid = $(this).val();
	var params = {'userId':userId,'valid':valid};
	var url ='user/changeValid.do';
	$.post(url,params,function(result){
		if(result.state==SUCCESS){
			alert("操作成功！");
			criteriaDoGetObjects();
		}else{
			alert(result.message);
		}
	})
}

//跳转到修改页面
function showEditUserPage(){
	var selectedOption = getCheckedId();
	if(!selectedOption){
		alert('请选择要修改的选项！');
		return;
	}
	$('#container').data('userId',selectedOption);
	$('#container').load('user/editUserUI.do');
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

//条件查询  -- 每次条件查询要将当前也设为1
function criteriaDoGetObjects(){
	var curPage = 1;
	doGetObjects(curPage);
}


//跳转到新增页面
function showAddUserPage(){
	var url = 'user/editUserUI.do';
	$('#container').load(url);
}

function doGetObjects(curPage){
	var params = getParams();
	var currentPage = curPage?curPage:$("#pageId").data('pageCurrent');
	if(currentPage){
		params.pageCurrent=currentPage
	}
	var url = 'user/findObjects.do';
	$.post(url,params,function(result){
		if(result.state==SUCCESS){
			 setTableRows(result.data.list);
			 setPagination(result.data.pageObj);
		}else{
			alert(result.message);
		}
	})
}

//初始化列表页面
function setTableRows(list){
	var tBody=$('tbody');
	tBody.empty();
	var tds='<td><input type="radio" name="checkedItem" value="[id]"></td>'+
	        '<td>[username]</td>'+
	        '<td>[email]</td>'+
	        '<td>[mobile]</td>'+
	        '<td>[state]</td>'+
	        '<td><button type="button" class="btn btn-default btn-xs changeState" value="[validchange]">[stateStr]</button></td>';
	for(var i in list){
		var state = list[i].valid==0?'<span class="label label-danger">禁用</span>':'<span class="label label-success">启用</span>';
		var stateStr = list[i].valid==0?'启用':'禁用';
		var validchange = list[i].valid==0?'1':'0';
		var tr=$('<tr></tr>');
		tr.data('userId',list[i].id);
	    tr.append(tds.replace('[id]',list[i].id)
	    		  .replace('[username]',list[i].username)
	    		  .replace('[email]',list[i].email)
	    		  .replace('[mobile]',list[i].mobile)
	    		  .replace('[state]',state)
	    		  .replace('[validchange]',validchange)
	    		  .replace('[stateStr]',stateStr));
	    tBody.append(tr);
	}
}

//获取条件查询条件
function getParams(){
	var userName = $('#userName').val();
	var email = $('#email').val();
	var mobile = $('#mobile').val();
	var params = {
			'username':userName,
			'email':email,
			'mobile':mobile
		}
	return params;
}