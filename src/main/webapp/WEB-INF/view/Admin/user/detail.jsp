<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!--    <div class="layui-row" id="detailTest" style="display:none;" style="z-index:2;"> -->
   <div class="layui-row" id="detailTest" style="display:none;" >
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px" >
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
               <div class="layui-input-block">
                    <input type="text" name="neweqptIdCode" id="detailName" disabled="disabled"  required  lay-verify="required" autofocus="autofocus" placeholder="请输入采集设备地址" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input type="text" name="neweqptIdCode" id="detailEmail" disabled="disabled"  required  lay-verify="required" autocomplete="off" placeholder="请输入采集设备地址" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">图片</label>
              <div><img id="detailImg"  src=""/></div>
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit " lay-submit="" id="detailBtn">确认</button>
                </div>
            </div>
        </form>
    </div>