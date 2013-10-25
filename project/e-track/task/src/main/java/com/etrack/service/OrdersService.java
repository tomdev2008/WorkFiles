package com.etrack.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etrack.base.MyBatisUtil;
import com.etrack.mybatis.client.OrdersMapper;
import com.etrack.mybatis.model.Orders;
import com.etrack.mybatis.model.OrdersExample;
import com.etrack.mybatis.model.OrdersExample.Criteria;

/**
 * 
 * 订单
 * 
 * @author zhangjh 新增日期：2013-5-31
 * @since e-track-task
 */
public class OrdersService {
	private static OrdersService instance = null;
	private OrdersService(){}
	
	public static OrdersService getSingleInstance(){
		if(instance == null)
			instance = new OrdersService();
		
		return instance;
	}
	/**
	 * 
	 * 查询状态为正常的订单号
	 * 
	 * @param status
	 * @return
	 * @author zhangjh 新增日期：2013-5-31
	 * @since e-track-task
	 */
	public List<Orders> queryByStatus(List<Integer> values) {
		SqlSession sqlSession = MyBatisUtil.getSession();
		if (sqlSession != null) {
			System.out.println("连接数据库成功");
		}
		OrdersExample pet = new OrdersExample();
		Criteria criteria = pet.createCriteria();
		criteria.andStatusIn(values);
		try {
			OrdersMapper mapper = sqlSession.getMapper(OrdersMapper.class);
			List<Orders> allRecords = mapper.selectByExample(pet);
			for (Orders s : allRecords)
				System.out.println(s.toString());
			return allRecords;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	
	public void update(Orders entity){
		SqlSession sqlSession = MyBatisUtil.getSession();
		if (sqlSession != null) {
			System.out.println("连接数据库成功");
		}
		try {
			OrdersMapper mapper = sqlSession.getMapper(OrdersMapper.class);
			mapper.updateByPrimaryKey(entity);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
}
