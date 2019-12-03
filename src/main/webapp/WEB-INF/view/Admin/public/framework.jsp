<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="utf-8">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <!-- <link rel="shortcut icon" href="/img/logo.png"> -->
  <title>后台 <rapid:block name="title"></rapid:block>
  </title>
  <link rel="stylesheet" href="/view/layui/css/layui.css">
   <link rel="stylesheet" href="/view/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
   <link rel="stylesheet" href="/view/css/unit_tag_view.css" type="text/css">
   <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" >
   

  <rapid:block name="header-style"></rapid:block>
  <rapid:block name="header-script"></rapid:block>
</head>

<body class="layui-layout-body">
  <div class="layui-layout layui-layout-admin">
    <div class="layui-header">
      <div class="layui-logo">layui 后台布局</div>
      <!-- 头部区域（可配合layui已有的水平导航） -->
      <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="">控制台</a></li>
        <li class="layui-nav-item"><a href="">商品管理</a></li>
        <li class="layui-nav-item"><a href="">用户</a></li>
        <li class="layui-nav-item">
          <a href="javascript:;">其它系统</a>
          <dl class="layui-nav-child">
            <dd><a href="">邮件管理</a></dd>
            <dd><a href="">消息管理</a></dd>
            <dd><a href="">授权管理</a></dd>
          </dl>
        </li>
      </ul>
      <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
          <a href="javascript:;">
            <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
            贤心
          </a>
          <dl class="layui-nav-child">
            <dd><a href="">基本资料</a></dd>
            <dd><a href="">安全设置</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">退了</a></li>
      </ul>
    </div>

    <div class="layui-side layui-bg-black">
      <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
          <li class="layui-nav-item layui-nav-itemed">
            <a class="" href="javascript:;">文章</a>
            <dl class="layui-nav-child">
              <dd><a href="/article/index">全部文章</a></dd>
              <dd><a href="/insertArticle">添加文章</a></dd>
            </dl>
          </li>
            <li class="layui-nav-item">
            <a href="javascript:;">分类</a>
            <dl class="layui-nav-child">
              <dd><a href="/category/index">分类展示</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
            <a href="javascript:;">用户</a>
            <dl class="layui-nav-child">
              <dd><a href="/user/index">全部用户</a></dd>
              <dd><a href="/insert/user">添加用户</a></dd>
            </dl>
          </li>
          <!-- <li class="layui-nav-item"><a href="">云市场</a></li>
          <li class="layui-nav-item"><a href="">发布商品</a></li> -->
        </ul>
      </div>
    </div>

    <div class="layui-body">
      <!-- 内容主体区域 -->
      <div style="padding: 15px;">
        <rapid:block name="content"></rapid:block>
      </div>
    </div>

    <div class="layui-footer">
      <!-- 底部固定区域 -->
      © layui.com - 底部固定区域
    </div>
  </div>
  <script src="/view/layui/layui.js"></script>
  <script src="/view/layui/layui.all.js"></script>
<!--   <script src="https://code.jquery.com/jquery-3.0.0.min.js"></script> -->
<script type="text/javascript" src="/view/jquery-3.0.0/jquery-3.0.0.min.js"></script>
  <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/view/zTree_v3/js/jquery.ztree.core.js"></script>
  <script type="text/javascript" src="/view/bootstrap3-dialog-master/dist/js/bootstrap-dialog.js"></script>
<!--   <script type="text/javascript" src="/view/bootstrap3-dialog-master/dist/js/bootstrap-dialog.min.js"></script> -->
<!--   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script> -->
  
  <script>
    //JavaScript代码区域
    layui.use('element', function () {
      var element = layui.element;

    });
  </script>
  <rapid:block name="footer-script">

    </rapid:block>
</body>

</html>