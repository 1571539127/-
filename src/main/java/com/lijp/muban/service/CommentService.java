package com.lijp.muban.service;

import java.util.List;

import com.lijp.muban.dao.BlogComment;

public interface CommentService {
  public int getCountComment(Integer articleId);
  
  public List<BlogComment> getComment(BlogComment blogComment);

  public int insertComment(BlogComment blogComment);
}
