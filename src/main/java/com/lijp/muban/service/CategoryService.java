package com.lijp.muban.service;

import java.util.HashMap;
import java.util.List;

import com.lijp.muban.dao.BlogCategory;

public interface CategoryService {
   public List<BlogCategory> getSendCategary(Integer categoryId);
   public List<BlogCategory> getFirstCategary(Integer categoryId);
   public int getCountCategory();
   public List<HashMap<String, Object>>getAllCategory(Integer categoryId,Integer categoryParentId);
   
   public int saveCategory(BlogCategory blogCategory);
   public int updateCategory(BlogCategory blogCategory);
   
}
