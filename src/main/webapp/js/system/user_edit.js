var SUCCESS = 1;
//设置按钮的文字,以及编辑框的标题
setBtnVal();
//点击返回按钮
$('#btn_return').click(gobackUserList);
//点击保存/修改按钮
$('#btn_ok').click(commitUserForm);

//点击保存/修改按钮
function commitUserForm(){
	if($('#editUserForm').valid()){   //用valid（），校验的文本框必须有name属性值
		var params = getFormParams();
		if(params=='nochoose'){
			alert('请选择用户角色！');
			return false;
		}
		var userId = $('#container').data('userId');
		var userPwd = userId?$('#newPwd').val():$('#userPwd').val();
		params.password = userPwd;
		params.id = userId;
		var url = userId?'user/updateUser.do':'user/saveUser.do';
		$.post(url,params,function(result){
			if(result.state==SUCCESS){
				alert('操作成功！');
				clearData();
				$('#container').load('user/listUI.do');
			}else{
				alert(result.message);
			}
		})
	}
}

//获取表单参数
function getFormParams(){
	var userName = $('#userName').val();
	var email = $('#email').val();
	var mobile = $('#mobile').val();
	var roleIdList = new Array();
	$('input[name="checkedItem"]').each(function(){
		if($(this).is(':checked')){
			roleIdList.push($(this).val());
		}
	})
	if(roleIdList.length==0){
		return 'nochoose';
	}
	roleIdList = roleIdList.toString();
	var params = {
		'username':userName,
		'email':email,
		'mobile':mobile,
		'roleIdList':roleIdList
	}
	return params;
}

//点击返回按钮
function gobackUserList(){
	clearData();
	$('#container').load('user/listUI.do');
}

//查询所有角色  -- 如果使修改，有roleIdList
function loadRoleList(roleIdList){
	var url ='user/findRoleList.do';
	$.getJSON(url,function(result){
		if(result.state==SUCCESS){
			fillRoleList(result.data);
			if(roleIdList){
				for(var i in roleIdList){
					$('#roleList input[name="checkedItem"]').each(function(){
						if($(this).val()==roleIdList[i]){
							$(this).prop('checked',true);
						}
					})
				}
			}
		}else{
			alert(result.message);
		}
	})
}

//加载填充角色列表
function fillRoleList(roleList){
	var parentEle = $('#roleList');
	for(var i in roleList){
		var temp = '<input type="checkbox" name="checkedItem" value="[id]"/><span style="padding-right:30px;">[name]</span>';
		temp = temp.replace('[id]',roleList[i].id).replace('[name]',roleList[i].name);
		parentEle.append(temp);
	}
}

//设置按钮文字
function setBtnVal(){
	var userId = $('#container').data('userId');
	if(userId){
		$('#btn_ok').val('修改');
		$('#editTitle').text('修改');
		findUserById(userId);   //根据id查询用户信息
	}else{
		$('#btn_ok').val('保存');
		$('#editTitle').text('新增');
		//加载所有角色
		loadRoleList();
	}
}

function findUserById(userId){
	var param  = {'userId':userId};
	var url = 'user/findUserById.do';
	$.post(url,param,function(result){
		if(result.state==SUCCESS){
			loadEditUserForm(result.data);  //回显
		}else{
			alert(result.message);
		}
	})
}

//回显
function loadEditUserForm(user){
	$('#userName').val(user.username);
	$('#userPwd').val(user.password);
	$('#newPwdDiv').css('display','block');
	$('#email').val(user.email);
	$('#mobile').val(user.mobile);
	loadRoleList(user.roleIdList);
}

//点击返回，保存，修改按钮，清除editForm数据
function clearData(){
	$('#editUserForm .dynamicClear').val('');
	$('#newPwdDiv').css('display','none');
	$('#roleList').empty();
	$('#container').data('userId','');
}