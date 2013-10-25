package com.etrack;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.etrack.base.MyBatisUtil;
import com.etrack.mybatis.client.OrdersMapper;
import com.etrack.mybatis.model.Orders;
import com.etrack.mybatis.model.OrdersExample;
import com.etrack.mybatis.model.OrdersExample.Criteria;

public class DaoTest {
	
	public static void main(String[] args) throws Exception {  
        SqlSession sqlSession = MyBatisUtil.getSession();
        if(sqlSession!=null){
        	System.out.println("连接数据库成功");
        }
        OrdersExample pet = new OrdersExample();  
        Criteria criteria= pet.createCriteria();
        criteria.andStatusEqualTo(1);
        try {  
        	OrdersMapper mapper = sqlSession.getMapper(OrdersMapper.class);  
            List<Orders> allRecords = mapper.selectByExample(pet);  
            for (Orders s : allRecords)  
                System.out.println(s.toString());  
        } finally {  
            sqlSession.close();  
        }  
    }  
}
