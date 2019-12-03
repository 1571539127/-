package com.lijp.muban.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lijp.muban.dao.BlogCategory;

public interface BlogCategoryMapper {
    int deleteByPrimaryKey(Integer categoryId);

    int insert(BlogCategory record);

    int insertSelective(BlogCategory record);
    
    int countCategory();

    List<BlogCategory> selectByPrimaryKey(@Param("categoryId") Integer categoryId,@Param("categoryParentId") Integer categoryParentId);
//    List<BlogCategory> selectByPrimaryKey(Integer categoryId,Integer categoryParentId);
//    
    List<BlogCategory> selectSecond(Integer categoryId);
   

    int updateByPrimaryKeySelective(BlogCategory record);

    int updateByPrimaryKey(BlogCategory record);
}