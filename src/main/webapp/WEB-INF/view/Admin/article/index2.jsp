<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="content">
  <!-- <p>11</p> -->
  <!-- <span>333</span> -->
  <table class="layui-table">
    <thead>
      <tr>
        <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
        <th lay-data="{field:'username', width:80}">作者</th>
        <th lay-data="{field:'sex', width:80, sort: true}">标题</th>
        <th lay-data="{field:'city', width:80}">内容</th>
        <th lay-data="{field:'sign', width:160}">发布时间</th>
        <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${articleList}" var="article">
        <tr>
          <td>${article.articleId}</td>
          <td style="width:5%">${article.articleAuthorName}</td>
          <td style="width:7%">${article.articleTitle}</td>
          <td >${article.articleContent}</td>
<%--           <td><fmt:formatDate value="${article.articleCreatetime}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></td> --%>
          <td style="width:12%"><fmt:formatDate value="${article.articleCreatetime}" pattern="yyyy年MM月dd日" /></td>
<!--           <td><button value="查看"></button><button value="编辑"></button></td> -->
        </tr>
      </c:forEach>

    </tbody>
  </table>

</rapid:override>
   <rapid:override name="footer-script">
  <script type="text/html" id="barDemo">
                  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                </script>
                
<script>
                layui.use('table', function(){
              	  var table = layui.table;
              	  var $ = layui.$;
              	   var form = layui.form;
              	  
              	//监听工具条
                    table.on('tool(test)', function (obj) {
                        var data = obj.data;
                        if (obj.event === 'detail') {
//                             layer.msg('ID：' + data.userId + ' 的查看操作');
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
//                                 setFormValue(obj,data);
                            }
                        }
                    });
              	

              	  
              });
                </script>
                </rapid:override>
<%@ include file="../public/framework.jsp" %>