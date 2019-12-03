package com.lijp.muban.mapper;

import java.util.List;

import com.lijp.muban.dao.BlogComment;

public interface BlogCommentMapper {
    int deleteByPrimaryKey(Integer commentId);

    int insert(BlogComment record);

    int insertSelective(BlogComment record);

    BlogComment selectByPrimaryKey(Integer commentId);
    
    List<BlogComment> selectComment(BlogComment blogComment);

    int updateByPrimaryKeySelective(BlogComment record);

    int updateByPrimaryKey(BlogComment record);
    
    int countComment(Integer articleId);
}