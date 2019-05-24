<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>添加读者页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
  <link rel="stylesheet" href="<%=basePath%>css/layui.css"  media="all">
  <link rel="<%=basePath%>css/modules/laydate/default/laydate.css" >
  <link rel="stylesheet" href="<%=basePath%>css/style.css">
  <link rel="stylesheet" href="<%=basePath%>css/modules/layer/default/layer.css">
  <script src="<%=basePath%>js/laydate.js"></script> <!-- 要在layui 的前边不然时间插件失效 -->
  <script src="<%=basePath%>js/layui.js" ></script>
 <style>
  body{padding: 20px;}
  .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
  .demo-footer{padding: 50px 0; color: #999; font-size: 14px;}
  .demo-footer a{padding: 0 5px; color: #01AAED;}
  </style>
</head>
<body>
<form class="layui-form" action="<%=basePath%>library/submitAddReader.action" method="post" id="addbook" lay-filter="example">
 <div class="layui-form-item">
 
    <div class="layui-inline">
      <label class="layui-form-label">读者ID：</label>
      <div class="layui-input-inline">
      <!--  隐藏域-->
      <input type="text" name="reader_id"  value="${readerinfo.reader_id}" lay-verify="required" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">姓名：</label>
      <div class="layui-input-inline">
        <input type="text" name="name" lay-verify="required" value="${readerinfo.name}" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
   <div class="layui-form-item">
   <div class="layui-inline">
    <c:set  var="sex" value="${readerinfo.sex}" />
      <label class="layui-form-label">性别：</label>
			<div class="layui-input-block" >
			   	<select name="sex" id="sex" lay-verify="required">
				  <option value="">请选择性别</option>
				  	<option value="男" <c:if test="${readerinfo.sex=='男'}">selected</c:if>>男</option>
				  	<option value="女" <c:if test="${readerinfo.sex=='女'}">selected</c:if>>女</option>
				</select> 
			</div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">出生日期：</label>
      <div class="layui-input-inline">
        <input type="text" name="birth2" lay-verify="required" value="${readerinfo.birth2}" autocomplete="off" class="layui-input" id="test1">
      </div>
    </div>
  </div>
   <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">联系电话：</label>
      <div class="layui-input-inline">
        <input type="text" name="telcode" lay-verify="required" value="${readerinfo.telcode}" autocomplete="off" class="layui-input">
      </div>
    </div>
	 <div class="layui-inline">
      <label class="layui-form-label">读者等级：</label>
      <div class="layui-input-inline">
        <input type="text" name="card_state" lay-verify="required" value="${readerinfo.card_state}" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">地址：</label>
    <div class="layui-input-block">
      <textarea style="width:600px; height:150px" placeholder="请输入书本描述" name="address"  lay-verify="required"  class="layui-textarea">${readerinfo.address}</textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
    <c:if test="${readerinfo==null}"><!-- 查看是没有添加按钮的 -->
      <button class="layui-btn" lay-submit="" lay-filter="addreader">立即添加</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
     </c:if>
     <!-- 修改需要修改按钮是没有添加按钮的 -->
     <c:if test="${code==1}">
	     <button class="layui-btn" lay-submit="" lay-filter="updatereader">立即修改</button>
	     <button type="reset" class="layui-btn layui-btn-primary">重置</button>
     </c:if>
    </div>
  </div>
</form>

<script>
lay('#version').html('-v'+ laydate.v);

//执行一个laydate实例
laydate.render({
  elem: '#test1' //指定元素
});
</script>

<script type="text/javascript">
    layui.use(['form','layer','jquery'], function () {
        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
        //添加ajax表单提交
        form.on('submit(addreader)',function (data) {
            $.ajax({
                url:'<%=basePath%>library/submitAddReader.action',
               	data:data.field,
                dataType:'text',
                type:'post',
                success:function (data) {
                    if (data == '1'){
                    	 layer.msg("添加成功！");
                         layer.alert("添加成功！",function(){
                             window.parent.location.reload();//刷新父页面
                             parent.layer.close(index);//关闭弹出层
                         });
                    }else{
                        layer.msg('添加失败');
                    }
                }
            })
            return false;
        }),
 
        
      //修改ajax表单提交
        form.on('submit(updatereader)',function (data) {
            $.ajax({
                url:'<%=basePath%>library/updateReader.action',
               	data:data.field,
                dataType:'text',
                type:'post',
                success:function (data) {
                    if (data == '1'){
                         layer.alert("修改成功！",function(){
                             window.parent.location.reload();//刷新父页面
                             parent.layer.close(index);//关闭弹出层
                         });
                    }else{
                        layer.msg('修改失败');
                    }
                }
            })
            return false;
        })
 
        
    });
</script>


</body>
</html>