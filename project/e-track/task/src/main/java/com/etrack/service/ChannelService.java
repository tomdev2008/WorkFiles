package com.etrack.service;

import org.apache.ibatis.session.SqlSession;

import com.etrack.base.MyBatisUtil;
import com.etrack.mybatis.client.ChannelMapper;
import com.etrack.mybatis.model.Channel;

public class ChannelService {
	private static ChannelService instance = null;
	private ChannelService(){}
	
	public static ChannelService getSingleInstance(){
		if(instance == null)
			instance = new ChannelService();
		
		return instance;
	}
	
	public Channel getById(String id) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		if (sqlSession != null) {
			System.out.println("连接数据库成功");
		}
		try {
			ChannelMapper mapper = sqlSession.getMapper(ChannelMapper.class);
			Channel  c=mapper.selectByPrimaryKey(id);
			return c;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
}
