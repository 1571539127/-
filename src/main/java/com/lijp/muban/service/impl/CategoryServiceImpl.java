package com.lijp.muban.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanMap;
import org.springframework.stereotype.Service;

import com.lijp.muban.dao.BlogCategory;
import com.lijp.muban.mapper.BlogCategoryMapper;
import com.lijp.muban.service.CategoryService;
@Service
public class CategoryServiceImpl implements CategoryService {
@Autowired BlogCategoryMapper blogCategoryMapper;


	public List<BlogCategory> getSendCategary(Integer categoryId) {
		// TODO Auto-generated method stub
		List<BlogCategory> list=blogCategoryMapper.selectSecond(categoryId);
		return list;
	}

	public List<BlogCategory> getFirstCategary(Integer categoryId) {
		// TODO Auto-generated method stub
		List<BlogCategory> list=blogCategoryMapper.selectByPrimaryKey(categoryId,null);
		return list;
	}

	public int getCountCategory() {
		// TODO Auto-generated method stub
		return blogCategoryMapper.countCategory();
	}

//	public List<HashMap<String, Object>> getAllCategory(Integer categoryId, Integer categoryParentId) {
//		// TODO Auto-generated method stub
//		List<BlogCategory> list=blogCategoryMapper.selectByPrimaryKey(null, 0);
//		List<HashMap<String, Object>> result = new ArrayList<>(); 
//		List<HashMap<String, Object>> ll=(List<HashMap<String, Object>>)fun(list, result);
//		return ll;
//	}
//	private Object fun(List<BlogCategory> menu, List<HashMap<String, Object>> result) {
//	    for(BlogCategory m : menu){
//	        HashMap<String, Object> map = new HashMap<>();
//	        map.put("id", m.getCategoryId());
//	        map.put("title", m.getCategoryName());
////	        map.put("spread", true);      //设置是否展开
//	        List<HashMap<String, Object>> result1 = new ArrayList<>();
//	        
//	    	Integer id1= m.getCategoryId();
//			List<BlogCategory> cateList=blogCategoryMapper.selectByPrimaryKey(null, id1);
//			if(cateList.size()!=0) {
//				  map.put("children", fun(cateList, result1));
//				}
//			  result.add(map);
//			}
//	      
//	    return result;
//	    }
	public List<BlogCategory> getCategoryListMethod( List<BlogCategory> categoryList) {
		// TODO Auto-generated method stub
		List currentCategoryList=new ArrayList<>();
		for(int i=0;i<categoryList.size();i++) {
			//转为map
			Map<String, Object> map = null;
			try {
				System.out.println(categoryList.get(i));
				map = beanToMap((categoryList.get(i)));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Integer id=(Integer) map.get("categoryId");
			List<BlogCategory> cateList=blogCategoryMapper.selectByPrimaryKey(null, id);
			if(cateList.size() !=0) {
				map.put("children", cateList);
				currentCategoryList.add(map);
				getCategoryListMethod(cateList);
			}
		}
		return null;
	}
	
	  public static <T> Map<String, Object> beanToMap(T bean) {
	        Map<String, Object> map = new HashMap();
	        if (bean != null) {
	            BeanMap beanMap = BeanMap.create(bean);
	            for (Object key : beanMap.keySet()) {
	            	if("categoryId".equals(key) || "categoryName".equals(key) || "categoryParentId".equals(key) || "children".equals(key) )
	                map.put(key + "", beanMap.get(key));
	            }
	        }
	        return map;
	    }
	  
public List<HashMap<String, Object>> getAllCategory(Integer categoryId, Integer categoryParentId) {
		// TODO Auto-generated method stub
	 List<BlogCategory> parentList=blogCategoryMapper.selectByPrimaryKey(null, 0);
	 List<HashMap<String,Object>> listMap=new ArrayList<HashMap<String,Object>>();
	 List<HashMap<String, Object>> allList=(List<HashMap<String, Object>> )fun(parentList);
	
		return allList;
	}
	private Object fun(List<BlogCategory> parentList) {
	    List<HashMap<String,Object>> listMap=new ArrayList<HashMap<String,Object>>();
		for(BlogCategory cate:parentList) {
	    	  HashMap<String,Object> map=new HashMap<String,Object>();
	    	  map.put("id", cate.getCategoryId());
	    	  map.put("title", cate.getCategoryName());
	    	  Integer parentId=cate.getCategoryId();
	    	 List<BlogCategory> childrenList= blogCategoryMapper.selectByPrimaryKey(null, parentId);
	    	 if(childrenList.size() !=0) {map.put("children", fun(childrenList));}
	    	 listMap.add(map);
	    	  }
	    return listMap;
	    }

	public int saveCategory(BlogCategory blogCategory) {
		// TODO Auto-generated method stub
		return blogCategoryMapper.insert(blogCategory);
	}

	public int updateCategory(BlogCategory blogCategory) {
		// TODO Auto-generated method stub
		return blogCategoryMapper.updateByPrimaryKeySelective(blogCategory);
	}

   



}
