package com.lijp.muban.service;

import java.util.List;

import com.lijp.muban.dao.BlogUser;


public interface UserService {
  public List<BlogUser> findUserList(Integer userId,Integer page, Integer limit);
  public BlogUser getLoginUser(BlogUser blogUser);
  public int getCountUser(Integer userId);
  public int insertUser(BlogUser blogUser);
  public int updatetUser(BlogUser blogUser);
  public int deletetUser(Integer userId);
}
