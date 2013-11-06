package cn.com.kxcomm.selfservice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.kxcomm.base.dao.CommonDAO;
import cn.com.kxcomm.entity.OrdersEntity;
import cn.com.kxcomm.selfservice.dao.OrdersDAO;
import cn.com.kxcomm.selfservice.service.OrdersService;

/**
 * 
* 功能描述:订单业务处理类
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-11-5
* @author chenliang 修改日期：2013-11-5
* @since system_center_cms
 */
@Service("ordersService")
public class OrdersServiceImpl extends CommonServiceImpl<OrdersEntity> implements OrdersService {

	@Autowired(required = true)
	private OrdersDAO ordersDAO;
	
	
	
	
	@Override
	public CommonDAO<OrdersEntity> getBindDao() {
		return ordersDAO;
	}
	
	

}
