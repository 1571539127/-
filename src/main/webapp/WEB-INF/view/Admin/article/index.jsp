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
    .tdWidth {

/* width: 220px !important; */

text-align:center;

display: block;

overflow: hidden;

white-space: nowrap;

text-overflow: ellipsis;

/* margin:0 auto; */

}
</style>
</rapid:override>

<rapid:override name="content">

<table class="layui-hide" id="test" lay-filter="test"></table>
<%@ include file="../article/detail.jsp" %>
<!-- //这里是弹出层的表单信息 -->
<!-- //表单的id用于表单的选择，style是在本页隐藏，只有点击编辑才会弹出 -->
</rapid:override>

<rapid:override name="footer-script">
<script type="text/html" id="barOption">
    <a class="layui-btn layui-btn-mini" lay-event="detail">查看</a>
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

$("#detailBtn").click(function(){
// 	 layer.closeAll();//关闭所有的弹出层
		window.document.location.href="/article/index";
})
$("#ariticleCancel").click(function(){
		window.document.location.href="/article/index";
})
layui.use('table', function(){
	  var table = layui.table
	    ,form = layui.form
	   , layer = layui.layer
       , layedit = layui.layedit
       , laydate = layui.laydate;
	  table.render({
	    elem: '#test'
	    ,url:'/article/search'
// 	    ,toolbar: true
	    ,title: '文章数据表'
	    ,totalRow: true
	    ,cols: [[
	    	{field:'articleId', title:'ID', width:80,sort: true}
		      ,{field:'articleAuthorName', title:'作者', width:120}
		      ,{field:'articleTitle', title:'标题', width:150}
		      ,{field:'articleContent', title:'内容', width:150
		    	  ,templet:'<div><span class="tdWidth" >{{d.articleContent}}</span></div>'}
		      
		      ,{field:'articleCreatetime', title:'创建时间', width:300, 
		    	  templet :function (row){
		                return DateFormat(row.articleCreatetime);
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
                  title: "查看文章信息",
                  area: ['620px', '530px'],
                  closeBtn:0,
                  content: $("#detailTest")//引用的弹出层的页面层的方式加载修改界面表单
                  ,success: function(layero, index) {
                	  $("#articleId").val(data.articleId);
                      $("#articleTitle").val(data.articleTitle);
                      $("#articleContent").val(data.articleContent);
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
            	  debugger;	
                  layer.open({
                      //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                      type: 1,
                      title: "修改文章信息",
                      zIndex:100,
//                       closable: false,
//                       closeByBackdrop: false,
						closeBtn:0,
                      area: ['620px', '530px'],
                      content: $("#detailTest")//引用的弹出层的页面层的方式加载修改界面表单
                      ,success: function(layero, index) {
                    	  $("#articleId").val(data.articleId);
                          $("#articleTitle").val(data.articleTitle);
                          $("#articleContent").val(data.articleContent);
//                           $("#content").val(data.articleContent);
                      }
                  
                  });
                  //动态向表传递赋值可以参看文章进行修改界面的更新前数据的显示，当然也是异步请求的要数据的修改数据的获取
//                   setFormValue(obj,data);
              }
          }
      });
	
      //创建一个编辑器
      var editIndex = layedit.build('articleContent', {
          height: 350,
      }
      );
      layedit.build('articleContent', {
          tool: [
              'strong' //加粗
              , 'italic' //斜体
              , 'underline' //下划线
              , 'del' //删除线
              , '|' //分割线
              , 'left' //左对齐
              , 'center' //居中对齐
              , 'right' //右对齐
              , 'link' //超链接
              , 'unlink' //清除链接
              , 'face' //表情
              , 'image' //插入图片
              , 'code'
          ]
      });
	  
});

    //自定义验证规则
 
$(".update_image_file").change(function(){
var fileabsolutePath = $(".update_image_file").val();
var filepathArr = fileabsolutePath.split("\\");
//获取文件对象
var file = this.files[0];
// 确认选择的文件是图片
var reader = new FileReader();
//使用fileReader对文件对象进行操作
reader.readAsDataURL(file);
reader.onload = function(e) {
 // 图片base64化    reader.result的结果是base64编码数据
 var newUrl = this.result;
 $("#userImage").attr("src",newUrl);
};
});

</script>
</rapid:override>
<%@ include file="../public/framework.jsp" %>
