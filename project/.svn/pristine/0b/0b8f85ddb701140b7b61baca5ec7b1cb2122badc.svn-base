package jeecg.test.service.orders;

import jeecg.system.pojo.base.TSUser;
import jeecg.test.entity.orders.TbAgentsEntity;
import jeecg.test.entity.orders.TbDestinationCountryEntity;
import jeecg.test.entity.orders.TbOrdersEntity;
import jeecg.test.entity.orders.TbRemarkEntity;

import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.service.CommonService;

public interface TbOrdersServiceI extends CommonService{

	/**
	 * 
	* 方法用途和描述: 分页查询
	* @param hqlQuery
	* @param needParameter
	* @param queryParam
	* @return
	* @author chenliang 新增日期：2013-6-2
	* @since wuliu
	 */
	public PageList getPageList(HqlQuery hqlQuery, boolean needParameter,String queryParam,String userId,TSUser tsuser);

	/**
	 * 
	* 方法用途和描述: 根据定的那id和当前登陆id获取备注
	* @param id
	* @return
	* @author chenliang 新增日期：2013-6-2
	* @since wuliu
	 */
	public TbRemarkEntity getRemarkEntity(String id);

	/**
	 * 
	* 方法用途和描述: 保存备注
	* @param tbOrders
	* @param remark
	* @author chenliang 新增日期：2013-6-2
	* @since wuliu
	 */
	public void saveEntity(TbOrdersEntity tbOrders, String remark);

	/**
	 * 
	* 方法用途和描述: 修改备注
	* @param tbOrders
	* @param remark
	* @author chenliang 新增日期：2013-6-2
	* @since wuliu
	 */
	public void updateRemarkEntity(TbOrdersEntity tbOrders, String remark);

	/**
	 * 
	* 方法用途和描述: 根据订单id和当前登陆用户id删除备注表信息
	* @param id
	* @author chenliang 新增日期：2013-6-3
	* @since wuliu
	 */
	public void deleteRemarkEntity(String id);

	/**
	 * 
	* 方法用途和描述: 根据订单编号查询订单
	* @param orderNumber
	* @return
	* @author chenliang 新增日期：2013-6-3
	* @since wuliu
	 */
	public TbOrdersEntity flatUniqueOrders(String orderNumber);

	/**
	 * 
	* 方法用途和描述: 根据代理商名称判断代理商是否存在
	* @param name
	* @return
	* @author chenliang 新增日期：2013-6-8
	* @since wuliu
	 */
	public TbAgentsEntity agentsExists(String name);

	/**
	 * 
	* 方法用途和描述: 根据目的国id查找目的国是否存在
	* @param id
	* @return
	* @author chenliang 新增日期：2013-6-17
	* @since wuliu
	 */
	public TbDestinationCountryEntity contryEntityExists(String id);
	
	/**
	 * 
	* 方法用途和描述: 根据订单id删除订单跟踪详情内容
	* @author chenliang 新增日期：2013-6-20
	* @since wuliu
	 */
	public void deleteTrackingEntity(String id);
	
}
