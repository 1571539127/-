package com.lijp.muban.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lijp.muban.dao.BlogCategory;
import com.lijp.muban.service.CategoryService;
import com.lijp.muban.utils.JacksonUtil;
import com.lijp.muban.utils.ResponseJsonUtil;

@Controller
public class CategoryController {
@Autowired 
CategoryService categoryService;

@RequestMapping(value="/category/index")
public String firstCategory(Model model) {

	return "/Admin/category/categoryIndex";
}
@RequestMapping(value="/Admin/category/unit_tag_dialog_modify_or_add_view")
public String firstCategory1(Model model) {
	return "Admin/category/unit_tag_dialog_modify_or_add_view";
}
@RequestMapping(value="/add/category/search",method=RequestMethod.POST)
public void categorySearch(HttpServletResponse response,Integer categoryId)  throws Exception {
	List<BlogCategory> allCategoryList=categoryService.getFirstCategary(categoryId);
	System.out.println("allCategoryList"+allCategoryList);
	String datajson = JacksonUtil.bean2Json(allCategoryList);
	String datalist=new ResponseJsonUtil().successdata(datajson);
	response.getWriter().write(datalist);
}

@RequestMapping(value="/add/category",method=RequestMethod.POST)
public void addCategory(HttpServletResponse response,String userdata)  throws Exception {
	Map map = JacksonUtil.json2Bean(userdata, Map.class);
	BlogCategory blogCategory=new BlogCategory();
	blogCategory.setCategoryName((String)(map.get("categoryName")));
	blogCategory.setCategoryDescribe((String)(map.get("categoryDescribe")));
	String id=(String)(map.get("categoryParentId"));
	blogCategory.setCategoryParentId(Integer.valueOf(id));
	Date date=new Date();
	blogCategory.setCategoryCreatetime(date);
	if(blogCategory.getCategoryName()==null ||blogCategory.getCategoryName() =="") {
		response.getWriter().write(new ResponseJsonUtil().failure("新增失败"));
	}
	int i=categoryService.saveCategory(blogCategory);
	System.out.println("序号"+i);
	String datajson = JacksonUtil.bean2Json(i);
	String datalist=new ResponseJsonUtil().successdata(datajson);
	response.getWriter().write(datalist);
}
@RequestMapping(value="/update/category",method=RequestMethod.POST)
public void updateCategory(HttpServletResponse response,String userdata)  throws Exception {
	Map map = JacksonUtil.json2Bean(userdata, Map.class);
	BlogCategory blogCategory=new BlogCategory();
	String id=(String)(map.get("categoryId"));
	blogCategory.setCategoryId(Integer.valueOf(id));
	blogCategory.setCategoryName((String)(map.get("categoryName")));
	blogCategory.setCategoryDescribe((String)(map.get("categoryDescribe")));
	if(blogCategory.getCategoryName()==null ||blogCategory.getCategoryName() =="") {
		response.getWriter().write(new ResponseJsonUtil().failure("更新失败"));
	}
	int i=categoryService.updateCategory(blogCategory);
	System.out.println("序号"+i);
	String datajson = JacksonUtil.bean2Json(i);
	String datalist=new ResponseJsonUtil().successdata(datajson);
	response.getWriter().write(datalist);
}

@RequestMapping(value="/category/search",method=RequestMethod.POST)
public void categorySearch(Model model,HttpServletResponse response)  throws Exception {
	List<BlogCategory> allCategoryList=categoryService.getFirstCategary(null);
	System.out.println("allCategoryList"+allCategoryList);
	String datajson = JacksonUtil.bean2Json(allCategoryList);
	String datalist=new ResponseJsonUtil().successdata(datajson);
	response.getWriter().write(datalist);
}



//@RequestMapping(value="/category/search",method=RequestMethod.POST)
//@ResponseBody
//public String categorySearch(Model model)  throws Exception {
//	List<HashMap<String, Object>> allCategoryList=categoryService.getAllCategory(null,0);
//	System.out.println("allCategoryList"+allCategoryList);
//	String datajson = JacksonUtil.bean2Json(allCategoryList);
//	return new ResponseJsonUtil().successdata(datajson);
//}
}
