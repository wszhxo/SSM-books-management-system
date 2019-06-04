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
 <link rel="stylesheet" href="<%=basePath%>css/layui.css">
  <link rel="stylesheet" href="<%=basePath%>css/modules/code.css">
   <link rel="stylesheet" href="<%=basePath%>css/modules/laydate/default/laydate.css">
   <link rel="stylesheet" href="<%=basePath%>css/modules/layer/default/layer.css">
<title>Insert title here</title>
<style type="text/css">
.layui-table-cell{
    height:36px;
    line-height: 36px;
}
</style>
</head>
<body>
	<div class="layui-header">
    <div class="layui-logo">ZHX图书借阅系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="<%=basePath%>frontIndex.action">图书列表</a></li>
        <li class="layui-nav-item"><a href="<%=basePath%>listDisBack.action">借阅记录</a></li>
        <li class="layui-nav-item"><a onclick="alterPwd();">修改密码</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
        ${admin2.name }
        </a>

      </li>
        <li class="layui-nav-item"><a href="<%=basePath%>loginout.action">退了</a></li>
    </ul>
  </div>

    <div style="padding: 15px;">
        <script>

            function alterPwd(){//添加
                layer.open({
                    type: 2,
                    title: '修改密码',
                    skin: 'layui-layer-demo', //加上边框
                    area: ['500px', '300px'], //宽高
                    content: '<%=basePath%>toAlterpwdPage.action'
                });
            }

        </script>
</body>
</html>