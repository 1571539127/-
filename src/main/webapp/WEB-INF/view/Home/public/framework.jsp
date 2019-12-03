<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <!-- <link rel="shortcut icon" href="/img/logo.png"> -->
    <title>后台 </title>
    <link rel="stylesheet" href="/view/layui/css/layui.css">
    <link rel="stylesheet" href="/view/css/style.css">
</head>

<body>
    <ul class="layui-nav">
            <li class="layui-nav-item"><a href="/home/article">首页</a></li>
            <li class="layui-nav-item layui-this">
              <a href="javascript:;">分类</a>
              <dl class="layui-nav-child">
                <dd><a href="">计算机</a></dd>
                <dd><a href="">省份</a></dd>
                <dd><a href="">服装</a></dd>
              </dl>
            </li>
            <li class="layui-nav-item"><a href="">评论留言</a></li>
            <li class="layui-nav-item"><a href="/login">进入后台</a></li>
          </ul>
    <rapid:block name="left"></rapid:block>
    <rapid:block name="right">
    <div style="float:right;width:30%;background: #fff">

            
<aside id="php_text-22" class="widget php_text">
        <h3 class="widget-title">
            <i class="layui-icon">&#xe655;</i> 网站概况
        </h3>
        <div class="textwidget widget-text">
              <ul class="site-profile">
                <li><i class="layui-icon">&#xe655;</i>   文章总数：${countList.get(0)} 篇</li>
                <li><i class="layui-icon">&#xe655;</i>   留言数量：${countList.get(1)} 条</li>
                <li><i class="layui-icon">&#xe655;</i>    分类数量：${countList.get(2)} 个</li>
            </ul>
        </div>
        <div class="clear"></div>
    </aside>
    </div>
    </rapid:block>
  
    <script src="/view/layui/layui.js"></script>
    <script src="/view/layui/layui.all.js"></script>
<!--     <script src="https://code.jquery.com/jquery-3.0.0.min.js"></script> -->
    <script type="text/javascript" src="/view/jquery-3.0.0/jquery-3.0.0.min.js"></script>
    <script src="/view/js/script.js"></script>
</body>

</html>