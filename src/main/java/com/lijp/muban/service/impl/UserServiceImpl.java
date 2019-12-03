package com.lijp.muban.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lijp.muban.dao.BlogUser;
import com.lijp.muban.mapper.BlogUserMapper;
import com.lijp.muban.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired(required=false)
	private BlogUserMapper blogUserMapper;
	public List<BlogUser> findUserList(Integer userId,Integer page, Integer limit) {
		// TODO Auto-generated method stub
		List<BlogUser> list=blogUserMapper.selectByPrimaryKey(userId,page,limit);
		return list;
	}
	
	//可以试验动态绑定
	public BlogUser getLoginUser(BlogUser blogUser) {
		BlogUser blogUser1 =blogUserMapper.selectUser(blogUser);
		if(blogUser1==null) {
			return null;
		}
		System.out.println("blogUser22"+blogUser1);
		return blogUser1;
	}

	public int getCountUser(Integer userId) {
		// TODO Auto-generated method stub
		return blogUserMapper.getCountUser(userId);
	}

	public int insertUser(BlogUser blogUser) {
		// TODO Auto-generated method stub
		return blogUserMapper.insert(blogUser);
	}

	@Override
	public int updatetUser(BlogUser blogUser) {
		// TODO Auto-generated method stub
		return blogUserMapper.updateByPrimaryKeySelective(blogUser);
	}

	@Override
	public int deletetUser(Integer userId) {
		// TODO Auto-generated method stub
		return blogUserMapper.deleteByPrimaryKey(userId);
	}




}
