package cn.com.kxcomm.selfservice.action.order;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.kxcomm.entity.OrdersEntity;
import cn.com.kxcomm.selfservice.action.BaseAction;
import cn.com.kxcomm.selfservice.service.CommonService;
import cn.com.kxcomm.selfservice.service.OrdersService;

/**
 * 
* 功能描述:订单管理
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-11-5
* @author chenliang 修改日期：2013-11-5
* @since system_center_cms
 */
public class OrdersAction extends BaseAction<OrdersEntity, String> {

	@Autowired(required = true)
	private OrdersService ordersService;
	
	/**
	 * 
	* 方法用途和描述: 审核订单
	* @return
	* @author chenliang 新增日期：2013-11-5
	* @since system_center_cms
	 */
	public String checked(){
		return successInfo("审核通过！");
	}
	
	/**
	 * 
	* 方法用途和描述:查询订单详情
	* @return
	* @author chenliang 新增日期：2013-11-5
	* @since system_center_cms
	 */
	public String ordersDetail(){
		
		return successInfo("ok");
	}
	
	/**
	 * 
	* 方法用途和描述: 删除订单
	* @return
	* @author chenliang 新增日期：2013-11-5
	* @since system_center_cms
	 */
	public String deleteOrder(){
		return successInfo("删除订单成功！");
	}
	
	@Override
	public CommonService getCommonService() {
		return ordersService;
	}

	@Override
	public OrdersEntity getModel() {
		if(null == model){
			this.model = new OrdersEntity();
		}
		return this.model;
	}

	@Override
	public void setModel(OrdersEntity model) {
		this.model = model;
	}

	@Override
	public String[] getIds() {
		return this.ids;
	}

	@Override
	public void setIds(String[] ids) {
		this.ids = ids;
	}

}
