<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <title>ZHX图书管理系统</title>

  <style>
    .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
  </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	<jsp:include   page="readerheader.jsp" flush="true"/>  

	<!-- 搜索条件表单 -->
	<div class="demoTable layui-form">
	  	<div class="layui-inline">
	    	<input class="layui-input" name="bname" id="bname" autocomplete="off"  placeholder="请输入书名">
	    </div>
	    <div class="layui-inline">
	    	<input class="layui-input" name="author" id="author" autocomplete="off" placeholder="请输入作者">
	    </div>
	    <div class="layui-inline">
			<div class="layui-input-block">
			   	<select name="cname" id="cname">
				  <option value="">请选择书本类别</option>
				  <c:forEach items="${category}" var="ctg">
				  	<option value="${ctg.cname}">${ctg.cname}</option>
				  </c:forEach>
				</select> 
			</div>
	    </div> 
 		<button class="layui-btn" data-type="reload">搜索</button>
 		<a class="layui-btn layui-btn-normal" onclick="add();">添加图书</a>
  	</div>
</div>
 
	
	


<table class="layui-hide" id="demo" lay-filter="test"></table>
 
    <div class="layui-tab-item layui-show">
      <div id="pageDemo"></div>
    </div>
<script type="text/html" id="barDemo">
  <a  class="layui-btn layui-btn-danger layui-btn-sm lend" lay-event="lend">借阅</a>
</script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>

<script src="<%=basePath%>js/layui.js"></script>
<script>


layui.config({
  version: '1554901098009' //为了更新 js 缓存，可忽略
});


layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
  var laydate = layui.laydate //日期
  ,laypage = layui.laypage //分页
  ,layer = layui.layer //弹层
  ,table = layui.table //表格
  ,carousel = layui.carousel //轮播
  ,upload = layui.upload //上传
  ,element = layui.element //元素操作
  ,slider = layui.slider //滑块
  
  
  //执行一个 table 实例
  table.render({
    elem: '#demo'
    ,height: 550
    ,url: '<%=basePath%>library/listBook.action' //数据接口
    ,title: '图书表'
    ,page: true
    ,limit: 6
    ,limits: [5,10,15,20]
    ,cols: [[ //表头
      {type: 'checkbox', fixed: 'left'}
      ,{field: 'book_id', title: '书本编号', width:150, sort: true}
      ,{field: 'name', title: '书名', width:200}
      ,{field: 'author', title: '作者', width: 200, sort: true}
      ,{field: 'publish', title: '出版社', width:200, sort: true}
      ,{field: 'ISBN', title: 'ISBN', width: 150, sort: true}
      ,{field: 'pubdate', title: '出版日期', width: 120, sort: true}
      ,{field: 'stock', title: '库存', width: 100}
      ,{field: 'price', title: '价格', width: 100, sort: true}
     // ,{field: 'introduction', title: '简介', width:150} 
      ,{fixed: 'right', width: 200, align:'center', toolbar: '#barDemo'}
    ]]
      //用于搜索结果重载
      ,id: 'testReload'
  });
  var $ = layui.$, active = {
		   reload: function(){
		      var bname = $('#bname');
		      var author = $('#author');
		      var cname = $('#cname');
		      //执行重载
		      table.reload('testReload', {
		    	  //一定要加不然乱码
		    	method: 'post'
		        ,page: {
		          curr: 1 //重新从第 1 页开始
		        }
		        ,where: {
		        	//bname表示传到后台的参数,bname.val()表示具体数据
		        	  bname: bname.val(),
		        	  author: author.val(),
		        	  cname: cname.val(),
		        }
		      });
		    }
  };
  $('.demoTable .layui-btn').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
  
  
  //监听行工具事件
  table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
    var data = obj.data //获得当前行数据
    ,layEvent = obj.event; //获得 lay-event 对应的值
    if(layEvent === 'lend'){
      layer.confirm('确认借阅此书吗?', function(index){
    	  lend(obj,index,data);
      });
    }
  });
//后边两个参数仅仅是因为要执行动态删除dom
function lend(obj,index,data1){
	$.ajax({
        url:'<%=basePath%>library/lendBook.action?'
			  +'book_id='+data1.book_id
			  +'&name='+data1.name
			  +'&author='+data1.author
			  +'&publish='+data1.publish
			  +'&ISBN='+data1.ISBN
			  +'&introduction='+data1.introduction
			  +'&language='+data1.language
			  +'&price='+data1.price
			  +'&pubdate2='+data1.pubdate//这里赋值给String类型的时间字段
			  +'&class_id='+data1.category.cid
			  +'&stock='+data1.stock,
       	dataType: 'text',
        type:'post',
        success:function (data) {
            if (data == '1'){
            	 
            	//当前行数
             	var i =$("tr").index(obj.tr)-1;
            	//获取当前dom
            	var dom = $('.lend').eq(i);
            	if(dom.hasClass('layui-btn-danger')){
            		dom.removeClass('layui-btn-danger');
            		dom.addClass('layui-btn-normal');
            		dom.html('取消借阅');
            	}else{
            		dom.removeClass('layui-btn-normal');
            		dom.addClass('layui-btn-danger');
            		dom.html('借阅');
            	}
            	//更新库存
            	obj.update({
            		stock: data1.stock-1
            	    });
            	layer.close(index);
            	
            }else{
                layer.msg('库存不足');
            }
        }
    })
    
    
}
});



</script>
</body>
</html>        
        