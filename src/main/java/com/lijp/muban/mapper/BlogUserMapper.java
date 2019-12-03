package com.lijp.muban.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lijp.muban.dao.BlogUser;

public interface BlogUserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(BlogUser record);

    int insertSelective(BlogUser record);

    List<BlogUser> selectByPrimaryKey(Integer userId,@Param("page")Integer page,@Param("limit")Integer limit);
    
    BlogUser selectUser(BlogUser blogUser);

    int updateByPrimaryKeySelective(BlogUser record);

    int updateByPrimaryKey(BlogUser record);
    
    int getCountUser(Integer userId);
}