package com.lijp.muban.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lijp.muban.dao.BlogComment;
import com.lijp.muban.mapper.BlogCommentMapper;
import com.lijp.muban.service.CommentService;
@Service
public class CommentServiceImpl implements CommentService {
@Autowired BlogCommentMapper blogCommentMapper;
	public int getCountComment(Integer articleId) {
		// TODO Auto-generated method stub
		return blogCommentMapper.countComment(articleId);
	}
	public List<BlogComment> getComment(BlogComment blogComment) {
		// TODO Auto-generated method stub
		BlogComment blog=new BlogComment();
		List<BlogComment> commentList= blogCommentMapper.selectComment(blog);
		return commentList;
	}
	public int insertComment(BlogComment blogComment) {
		// TODO Auto-generated method stub
		int i=blogCommentMapper.insert(blogComment);
		return i;
	}

}
