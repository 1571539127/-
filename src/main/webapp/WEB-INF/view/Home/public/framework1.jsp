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
  <title>后台 </title>
  <link rel="stylesheet" href="/view/layui/css/layui.css">
  <link rel="stylesheet" href="/view/css/back.css">
  <link rel="stylesheet" href="/view/css/highlight.css">
  <link rel="stylesheet" href="/view/css/style.css">
</head>

<body>
  <div>进入后台</div>
  <div>
    <span>首页</span>
  </div>
  <div>
    <main id="main" class="site-main" role="main">
      <article class="post type-post">
        <figure class="thumbnail">
          <a href="">
            <img width="280" height="210" src="/view/img/11.jpg" class="attachment-content size-content wp-post-image"
              alt="/view/img/11.jpg">
          </a>
          <span class="cat">
            <a href="">
              出入博客cat
            </a>
          </span>
        </figure>

        <header class="entry-header">
          <h2 class="entry-title">
            <a href="" rel="bookmark">
              出入博客title
            </a>
          </h2>
        </header>

        <div class="entry-content">
          <div class="archive-content">
            出入博客content
          </div>
          <span class="title-l"></span>
          <span class="new-icon">
            <c:choose>
              <c:when test="">
                <i class="fa fa-bookmark-o"></i>
              </c:when>
            </c:choose>
          </span>
          <span class="entry-meta">
            <span class="views">
              <i class="fa fa-eye"></i>
              views出入博客 views
            </span>
            <span class="comment">&nbsp;&nbsp;
              <a href="" rel="external nofollow">
                <i class="fa fa-comment-o"></i>
                <c:choose>
                  <c:when test="">
                    发表评论
                  </c:when>
                  <c:otherwise>
                    否则出入博客
                  </c:otherwise>
                </c:choose>

              </a>
            </span>
          </span>
          <div class="clear"></div>
        </div><!-- .entry-content -->

        <span class="entry-more">
          <a href="" rel="bookmark">
            阅读全文
          </a>
        </span>
      </article>
    </main>
  </div>
  <script src="/view/layui/layui.js"></script>
  <script src="/view/layui/layui.all.js"></script>
  <script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
</body>

</html>