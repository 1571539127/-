package com.lijp.muban.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lijp.muban.dao.BlogArticle;
import com.lijp.muban.dao.BlogArticleRefKey;
import com.lijp.muban.mapper.BlogArticleMapper;
import com.lijp.muban.mapper.BlogArticleRefMapper;
import com.lijp.muban.service.ArticleService;
@Service
public class ArticleServiceImpl implements ArticleService{
@Autowired 
BlogArticleMapper blogArticleMapper;
@Autowired 
BlogArticleRefMapper blogArticleRefMapper;


	public List<BlogArticle> getArticle(BlogArticle article) {
		// TODO Auto-generated method stub
		List<BlogArticle> list=new ArrayList<BlogArticle>();
		list=blogArticleMapper.selectArticle(article);
		return list;
	}

	public int insertArticle(BlogArticle article,int categoryId) {
		// TODO Auto-generated method stub
		System.out.println("前"+article.getArticleId());
		int i=blogArticleMapper.insert(article);
		System.out.println("后"+article.getArticleId());
		System.out.println("插入"+i);
		BlogArticleRefKey ref=new BlogArticleRefKey();
		ref.setArticleId(Long.valueOf(article.getArticleId()));
		ref.setCategoryId(Long.valueOf(categoryId));

		blogArticleRefMapper.insert(ref);
		return i;
	}

	public int getCountArticle() {
		// TODO Auto-generated method stub
		int i=blogArticleMapper.countArticle();
		return i;
	}

	public List<BlogArticle> getHomeArticle(BlogArticle article) {
		// TODO Auto-generated method stub
		List<BlogArticle> list=new ArrayList<BlogArticle>();
		list=blogArticleMapper.selectHomeArticle(article);
		return list;
	}

	@Override
	public List<BlogArticle> findArticleList(Integer articleId, Integer page, Integer limit) {
		// TODO Auto-generated method stub
		return blogArticleMapper.selectByPrimaryKey(articleId, page, limit);
	}

	@Override
	public int updateArticle(BlogArticle blogArticle) {
		// TODO Auto-generated method stub
		return blogArticleMapper.updateByPrimaryKeySelective(blogArticle);
	}

}
