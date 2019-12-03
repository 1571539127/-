<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid"%>
<rapid:override name="left">
    <div style="float:left;width:70%">
        <main id="main" class="site-main" role="main">
            <article class="post" id="articleDetail" data-id="${article.articleId}">
                <header class="entry-header">
                    <h1 class="entry-title">
                        ${articleDetai.articleTitle}
                    </h1>
                </header>
                <div class="entry-content">
                    <div class="single-content">
                        ${articleDetai.articleContent}
                    </div>
                    <div class="clear"></div>
                </div>
            </article>
        </main>


        <div id="respond" class="comment-respond">
            
            <form id="comment_form" class="layui-form layui-form-pane" >
                <div class="layui-form-item layui-form-text">
                  <label id="reply-title-word" >发表评论</label> <label id="reply-title" style="float:right" class="comment-reply-title ">
                    <a rel="nofollow" id="cancel-comment-reply-link" href="" style="">取消回复</a>
    </label>
                    <div class="layui-input-block">
                        <textarea placeholder="评论内容" name="commentContent" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="commentAuthorName" lay-verify="required" placeholder="请输入昵称" autocomplete="off"
                            class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="" lay-filter="demo2">提交评论</button>
                    <input type="hidden" name="articleId" value="${articleDetai.articleId}" id="article_id">
                    <input type="hidden" name="commentPid" id="comment_pid" value="0">
                          <input type="hidden" name="commentPname" id="commentPname" value="">
                </div>
            </form>
        </div>

        <ol class="comment-list">
        <c:set var="now" value="<%=new java.util.Date()%>" />
            <c:set var="floor" value="0" />
            <c:forEach items="${commentList}" var="c">
                <c:if test="${c.commentPid == 0}">
                    <c:set var="floor" value="${floor + 1}" />
                    <li class="comment">
                        <div id="div-comment-${c.commentId}" class="comment-body">
                            <div class="comment-author vcard">
                                <img class="avatar" src="/view/img/10.jpg" alt="avatar" style="display: block;">
                                <strong>${c.commentAuthorName} </strong>
                                <span class="comment-meta commentmetadata">
                                    <span class="ua-info" style="display: inline;">
                                        <br>
                                        <span class="comment-aux">
                                            <span class="reply">
                                                <a rel="nofollow" class="comment-reply-link" href="#respond" >回复
                                                </a>
                                            </span>
                                            <fmt:formatDate value="${now}" pattern="yyyy年MM月dd日 HH:mm:ss" />&nbsp;
                                            <c:if test="${sessionScope.user != null}">
                                                <a href="javascript:void(0)" onclick="deleteComment(${c.commentId})">删除</a>
                                                <a class="comment-edit-link" href="/admin/comment/edit/${c.commentId}"
                                                    target="_blank">编辑</a>
                                            </c:if>
                                            <span class="floor"> &nbsp;${floor}楼 </span>
                                        </span>
                                    </span>
                                </span>
                                <p>
                                    <c:if test="${c.commentPid!=0}">
                                        <span class="at">@ ${c.commentPname}</span>
                                    </c:if>
                                    ${c.commentContent}
                                </p>
                            </div>
                        </div>
                        <ul class="children">
                            <c:set var="floor2" value="0" />
                            <c:forEach items="${commentList}" var="c2">
                                <c:if test="${c.commentId == c2.commentPid}">
                                    <c:set var="floor2" value="${floor2+1}" />
                                    <li class="comment">
                                        <div id="div-comment-${c.commentId}" class="comment-body">
                                            <div class="comment-author vcard">
                                                <img class="avatar" src="/view/img/10.jpg" alt="avatar" style="display: block;">
                                                <strong>${c2.commentAuthorName} </strong>
                                                <span class="comment-meta">
                                                    <span class="ua-info" style="display: inline;">
                                                        <br>
                                                        <span class="comment-aux">
                                                            <span class="reply">
                                                                <a rel="nofollow" class="comment-reply-link" href="#respond">回复
                                                                </a>
                                                            </span>
                                                            <fmt:formatDate value="${now}" pattern="yyyy年MM月dd日 HH:mm:ss" />&nbsp;
                                                            <c:if test="${sessionScope.user != null}">
                                                                <a href="javascript:void(0)" onclick="deleteComment(${c2.commentId})">删除</a>
                                                                <a class="comment-edit-link" href="/admin/comment/edit/${c2.commentId}"
                                                                    target="_blank">编辑</a>
                                                            </c:if>
                                                            <span class="floor"> &nbsp;${floor2}层 </span>
                                                        </span>
                                                    </span>
                                                </span>
                                                <p>
                                                    <c:if test="${c2.commentPid!=0}">
                                                        <c:if test="${c2.commentPid!=0}">
                                                            <span class="at">@ ${c2.commentPname}</span>
                                                        </c:if>
                                                        ${c2.commentContent}
                                                    </c:if>
                                                </p>
                                            </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </li>
                </c:if>
            </c:forEach>
        </ol>
    </div>

</rapid:override>


<%@ include file="../public/framework.jsp"%>