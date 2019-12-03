<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid"%>
<rapid:override name="left">
    <div style="float:left;width:70%;">
        <c:forEach items="${articleList}" var="c">
            <main id="" class="" role="">
                <article class="post">
                    <figure class="thumbnail">
                        <a href="">
                            <img width="280" height="210" src="/view/img/1.jpg" class="" alt="/view/img/1.jpg">
                        </a>
                        <span class="cat">
                            <a href="/article/${c.articleId}">
                                ${c.categoryName}
                            </a>
                        </span>
                    </figure>
                    <header class="">
                        <h2 class="">
                            <a href="/article/${c.articleId}" rel="">
                                ${c.articleTitle}
                            </a>
                        </h2>
                    </header>
                    <div class="">
                      
                            ${c.articleContent}
                       
                        <span class="entry-meta">
                            <span class="">
                                <i class="fa fa-eye"></i>
                               评论数
                            </span>
                        </span>
                        <div class="clear"></div>
                    </div>
                    <span class="entry-more">
                            <a href="/article/${c.articleId}">
                            阅读全文
                        </a>
                    </span>
                </article>
            </main>

        </c:forEach>
    </div>
</rapid:override>

<%@ include file="../public/framework.jsp" %>