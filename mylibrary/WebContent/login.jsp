<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理系统登录</title>
<link rel="stylesheet" href="<%=basePath%>css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>css/style.css">
    <link rel="stylesheet" href="<%=basePath%>css/modules/layer/default/layer.css">
 	<script src="<%=basePath%>js/layui.js"></script>
</head>
<body>
 
<div class="login-main">
    <header class="layui-elip">图书管理系统登录</header>
    <form class="layui-form" action="<%=basePath%>library/list.action" method="post">
        <div class="layui-input-inline">
            <input type="text" name="adminId" required lay-verify="required" placeholder="用户名" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>
         <div class="layui-input-inline">
			   	<select name="access" id="access" lay-verify="required">
				  <option value="">请选择权限</option>
				  	<option value="0" >管理员</option>
				  	<option value="1" >读者</option>
				</select> 
    	</div>
        
        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="login" class="layui-btn">登录</button>
        </div>
        <hr/>
        <p><a href="register.jsp" class="fl">立即注册</a><a href="javascript:;" onclick="forgetpsw();" class="fr">忘记密码？</a></p>
    </form>
</div>
 
 

<script type="text/javascript">
    layui.use(['form','layer','jquery'], function () {
 
        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
       
        form.on('submit(login)',function (data) {
            $.ajax({
                url:'<%=basePath%>library/list.action',
                data:data.field,
                dataType:'text',
                type:'post',
                success:function (data) {
                    if (data == '0'){
                        location.href = "<%=basePath%>index.action";
                    }else if (data == '1') {
                    	 location.href = "<%=basePath%>frontIndex.action";
                    }else if (data == '2'){
                    	layer.msg('请选择正确的权限');
                    }else{
                        layer.msg('登录名或密码错误');
                    }
                }
            })
            return false;
        })
    });
	 	function forgetpsw(){
       	 layer.msg('联系管理员(15146731391)或到图书馆进行重置');
      	}
</script>
</body>
</html>