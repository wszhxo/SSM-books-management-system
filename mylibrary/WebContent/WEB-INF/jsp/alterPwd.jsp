<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/6/4
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="<%=basePath%>css/layui.css">
    <link rel="stylesheet" href="<%=basePath%>css/style.css">
    <link rel="stylesheet" href="<%=basePath%>css/modules/layer/default/layer.css">
    <script src="<%=basePath%>js/layui.js" ></script>
</head>
<body>
<div class="login-main">
<!-- 表单选项 -->
    <div style="padding: 15px;">
<form class="layui-form" action="<%=basePath%>alterpwd.action" method="post">

    <div class="layui-input-inline">
        <div class="layui-inline" style="width: 85%">
            <input type="password" id="user" required  lay-verify="required" placeholder="原密码" autocomplete="off" class="layui-input">
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
            <input type="password" id="pwd" name="password" required  lay-verify="required" placeholder="新密码" autocomplete="off" class="layui-input">
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
            <input type="password" id="rpwd"  required  lay-verify="required" placeholder="重复新密码" autocomplete="off" class="layui-input">
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
    <div class="layui-input-inline login-btn" style="width: 85%">
        <button type="submit" lay-submit lay-filter="sub" class="layui-btn">点击修改</button>
    </div>
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

        //添加表单失焦事件
        //验证表单
        $('#user').blur(function() {
            var user = $(this).val();
            $.ajax({
                url:'<%=basePath%>checkPwd.action',
                type:'post',
                dataType:'text',
                data:{password:user},
                //验证用户名是否可用
                success:function(data){
                    if (data == "1") {
                        $('#ri').removeAttr('hidden');
                        $('#wr').attr('hidden','hidden');
                    } else {
                        $('#wr').removeAttr('hidden');
                        $('#ri').attr('hidden','hidden');
                        layer.msg('原密码错误!', {icon: 5});
                        form.render();
                    }

                }
            })

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
                url:'<%=basePath%>alterpwd.action',
                data:data.field,
                dataType:'text',
                type:'post',
                success:function(data){
                    if (data == '1') {
                        layer.alert("修改成功！",function(){
                            window.parent.location.href = "login.jsp";//刷新父页面
                            parent.layer.close(index);//关闭弹出层
                        });
                    }else {
                        layer.msg('修改失败');
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
