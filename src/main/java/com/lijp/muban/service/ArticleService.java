package com.lijp.muban.service;

import java.util.List;

import com.lijp.muban.dao.BlogArticle;

public interface ArticleService {
	public List<BlogArticle> getArticle(BlogArticle article);
	public List<BlogArticle> findArticleList(Integer articleId,Integer page,Integer limit);
	public List<BlogArticle> getHomeArticle(BlogArticle article);
	public int insertArticle(BlogArticle article,int categoryId);
	public int getCountArticle();
	public int updateArticle(BlogArticle blogArticle);
}
