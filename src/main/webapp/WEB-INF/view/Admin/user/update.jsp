<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="layui-row" id="popUpdateTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" id="user_form_update"  method="post" enctype="multipart/form-data" action="/update/user" style="margin-top:20px" >
<!--         <form class="layui-form layui-from-pane" id="user_form_update"  style="margin-top:20px" > -->
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                <input type="text" name="userName" id="userName" required  lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input">
                </div>
            </div>
                <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                <input type="text" name="userPassword" id="userPassword" required  lay-verify="pass" autocomplete="off" placeholder="请输入密码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input type="text" name="userEmail" id="userEmail" required  lay-verify="required" autocomplete="off" placeholder="请输入邮箱" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">图片</label>
              <div ><img id="userImage"  src="/view/img/11.jpg" /></div>
            <input class="update_image_file" style="margin-left:100px;" type="file"  name="file"  />
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                 <button id="updateEdit" class="layui-btn" lay-submit="" lay-filter="demo2">修改</button>
                    <input type="button" id="cancel" class="layui-btn layui-btn-primary" value="取消"/>
                    <input type="hidden" name="userId" id="userId"/>	
                </div>
            </div>
        </form>
    </div>
</div>