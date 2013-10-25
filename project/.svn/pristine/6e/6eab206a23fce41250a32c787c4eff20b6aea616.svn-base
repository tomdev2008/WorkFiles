package jeecg.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jeecg.system.pojo.base.TSDepart;
import jeecg.system.pojo.base.TSRoleUser;
import jeecg.system.pojo.base.TSUser;
import jeecg.system.service.UserService;
import jeecg.test.entity.orders.TbAgentsEntity;
import jeecg.test.entity.orders.TbOrdersEntity;
import jeecg.test.entity.orders.TbRemarkEntity;
import jeecg.test.service.impl.orders.TbOrdersServiceImpl;
import jeecg.test.service.orders.TbOrdersServiceI;

import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.util.JeecgSqlUtil;
import org.jeecgframework.core.util.LogUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import spring.SpringTxTestCase;

/**
 * 单元测试
 * @author yanping.shi
 *
 */
public class OrdersServiceImplTest extends SpringTxTestCase {

	@Autowired
	private TbOrdersServiceI tbOrdersService;
	
	/**
	 * Test method for {@link jeecg.system.service.impl.UserServiceImpl#checkUserExits(jeecg.system.pojo.base.TSUser)}.
	 */
	@Test
	public void testCheckUserExits() {
//		TbRemarkEntity entity = tbOrdersService.getRemarkEntity("1111111111111");
//		TbOrdersEntity tbOrders = new TbOrdersEntity();
//		tbOrders.setId("402881013f05052f013f0506da2e0004");
//		tbOrdersService.saveEntity(tbOrders, "测试备注");
//		tbOrdersService.flatUniqueOrders("11");
		TbAgentsEntity entity = tbOrdersService.agentsExists("EEE");
		System.out.println("entity:"+entity);
	}
}
