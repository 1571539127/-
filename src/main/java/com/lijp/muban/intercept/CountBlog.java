package com.lijp.muban.intercept;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.lijp.muban.service.ArticleService;
import com.lijp.muban.service.CategoryService;
import com.lijp.muban.service.CommentService;

public class CountBlog implements HandlerInterceptor {
@Autowired ArticleService articleService;
@Autowired CommentService commentService;
@Autowired CategoryService categoryService;

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		int countArticle=articleService.getCountArticle();
		int countComment=commentService.getCountComment(null);
		int countCategory=categoryService.getCountCategory();
		List<String> countList=new ArrayList<String>();
		
		countList.add(countArticle+"");
		countList.add(countComment+"");
		countList.add(countCategory+"");
		request.setAttribute("countList", countList);
		
		
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
