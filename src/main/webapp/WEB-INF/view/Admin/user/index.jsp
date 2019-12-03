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
<%@ include file="../user/detail.jsp" %>
<%@ include file="../user/update.jsp" %>
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
	 layer.closeAll();//关闭所有的弹出层
})
$("#cancel").click(function(){
	window.document.location.href="/user/index";
// 	 layer.closeAll();//关闭所有的弹出层
})
layui.use('table', function(){
	  var table = layui.table;
	  var $ = layui.$;
	   var form = layui.form;
       form.verify({
           title: function (value) {
               if (value.length < 1) {
                   return '标题至少得1个字符啊';
               }
           }
//        ,img: function (value) {
//                if (value.length < 1) {
//                    return '照片不能为空';
//                }
//            }
       
           , pass: [/(.+){3,12}$/, '密码必须3到12位']
           , content: function (value) {
               layedit.sync(editIndex);
           }
       });
	  table.render({
	    elem: '#test'
	    ,url:'/user/search'
// 	    ,toolbar: true
	    ,title: '用户数据表'
	    ,totalRow: true
	    ,cols: [[
	      {field:'userId', title:'ID', width:80,sort: true}
	      ,{field:'userName', title:'用户名', width:120}
	      ,{field:'userEmail', title:'邮箱', width:150}
	      ,{
              field: 'userImage',
              title: '图片',
              unresize: true,
              sort: false,
//               style:'height:100px;',
              templet:function (d) {
	    	  return '<div><img src="data:image/jpeg;base64,'+d.userImage+'"/></div>'}
          }
	      ,{field:'userRegisterTime', title:'创建时间', width:300, 
	    	  templet :function (row){
	                return DateFormat(row.userRegisterTime);
	      } 
	      }
	      ,{title:"操作", width: 278, align: 'center', toolbar: '#barOption'}
// 	      ,{field:'operatUsers', title: '操作', templet: function(d){
// 		  		var html = '';
// 		  		html += '<button class="layui-btn layui-btn-warm layui-btn-sm" onclick="updateBtn(' + d.userID + ')">修改</button>';
// 		  		html += '<button class="layui-btn layui-btn-danger layui-btn-sm" onclick="deleteBtn(' + d.userID + ')">删除</button>';
// 		        return html
// 		      }, fixed: 'right', width: 130
// 		  	}

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
                  area: ['380px', '460px'],
                  closeBtn:0,
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
                      area: ['420px', '540px'],
                      closeBtn:0,
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
// $("#updateEdit").click(function(){
// 	debugger;
// 	var cc=["ee","aa","aaaa"];
// 	var dd={"ee":11,"aa":22,"aaaa":33};
// 	var d=[];
// 	var a=$("#user_form_update").find("input[name='userName']");
// 	 d=$("#user_form_update").find("input[name='userName']");
// 	var a1=a.val();
// 	var b=$("input[name='userName']");
// 	var b1=b.val();
// 	var c=$("#userImage").attr("src");
// 	var userInf={userName:a1,userPassword:$("#userPassword").val(),userEmail:$("#userEmail").val(),userImage:$("#userImage").attr("src")};
// 	var str=JSON.stringify(userInf);
	
// 	$.ajax({
// 		type:"post",
// 		url:"/update/user",
// 		data:{"userInf":str},
// // 		dataType:"json",
// 		success:function(res){
// 			debugger;
// 		}
// 	})
// })
//监听弹出框表单提交，massage是修改界面的表单数据'submit(demo11),是修改按钮的绑定
// form.on('submit(demo11)', function(massage) {
// $("#user_form_update").submit(function () {
//  debugger;
//  $.ajax({
//        type: "POST",
//        url: '/update/user',
// //        mimeType:"multipart/form-data",
//        'Content-Type':'multipart/form-data',
//        data: $("#user_form_update").serialize(),
// //        data: "",
//        success: function (msg) {
//          if(msg.success){
//              layer.closeAll('loading');
//              layer.load(2);
//              layer.msg("修改成功", {icon: 6});
//              setTimeout(function(){
//            	  debugger;
//            	  console.log($("#userImage").attr("src"));
//                 obj.update({
//                	   userName:$("#userName").val(),
//                	   userEmail:$("#userEmail").val(),
//                       userImage:$("#userImage").attr("src")
                      
// //                 $("#userImage").attr("src","data:image/jpeg;base64,"+data.userImage);
//                   });//修改成功修改表格数据不进行跳转
//                   layer.closeAll();//关闭所有的弹出层
//              }, 1000);
// //              加载层-风格
//          }else{
//              layer.msg(msg.message, {icon: 5});
//          }
//      }
//  })
// })

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
