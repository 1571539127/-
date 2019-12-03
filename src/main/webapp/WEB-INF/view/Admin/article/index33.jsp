<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<rapid:override name="header-style">
<style type="text/css">
/* 图片自动撑开 */
    .layui-table-cell {
        height: auto !important;
        white-space: normal;
    }
</style>
</rapid:override>

<rapid:override name="content">
<table class="layui-hide" id="test" lay-filter="test"></table>
<!-- //这里是弹出层的表单信息 -->
<!-- //表单的id用于表单的选择，style是在本页隐藏，只有点击编辑才会弹出 -->
<%-- <%@ include file="../user/detail.jsp" %> --%>
</rapid:override>

<rapid:override name="footer-script">
<script type="text/html" id="barOption">
    <a class="layui-btn layui-btn-mini layui-btn-normal" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-mini layui-btn-danger" lay-event="del">删除</a>
</script>
<script>
function DateFormat(sjc){
    var date = new Date(sjc);
    var y = date.getFullYear();
    var m = date.getMonth()+1;
    m = m<10?'0'+m:m;
    var d = date.getDate();
    d = d<10?("0"+d):d;
    var h = date.getHours();
    h = h<10?("0"+h):h;
    var min = date.getMinutes();
    min = min<10?("0"+min):min;
    var s = date.getSeconds();
    s = s<10?("0"+s):s;
    var str = y+"-"+m+"-"+d+" "+h+":"+min+":"+s;
    return str;
}

layui.use('table', function(){
	  var table = layui.table;
	  var $ = layui.$;
	   var form = layui.form;
	   debugger;
	  table.render({
	    elem: '#testArticle'
	    ,url:'/article/search'
	    ,toolbar: true
	    ,title: '文章数据表'
	    ,totalRow: true
	    ,cols: [[
	      {field:'articleId', title:'ID', width:80,sort: true}
	      ,{field:'articleAuthorName', title:'作者', width:120}
	      ,{field:'articleTitle', title:'标题', width:150}
	      ,{field:'articleContent', title:'内容', width:150}
	      ,{field:'articleCreatetime', title:'创建时间', width:300, 
	    	  templet :function (row){
	                return DateFormat(row.userRegisterTime);
	      } 
	      }
	      ,{title:"操作", width: 278, align: 'center', toolbar: '#barOption'}

	    ]]
	    ,page: true
	    ,limit:5
	    ,limits:[5,10,15]
	    ,response: {
	      statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
	    }
	    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
	      return {
	        "code": res.code, //解析接口状态
	        "msg": res.msg, //解析提示文本
	        "count": res.count, //解析数据长度
	        "data": res.data //解析数据列表
	      };
	    }
	  });
	  
	//监听工具条
      table.on('tool(test)', function (obj) {
          var data = obj.data;
          if (obj.event === 'detail') {
//               layer.msg('ID：' + data.userId + ' 的查看操作');
              layer.open({
                  //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                  type: 1,
                  zIndex:100,
                  title: "查看用户信息",
                  area: ['380px', '330px'],
                  content: $("#detailTest")//引用的弹出层的页面层的方式加载修改界面表单
                  ,success: function(layero, index) {
                      $("#detailName").val(data.userName);
                      $("#detailEmail").val(data.userEmail);
                      $("#detailImg").attr("src","data:image/jpeg;base64,"+data.userImage);
                  }

              });
          } else if (obj.event === 'del') {
              layer.confirm('真的删除行么', function (index) {
                  $.ajax({
                      url: "/delete/user",
                      type: "POST",
                      zIndex:100,
                      data: {userId:data.userId},
                      dataType:"json",
                      success: function (msg) {
                    	  debugger;
                          if (msg.success) {
                              //删除这一行
                              obj.del();
                              //关闭弹框
                              layer.close(index);
                              layer.msg("删除成功", {icon: 6});
                          } else {
                              layer.msg("删除失败", {icon: 5});
                          }
                      }
                  });
                  return false;
              });
          } else if (obj.event === 'edit') {
              //formData = data;
              if (obj.event === 'del') {
                  layer.confirm('真的删除行么', function (index) {
                      obj.del();
                      layer.close(index);
                  });
              } else if (obj.event === 'edit') {
                  layer.open({
                      //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                      type: 1,
                      title: "修改用户信息",
                      zIndex:100,
                      area: ['420px', '330px'],
                      content: $("#popUpdateTest")//引用的弹出层的页面层的方式加载修改界面表单
                      ,success: function(layero, index) {
                    	  $("#userId").val(data.userId);
                          $("#userName").val(data.userName);
                          $("#userPassword").val(data.userPassword);
                          $("#userEmail").val(data.userEmail);
                          $("#userImage").attr("src","data:image/jpeg;base64,"+data.userImage);
                      }
                  });
                  //动态向表传递赋值可以参看文章进行修改界面的更新前数据的显示，当然也是异步请求的要数据的修改数据的获取
//                   setFormValue(obj,data);
              }
          }
      });
	

	  
});


</script>
</rapid:override>
<%@ include file="../public/framework.jsp" %>
