  <%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
   <div class="layui-row" id="detailTest" style="display:none;" >
    <form class="layui-form" method="post" action="/update/article">
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" name="articleTitle" id="articleTitle" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide" name="articleContent"  id="articleContent"></textarea>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
            <input type="hidden" id="articleId" name="articleId"/>
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">修改</button>
                  <input type="button" value="取消"  id="ariticleCancel" class="layui-btn layui-btn-primary"/>
            </div>
        </div>
    </form>
    </div>



