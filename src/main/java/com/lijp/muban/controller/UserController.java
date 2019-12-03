package com.lijp.muban.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lijp.muban.dao.BlogUser;
import com.lijp.muban.dao.PageUtil;
import com.lijp.muban.service.UserService;
import com.lijp.muban.utils.JacksonUtil;
import com.lijp.muban.utils.ResponseJsonUtil;

@Controller
public class UserController {
	@Autowired
	UserService userService;

	@RequestMapping("/user/index")
	public String userIndex(Model model) {
		return "/Admin/user/index";
	}

	@RequestMapping("/user/search")
	@ResponseBody
	public PageUtil<BlogUser> userSearch(int page, int limit) {
		System.out.println(page);
		PageUtil<BlogUser> pageUtil = new PageUtil<BlogUser>();
		pageUtil.setCode(200);
		System.out.println("--" + userService.getCountUser(null));
		pageUtil.setCount(userService.getCountUser(null));
		pageUtil.setMsg("成功");
		if(page==0) {page=1;}
		page=(page-1)*limit;
		List<BlogUser> userList = userService.findUserList(null,page,limit);
		pageUtil.setData(userList);
		return pageUtil;
	}
	@RequestMapping("/insert/user")
	public String insertUser(Model model) {
		return "/Admin/user/insert";

	}
	
//	@RequestMapping("/submit/user")
	@RequestMapping(value = "/submit/user", method = RequestMethod.POST)
//	@ResponseBody
	public String submitUser(BlogUser blogUser, @RequestParam("file") MultipartFile file) {
		BlogUser user=new BlogUser();
		System.out.println(user);
		user.setUserName(blogUser.getUserName());
		user.setUserPassword(blogUser.getUserPassword());
		user.setUserEmail(blogUser.getUserEmail());
		
		Date date=new Date();
		user.setUserCreatetime(date);
		user.setUserLastTime(date);
		user.setUserRegisterTime(date);
		user.setUserUpdatetime(date);
		try {
		byte[] imgBytes = file.getBytes();
		System.out.println(imgBytes);
			user.setUserImage(imgBytes);
			if(!file.isEmpty()) {
				System.out.println(file.getOriginalFilename());
			}
			System.out.println(file.getBytes().length);
			System.out.println(file.getSize());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(user);
		int i=0;
		
		if(!(isNull(blogUser.getUserName()) || isNull(blogUser.getUserPassword()))) {
			 i=userService.insertUser(user);
		}
		return "/Admin/user/index";

	}
	
	
//	@RequestMapping(value = "/update/user", method = RequestMethod.POST,produces="application/json;charset='utf-8'")
//	@ResponseBody
	@RequestMapping(value="/update/user")
	public String updateUser(BlogUser blogUser, @RequestParam("file") MultipartFile file,HttpServletResponse response) throws Exception{
//		public String updateUser(String userInf) throws Exception{
//		Map map=(Map)JacksonUtil.json2Bean(userInf, Map.class);
//		String data=(String)map.get("userImage");
//		String data1=data.substring(23,data.length()-1);
//		"data:image/jpeg;base64,/9j/"
		
		
		BlogUser user=new BlogUser();
		System.out.println(user);
		user.setUserName(blogUser.getUserName());
		user.setUserPassword(blogUser.getUserPassword());
		user.setUserEmail(blogUser.getUserEmail());
		user.setUserId(blogUser.getUserId());
		
		Date date=new Date();
		user.setUserUpdatetime(date);
		try {
		byte[] imgBytes = file.getBytes();
		System.out.println(imgBytes);
			
			if(!file.isEmpty()) {
//				return new ResponseJsonUtil().failure("照片为空");
				user.setUserImage(imgBytes);
			}
			System.out.println(file.getBytes().length);
			System.out.println(file.getSize());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(user);
		int i=0;
		
		if(!(isNull(blogUser.getUserName()) || isNull(blogUser.getUserPassword()))) {
			 i=userService.updatetUser(user);
			 return "redirect:/user/index";
//			 return new ResponseJsonUtil().success(i+"");
		}
		
		
		
		
		
//		return new ResponseJsonUtil().failure("用户名或密码为空");
		return "redirect:/user/index";

	}
	@RequestMapping(value="/delete/user")
	@ResponseBody
	public String deleteUser(Integer userId) throws Exception{
		userService.deletetUser(userId);
		return new ResponseJsonUtil().success("删除成功");
	} 
	public boolean isNull(String str) {
		if(str ==null || str =="") {
			return true;
		}
		return false;
	}
		
	

}
