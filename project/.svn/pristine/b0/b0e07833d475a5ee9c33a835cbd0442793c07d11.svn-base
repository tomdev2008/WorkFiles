package com.etrack.service;

import org.apache.ibatis.session.SqlSession;

import com.etrack.base.MyBatisUtil;
import com.etrack.mybatis.client.OrderTrackingMapper;
import com.etrack.mybatis.model.OrderTracking;
import com.etrack.mybatis.model.OrderTrackingExample;
import com.etrack.mybatis.model.OrderTrackingExample.Criteria;

public class OrderTrackingService {
	private static OrderTrackingService instance = null;
	private OrderTrackingService(){}
	
	public static OrderTrackingService getSingleInstance(){
		if(instance == null)
			instance = new OrderTrackingService();
		
		return instance;
	}
	
	public void save(OrderTracking entity){
		SqlSession sqlSession = MyBatisUtil.getSession();
		if (sqlSession != null) {
			System.out.println("连接数据库成功");
		}
		try {
			OrderTrackingMapper mapper = sqlSession.getMapper(OrderTrackingMapper.class);
			mapper.insert(entity);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
	
	public void deleteByOrderID(String orderId){
		SqlSession sqlSession = MyBatisUtil.getSession();
		if (sqlSession != null) {
			System.out.println("连接数据库成功");
		}
		try {
			OrderTrackingMapper mapper = sqlSession.getMapper(OrderTrackingMapper.class);
			OrderTrackingExample pet = new OrderTrackingExample();
			Criteria criteria = pet.createCriteria();
			criteria.andOrderIdEqualTo(orderId);
			mapper.deleteByExample(pet);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
}
