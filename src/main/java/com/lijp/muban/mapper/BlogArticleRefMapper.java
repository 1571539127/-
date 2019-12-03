package com.lijp.muban.mapper;

import com.lijp.muban.dao.BlogArticleRefKey;

public interface BlogArticleRefMapper {
    int deleteByPrimaryKey(BlogArticleRefKey key);

    int insert(BlogArticleRefKey record);

    int insertSelective(BlogArticleRefKey record);
}