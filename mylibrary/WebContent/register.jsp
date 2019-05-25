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
<title>注册界面</title>
<link rel="stylesheet" href="<%=basePath%>css/layui.css">
 <link rel="stylesheet" href="<%=basePath%>css/style.css">
 <link rel="stylesheet" href="<%=basePath%>css/modules/layer/default/layer.css">
  <script src="<%=basePath%>js/laydate.js"></script> <!-- 要在layui 的前边不然时间插件失效 -->
  <script src="<%=basePath%>js/layui.js" ></script>
</head>
<body>
<div class="login-main">
    <header class="layui-elip" style="width: 82%">注册页</header>
    <!-- 表单选项 -->
    <form class="layui-form" action="<%=basePath%>library/submitAddReader.action" method="post">
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="user" name="reader_id" required  lay-verify="required" placeholder="请输入学号" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <div class="layui-inline">
                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
            <!-- 密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="pwd" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="pri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="pwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
            <!-- 确认密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="rpwd"  required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="rpri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="rpwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <div class="layui-input-block">
        	 <div class="layui-inline" style="width: 85%">
	      		<input type="radio" name="sex" value="男" title="男">
	      		<input type="radio" name="sex" value="女" title="女" checked>
	      	</div>
	    </div>
 		 <div class="layui-input-inline">
 		  <div class="layui-inline" style="width: 85%">
            <input type="text" name="telcode" required lay-verify="required" placeholder="电话" autocomplete="off"
                   class="layui-input">
          </div>
        </div>
        <div class="layui-input-inline">
          <div class="layui-inline" style="width: 85%">
            <input type="text" name="name" required lay-verify="required" placeholder="姓名" autocomplete="off"
                   class="layui-input">
            </div>
        </div>
         <div class="layui-input-inline">
          <div class="layui-inline" style="width: 85%">
            <input type="text" name="address" required lay-verify="required" placeholder="地址" autocomplete="off"
                   class="layui-input">
            </div>
        </div>
 		<div class="layui-input-inline">
 		 <div class="layui-inline" style="width: 85%">
      		<div class="layui-input-inline">
        	<input type="text" name="birth2" lay-verify="required" placeholder="出生日期" autocomplete="off" class="layui-input" id="test1">
      		</div>
      		</div>
        </div>
        <div class="layui-input-inline login-btn" style="width: 85%">
            <button type="submit" lay-submit lay-filter="sub" class="layui-btn">注册</button>
        </div>
        <hr style="width: 85%" />
        <p style="width: 85%"><a href="login.jsp" class="fl">已有账号？立即登录</a></p>
    </form>
</div>
 
 <script>
lay('#version').html('-v'+ laydate.v);

//执行一个laydate实例
laydate.render({
  elem: '#test1' //指定元素
});
</script>
<script type="text/javascript">
    layui.use(['form','jquery','layer'], function () {
        var form   = layui.form;
        var $      = layui.jquery;
        var layer  = layui.layer;
        
        layer.tips('学号就是借阅号哦!', '#user');
        //添加表单失焦事件
        //验证表单
        $('#user').blur(function() {
            var user = $(this).val();
 
            //alert(user);
            $.ajax({
                url:'<%=basePath%>library/checkUser.action',
                type:'post',
                dataType:'text',
                data:{reader_id:user},
                //验证用户名是否可用
                success:function(data){
                    if (data == "1") {
                        $('#ri').removeAttr('hidden');
                        $('#wr').attr('hidden','hidden');
                    } else {
                        $('#wr').removeAttr('hidden');
                        $('#ri').attr('hidden','hidden');
                        layer.msg('当前学号已被注册! ')
 
                    }
 
                }
            })
 
        });
 
        // you code ...
        // 为密码添加正则验证
        $('#pwd').blur(function() {
                var reg = /^[\w]{6,12}$/;
                if(!($('#pwd').val().match(reg))){
                    //layer.msg('请输入合法密码');
                    $('#pwr').removeAttr('hidden');
                    $('#pri').attr('hidden','hidden');
                    layer.msg('请输入合法密码');
                }else {
                    $('#pri').removeAttr('hidden');
                    $('#pwr').attr('hidden','hidden');
                }
        });
 
        //验证两次密码是否一致
        $('#rpwd').blur(function() {
                if($('#pwd').val() != $('#rpwd').val()){
                    $('#rpwr').removeAttr('hidden');
                    $('#rpri').attr('hidden','hidden');
                    layer.msg('两次输入密码不一致!');
                }else {
                    $('#rpri').removeAttr('hidden');
                    $('#rpwr').attr('hidden','hidden');
                };
        });
 
        //
        //添加表单监听事件,提交注册信息
        form.on('submit(sub)', function(data) {
            $.ajax({
                url:'<%=basePath%>library/submitAddReader.action',
                data:data.field,
                dataType:'text',
                type:'post',
                success:function(data){
                    if (data == '1') {
                        layer.msg('注册成功');
                        location.href = "login.jsp";
                    }else {
                        layer.msg('注册失败');
                    }
                }
            })
            //防止页面跳转
            return false;
        });
 
    });
</script>
</body>
</html>