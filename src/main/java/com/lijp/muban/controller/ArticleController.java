package com.lijp.muban.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lijp.muban.dao.BlogArticle;
import com.lijp.muban.dao.BlogCategory;
import com.lijp.muban.dao.BlogComment;
import com.lijp.muban.dao.BlogUser;
import com.lijp.muban.dao.PageUtil;
import com.lijp.muban.service.ArticleService;
import com.lijp.muban.service.CategoryService;
import com.lijp.muban.service.CommentService;
import com.lijp.muban.utils.JsonResult;

@Controller
public class ArticleController {
 @Autowired CategoryService categoryService;
 @Autowired ArticleService articleService;
 @Autowired CommentService commentService;
 
	@RequestMapping("/article/index")
	public String goArticleIndex(Model model) {
		return "/Admin/article/index";
	}
	@RequestMapping("/update/article")
	public String updateArticle(BlogArticle article) {
		Date date=new Date();
		article.setArticleUpdatetime(date);
		articleService.updateArticle(article);
		return "redirect:/article/index";
	}
	
	
	@RequestMapping("/article/search")
	@ResponseBody
	public PageUtil<BlogArticle> articleIndex(int page, int limit) {
		System.out.println(page);
		PageUtil<BlogArticle> pageUtil = new PageUtil<BlogArticle>();
		pageUtil.setCode(200);
		System.out.println("--" + articleService.getCountArticle());
		pageUtil.setCount(articleService.getCountArticle());
		pageUtil.setMsg("成功");
		if(page==0) {page=1;}
		page=(page-1)*limit;
		List<BlogArticle> articleList = articleService.findArticleList(null,page,limit);
		pageUtil.setData(articleList);
		return pageUtil;
	}
 @RequestMapping("/insertArticle")
 public String insertArticle(Model model) {
	List<BlogCategory> categoryList= categoryService.getFirstCategary(null);
	model.addAttribute("categoryList",categoryList);
	 return "/Admin/article/insert";
 }
 
 @RequestMapping("/submit/article")
 public String sumitArticle(HttpServletRequest request, BlogArticle blogArticle) {
	 System.out.println("tile"+request.getParameter("articleTitle"));
	 BlogUser user=(BlogUser)request.getSession().getAttribute("loginUser");
	 
	 BlogArticle article=new BlogArticle();
	 article.setArticleAuthorName(blogArticle.getArticleAuthorName());
	 article.setArticleContent(blogArticle.getArticleContent());
	 String content=blogArticle.getArticleContent();
	 System.out.println(content);
//	 String content1=content.replaceAll("/(<\\/?p.*?>)|(<\\/?span.*?>)/g", "");
	 String content1=content.replace("<\\s*span\\s+([^>]*)\\s*>", content);
	 System.out.println(content1);
	 
	 article.setArticleTitle(blogArticle.getArticleTitle());
	 article.setArticleAuthorName(user.getUserName());
	 
	 SimpleDateFormat simple=new SimpleDateFormat();
	 Date date=new Date();
	 String current=simple.format(date);
	 BlogUser user1=(BlogUser)request.getSession().getAttribute("loginUser");
	 article.setUserId(user1.getUserId());
	 article.setArticleCreatetime(date);
	 article.setArticleUpdatetime(date);
	 articleService.insertArticle(article,blogArticle.getSecondCategory());
	 return "redirect:/article/index";
 }
 
 
 

 
 
 @RequestMapping("secondLinkage")
 @ResponseBody
 public void secondLinkage(Integer categoryId,HttpServletRequest request,HttpServletResponse reponse) {
	 List<BlogCategory> sendCategoryList= categoryService.getSendCategary(categoryId);
	 try {
		reponse.getWriter().write(sendCategoryList.toString());
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
 }
 /**
  * 前端请求
  * 
  */
 @RequestMapping("/home/article")
 public String homeArticle(Model model) {
		BlogArticle article=new BlogArticle();
		List<BlogArticle> list=articleService.getHomeArticle(article);
		System.out.println("articleList"+list);
		model.addAttribute("articleList",list);
	 return "/Home/article/index";
 }
 @RequestMapping("/article/{articleId}")
 public String selectArticleId(@PathVariable("articleId") Integer articleId ,Model model) {
	 BlogArticle article=new BlogArticle();
	 System.out.println("44"+articleId);
	 article.setArticleId(articleId);
	 List<BlogArticle> article2 = articleService.getArticle(article);
	 BlogComment comment=new BlogComment();
	 System.out.println("55"+comment.getCommentId());
	 comment.setArticleId(Long.valueOf(articleId));
	 List<BlogComment> commentList=commentService.getComment(comment);
	 model.addAttribute("articleDetai",article2.get(0));
	 model.addAttribute("commentList",commentList);
	 return "/Home/article/articleDetail";
 }
// 在使用 @RequestMapping 后，返回值通常解析为跳转路径，加上 @Responsebody 后返回结果不会被解析为跳转路径，而是直接写入HTTP 响应正文中。例如，异步获取 json 数据，加上 @Responsebody 注解后，就会直接返回 json 数据
 @RequestMapping(value="/submit/comment", method = {RequestMethod.POST})
 @ResponseBody
 public void submitComment(BlogComment blogComment ,Model model,HttpServletResponse response) {
	 System.out.println(111);
	 if(0L==blogComment.getCommentPid() || blogComment.getCommentPid()==null) {
		 System.out.println("提交评论1"+blogComment);
		 blogComment.setCommentPid(0l);
	 }
	 System.out.println("提交评论2"+blogComment);

	 int y=commentService.insertComment(blogComment);
	 
	 BlogArticle article=new BlogArticle();
	 int i=new Long(blogComment.getArticleId()).intValue();
	 article.setArticleId(i);
	 List<BlogArticle> article2 = articleService.getArticle(article);
	
	 BlogComment comment=new BlogComment();
	 System.out.println("55"+comment.getCommentId());
	 comment.setArticleId(blogComment.getArticleId());
	 List<BlogComment> commentList=commentService.getComment(comment);
//	 model.addAttribute("articleDetai",article2.get(0));
//	 model.addAttribute("commentList",commentList);
//	 return "/Home/article/articleDetail";

 }
}
