<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid"%>
<rapid:override name="content">
    <form id="user_form" class="layui-form" method="post" enctype="multipart/form-data" action="/submit/user" >
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="userName" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">用户密码</label>
        <div class="layui-input-block">
        <input type="password"  name="userPassword" required lay-verify="title" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">e-mail邮箱</label>
             <div class="layui-input-block">
                <input type="text" name="userEmail" lay-verify="title" autocomplete="off" placeholder="请输入邮箱" class="layui-input">
<!--                 <input type="text" name="userTry"/> -->
            </div>
        </div>
        
        <div class="layui-form-item">
        	<label class="layui-form-label">图片</label>
             <div><img id="img1"  src="/view/img/11.jpg"/></div>
            <input class=" hidden_photo_file_ipt" style="margin-left:100px;" type="file"  name="file"  />
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>


</rapid:override>
<rapid:override name="footer-script">

    <script>
  //上传图片以及预览 ps图片暂定为jepg格式
//     $(".upload_doc_of_file").click(function(){
//         $(".hidden_photo_file_ipt").click();
//     })
    $(".hidden_photo_file_ipt").change(function(){
        var fileabsolutePath = $(".hidden_photo_file_ipt").val();
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
            $("#img1").attr("src",newUrl);
//             $("#img1").val(newUrl);
          };
        });
  //ajax提交评论信息
//     $("#user_form").submit(function () {
//         $.ajax({
//             type: "POST",
//             url: '/submit/user',
//             contentType: "application/x-www-form-urlencoded",
//             //  新增content-type头部属性
//             data: $("#user_form").serialize(),
//             success: function (data) {
//             	debugger;
//                 if (data != 0) {
//                     //   location.reload();
//                     window.location.href = "/user/index";   
//                     return false;
//                 } else {
//                     layer.msg("创建失败");
//                 }

//             },
//             error: function () {
//             }
//         })
//         return false;
//     })
        layui.use(['form', 'layedit', 'laydate'], function () {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;
            //上传图片,必须放在 创建一个编辑器前面
            // layedit.set({
            //     uploadImage: {
            //          url: '/admin/upload/img' //接口url
            //         ,type: 'post' //默认post
            //     }
            // });
            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 1) {
                        return '标题至少得1个字符啊';
                    }
                }
                , pass: [/(.+){6,12}$/, '密码必须6到12位']
                , content: function (value) {
                    layedit.sync(editIndex);
                }
            });
        });
        
        
    </script>
</rapid:override>
<%@ include file="../public/framework.jsp" %>