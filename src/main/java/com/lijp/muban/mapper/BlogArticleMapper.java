package com.lijp.muban.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lijp.muban.dao.BlogArticle;

public interface BlogArticleMapper {
    int deleteByPrimaryKey(Integer articleId);

    int insert(BlogArticle record);
    
    int countArticle();

    int insertSelective(BlogArticle record);

    List<BlogArticle> selectByPrimaryKey(@Param("articleId") Integer articleId,@Param("page") Integer page,@Param("limit") Integer limit);
    
    List<BlogArticle> selectArticle(BlogArticle article);
    
    List<BlogArticle> selectHomeArticle(BlogArticle article);

    int updateByPrimaryKeySelective(BlogArticle record);

    int updateByPrimaryKey(BlogArticle record);
}