<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid"%>
<rapid:override name="content">
    <form class="layui-form" method="post" action="/submit/article">
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" name="articleTitle" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide" name="articleContent" lay-verify="content" id="content"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">分类</label>
            <div class="layui-input-inline">
                <select name="firstCategory" lay-filter="firstCategoryId" >
                    <option value="">一级分类</option>
                    <c:forEach items="${categoryList}" var="cate">
                    <c:if test="${cate.categoryParentId==0}">
                        <option value="${cate.categoryId}" selected="">${cate.categoryName}</option>
                      </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="secondCategory" id="categorySecond">
                
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="radio" name="articleState" value="1" title="发布" checked="">
                <input type="radio" name="articleState" value="0" title="草稿">
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

            //创建一个编辑器
            var editIndex = layedit.build('content', {
                height: 350,
            }
            );

            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 3) {
                        return '标题至少得5个字符啊';
                    }
                }
                , pass: [/(.+){6,12}$/, '密码必须6到12位']
                , content: function (value) {
                    layedit.sync(editIndex);
                }
            });

            layedit.build('content', {
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

            // layui.use('code', function(){ //加载code模块
            //     layui.code();
            // });
            form.on('select(firstCategoryId)',function(data){
                var StringSecond
               var firstCategory= data.value;
               <c:forEach items="${categoryList}" var="c">
              if(${c.categoryParentId}==firstCategory){
                 StringSecond +="<option value='${c.categoryId}'>${c.categoryName}</option>";
              }
               </c:forEach>
               $("#categorySecond").html("<option value='' selected>二级分类</option>"+StringSecond);
               form.render('select');
            })


        });
    </script>
</rapid:override>
<%@ include file="../public/framework.jsp" %>