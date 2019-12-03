package com.lijp.muban.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lijp.muban.dao.BlogUser;
import com.lijp.muban.service.ArticleService;
import com.lijp.muban.service.CategoryService;
import com.lijp.muban.service.UserService;
import com.lijp.muban.utils.JacksonUtil;
import com.lijp.muban.utils.JsonResult;
import com.lijp.muban.utils.ResponseJsonUtil;
import com.lijp.muban.utils.VerificationCode;

import sun.misc.BASE64Encoder;

@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	@Autowired
	private ArticleService articleService;
	@Autowired 
	CategoryService categoryService;
	
	

	@RequestMapping("/login")
	public String goLogin(Model model,HttpServletRequest request) throws Exception{
		  VerificationCode verificationCode = new VerificationCode();
	      //获取验证码图片
	      BufferedImage image = verificationCode.getImage();
	      // bufferImage->base64  
	      ByteArrayOutputStream outputStream = new ByteArrayOutputStream();  
	      ImageIO.write(image, "jpg", outputStream);  
	      BASE64Encoder encoder = new BASE64Encoder();  
	      String base64Img = encoder.encode(outputStream.toByteArray()); 
	      
	      model.addAttribute("code", base64Img);
	      request.getSession().setAttribute("code",verificationCode.getText());
		return "/Admin/login";
	}
	
	@RequestMapping(value="/code",method=RequestMethod.POST)
	public void goLogin(HttpServletResponse response,HttpServletRequest request) throws Exception{
		  VerificationCode verificationCode = new VerificationCode();
	      //获取验证码图片
	      BufferedImage image = verificationCode.getImage();
	      // bufferImage->base64  
	      ByteArrayOutputStream outputStream = new ByteArrayOutputStream();  
	      ImageIO.write(image, "jpg", outputStream);  
	      BASE64Encoder encoder = new BASE64Encoder();  
	      String base64Img = encoder.encode(outputStream.toByteArray()); 
	      request.getSession().setAttribute("code",verificationCode.getText());
	      response.getWriter().write(new ResponseJsonUtil().success(base64Img));
	      
	}
	@RequestMapping(value="/loginValidate",method=RequestMethod.POST,produces = "application/json;charset=utf-8")
	@ResponseBody
	public String loginValiateMethod(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String oldCode=request.getParameter("code");
		System.out.println("username"+username);
		System.out.println("password"+password);
		System.out.println("code"+oldCode);
		System.out.println( request.getSession().getAttribute("code"));
		if(oldCode==null || oldCode=="") {
			
			return new ResponseJsonUtil().failure("验证码为空");
		}
		else if(!oldCode.equalsIgnoreCase((String) request.getSession().getAttribute("code"))) {
			 return new ResponseJsonUtil().failure("验证码不正确");
		}
		BlogUser user=new BlogUser();
		boolean flag=false;
		if(username !=null && username !="" &&  password !=null && password !="") {
			user.setUserName(username);
			user.setUserPassword(password);
			BlogUser userLogin=userService.getLoginUser(user);
			if(userLogin.getUserName()!=null) {
				flag=true;
			}
			if(flag) {
				System.out.println("登陆了");
			request.getSession().setAttribute("LoginFlag", flag+"");
			request.getSession().setAttribute("loginUser", userLogin);
			}
		}
		
		return  new ResponseJsonUtil().success(flag+"");
		
	}
}
