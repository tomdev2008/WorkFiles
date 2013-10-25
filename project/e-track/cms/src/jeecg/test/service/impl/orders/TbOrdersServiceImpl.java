package jeecg.test.service.impl.orders;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jeecg.contants.UserLevelContants;
import jeecg.system.pojo.base.TSUser;
import jeecg.test.dao.TbAgentsDAO;
import jeecg.test.dao.TbDestinationContryDAO;
import jeecg.test.dao.TbOrdersDAO;
import jeecg.test.dao.TbRemarkDAO;
import jeecg.test.entity.orders.TbAgentsEntity;
import jeecg.test.entity.orders.TbDestinationCountryEntity;
import jeecg.test.entity.orders.TbOrdersEntity;
import jeecg.test.entity.orders.TbRemarkEntity;
import jeecg.test.service.orders.TbOrdersServiceI;

import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.LogUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("tbOrdersService")
@Transactional
public class TbOrdersServiceImpl extends CommonServiceImpl implements TbOrdersServiceI {

	@Autowired(required=true)
	private TbOrdersDAO tbOrdersDAO;
	@Autowired(required=true)
	private TbRemarkDAO tbRemarkDAO;
	@Autowired(required=true)
	private TbAgentsDAO tbAgentsDAO;
	@Autowired(required=true)
	private TbDestinationContryDAO tbDestinationContryDAO;
	
	/**
	 *  分页查询
	 */
	@Override
	public PageList getPageList(HqlQuery hqlQuery, boolean needParameters,String queryParam,String userId,TSUser tsuser) {
		
		//条件拼接，根据登陆不同的角色，看到的订单不同
		StringBuffer whereSql = new StringBuffer();
		String userLevel = tsuser.getUserLevel().getId();
		if(UserLevelContants.Admin.equals(userLevel)){ //管理员用户,查询所有订单
			whereSql.append("("+convertSql(userId)+") f,t_s_user e,t_s_base_user ts");
			whereSql.append(" where f.orders_id = a.id and f.user_id = e.id and e.id = ts.id ");
		}else if(UserLevelContants.Forwarder.equals(userLevel)){ //货代用户,查询该用户的该货代的所有订单
			whereSql.append("("+convertSql(userId)+") f,t_s_user e,t_s_base_user ts");
			whereSql.append(" where f.orders_id = a.id and f.user_id = e.id and e.id = ts.id ");
			whereSql.append(" and a.agents_id='"+tsuser.getAgents().getId()+"' ");
		}else if(UserLevelContants.Users.equals(userLevel)){ //普通用户,查询该用户的所有订单
			whereSql.append(" tb_remark f,t_s_user e,t_s_base_user ts " );
			whereSql.append(" where f.orders_id = a.id and f.user_id = e.id and e.id = ts.id ");
			whereSql.append(" and f.user_id = '"+userId+"' ");
		}
		
		StringBuffer hql = new StringBuffer();
		hql.append(" select a.id,a.order_number,a.important,a.status,a.create_time,b.name bname,c.name cname,d.destination_country,e.mobilephone,group_concat(f.remark) remark,ts.username ");
		hql.append(" from tb_orders a ");
		hql.append(" left join tb_agents b on b.id = a.agents_id ");
		hql.append(" left join tb_channel c on c.id = a.channel_id ");
		hql.append(" left join tb_destination_country d on d.id = a.country_id, ");

		//action不同方法，拼接条件不同
		if(needParameters){
			hql.append( whereSql);
		}else{
			hql.append(" tb_remark f,t_s_user e,t_s_base_user ts " );
			hql.append(" where f.orders_id = a.id and f.user_id = e.id and e.id = ts.id ");
			hql.append(" and f.user_id = '"+userId+"' ");
		}
		
		if(queryParam==null || "".equals(queryParam)){
		}else{
			hql.append(" and ( "); 
			hql.append(" a.order_number like '%"+queryParam+"%' ");
			hql.append(" or b.name like '%"+queryParam+"%' ");
			hql.append(" or c.name like '%"+queryParam+"%' ");
			hql.append(" or d.destination_country like '%"+queryParam+"%' ");
			hql.append(" or ts.username like '%"+queryParam+"%' ");
			hql.append(" or f.remark like '%"+queryParam+"%' ");
			//拼接int类型条件的模糊查询条件
			if("正常".contains(queryParam)){
				hql.append(" or a.status = 1 ");
			}else if("转运异常".contains(queryParam)){
				hql.append(" or a.status = 2 ");
			}else if("签收".contains(queryParam)){
				hql.append(" or a.status = 3 ");
			}
			if("重要".contains(queryParam)){
				hql.append(" or a.important = 1 ");
			}else if("其次".contains(queryParam)){
				hql.append(" or a.important = 2 ");
			}else if("一般".contains(queryParam)){
				hql.append(" or a.important = 3 ");
			} 
			
			//拼接时间类型模糊查询条件
			//1、先用正则表达式匹配是否有时分秒的时间格式 yyyy-MM-dd格式时间模糊查询
			String eL = "[0-9]{4}-[0-9]{2}-[0-9]{2}";
			Pattern p = Pattern.compile(eL);
			Matcher m = p.matcher(queryParam);
			if(m.matches()){
				String startDateParam = queryParam+" 00:00:00";
				String endDateParam = queryParam+" 23:59:59";
				hql.append(" or (date_format(a.create_time,'%Y-%m-%d %H:%i:%s') <= date_format('"+endDateParam+" 23:59:59','%Y-%m-%d %H:%i:%s') ");
				hql.append(" and date_format(a.create_time,'%Y-%m-%d %H:%i:%s') >= date_format('"+startDateParam+" 00:00:00','%Y-%m-%d %H:%i:%s') )");
			}
			//yyyy-MM-dd HH:mm:ss时间格式
			String eL1 = "[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}";
			Pattern p1 = Pattern.compile(eL1);
			Matcher m1 = p1.matcher(queryParam);
			if(m1.matches()){
				hql.append(" or (date_format(a.create_time,'%Y-%m-%d %H:%i:%s') <= date_format('"+queryParam+" 23:59:59','%Y-%m-%d %H:%i:%s') ");
			}
			hql.append(" ) ");
		}
		hql.append(" group by a.order_number order by a.create_time desc");
		hqlQuery.setQueryString(hql.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("1", 1);
		hqlQuery.setMap(map);
		hqlQuery.setClass1(TbOrdersEntity.class);
		PageList result = tbOrdersDAO.getPageListBySql(hqlQuery, true);
		return result; 
	}
	
	/**
	 * 
	* 方法用途和描述: 拼接管理员用户的应查询的订单
	* @param userId
	* @return
	* @author chenliang 新增日期：2013-6-20
	* @since wuliu
	 */
	private String convertSql (String userId){
		StringBuffer sb = new StringBuffer();
		sb.append(" select t1.orders_id,t1.user_id,t1.remark ");
		sb.append(" from ( ");
		//第一部分，查询该管理员用户自己的订单
		sb.append(" select  ff1.orders_id,ff1.user_id,ff1.remark from tb_remark ff1 ");
		sb.append(" where  ff1.user_id = '"+userId+"' ");
		sb.append(" group by ff1.orders_id ");
		sb.append(" ) t1 ");
		
		sb.append(" union all ");
		//第二部分，查询不属于该管理员的订单，并且其它用户和管理员是同一订单的其它订单
		sb.append(" select t2.orders_id,t2.user_id,'' ");
		sb.append(" from ");
		sb.append(" ( ");
		sb.append(" select  ff2.orders_id,ff2.user_id,ff2.remark from tb_remark ff2 ");
		sb.append(" where  ff2.user_id != '"+userId+"' and ff2.orders_id not in ( select  ff3.orders_id from tb_remark ff3 where  ff3.user_id = '"+userId+"' ) ");
		sb.append(" group by ff2.orders_id ");
		sb.append(" ) t2 ");
		return sb.toString();
	}

	/**
	 * 根据订单id和登陆用户获取订单备注
	 */
	@Override
	public TbRemarkEntity getRemarkEntity(String id) {
		//获取登陆用户session
		TSUser user= ResourceUtil.getSessionUserName();
		String userId = ""; 
		if(user!=null){
			userId = user.getId();
		}
		String hql = "select a.id,a.remark from tb_remark a where a.orders_id =? and a.user_id = ? ";
		List remarkEntities = tbOrdersDAO.getEntity(hql, id,userId);
		if(null!=remarkEntities && remarkEntities.size()>0){
			Object[] obj = new Object[remarkEntities.size()];
			obj = (Object[]) remarkEntities.get(0);
			TbRemarkEntity entity = new TbRemarkEntity();
			entity.setId(""+obj[0]);
			entity.setRemark(""+obj[1]);
			return entity;
		}
		return null;
	}

	@Override
	public void saveEntity(TbOrdersEntity tbOrders, String remark) {
		//获取登陆用户session
		TSUser user= ResourceUtil.getSessionUserName();
		String userId = ""; 
		if(user!=null){
			userId = user.getId();
		}
		//根据订单id和当前登陆用户id查询，订单与用户关系表中是否存在，存在就修改备注，不存在就添加关系
		TbRemarkEntity remarkEntity = getRemarkEntity(tbOrders.getId());
		if(null==remarkEntity){
			saveMethod(tbOrders,remark);
		}else{
			String hql = "update tb_remark a set a.remark = ? where a.orders_id =? and a.user_id = ? ";
			int result = this.commonDao.executeSql(hql, remark,tbOrders.getId(),userId);
		}
	}

	private void saveMethod(TbOrdersEntity tbOrders, String remark){
		if(null!=tbOrders){
			//获取登陆用户session
			TSUser user= ResourceUtil.getSessionUserName();
			String userId = ""; 
			if(user!=null){
				userId = user.getId();
			}
			TbRemarkEntity remarkEntity = new TbRemarkEntity();
			remarkEntity.setRemark(remark);
			remarkEntity.setOrdersId(tbOrders);
			TSUser baseUser = new TSUser();
			baseUser.setId(userId);
			remarkEntity.setUserId(baseUser);
			tbRemarkDAO.save(remarkEntity);
			LogUtil.info("save remark success.");
		}else{
			LogUtil.info("save remark failed.");
		}
	}
	
	@Override
	public void updateRemarkEntity(TbOrdersEntity tbOrders, String remark) {
		//获取登陆用户session
		TSUser user= ResourceUtil.getSessionUserName();
		String userId = ""; 
		if(user!=null){
			userId = user.getId();
		}
		TbRemarkEntity remarkEntity = getRemarkEntity(tbOrders.getId());
		if(null==remarkEntity){
			saveMethod(tbOrders,remark);
		}else{
			String hql = "update tb_remark a set a.remark = ? where a.orders_id =? and a.user_id = ? ";
			int result = this.commonDao.executeSql(hql, remark,tbOrders.getId(),userId);
		}
	}

	@Override
	public void deleteRemarkEntity(String id) {
		String del = "delete from tb_remark where orders_id = ? ";
		int result = this.commonDao.executeSql(del, id);
	}
	
	@Override
	public void deleteTrackingEntity(String id) {
		String del = "delete from tb_order_tracking where order_id = ? ";
		int result = this.commonDao.executeSql(del, id);
	}

	@Override
	public TbOrdersEntity flatUniqueOrders(String orderNumber) {
		TbOrdersEntity entity = (TbOrdersEntity) tbOrdersDAO.findUniqueByProperty(TbOrdersEntity.class, "orderNumber", orderNumber);
		return entity;
	}

	/**
	 * 根据代理商名称判断代理商是否存在
	 */
	@Override
	public TbAgentsEntity agentsExists(String name) {
		Object obj = this.commonDao.findUniqueByProperty(TbAgentsEntity.class, "name", name);
		if(obj == null){
			TbAgentsEntity	agentsEntity = new TbAgentsEntity();
			agentsEntity.setName(name);
			tbAgentsDAO.save(agentsEntity);
			LogUtil.info("Save agentsEntity Success.");
			return agentsEntity;
		}
		return (TbAgentsEntity) obj;
	}

	@Override
	public TbDestinationCountryEntity contryEntityExists(String destinationCountry) {
		Object obj = this.commonDao.findUniqueByProperty(TbDestinationCountryEntity.class, "destinationCountry", destinationCountry);
		if(obj == null){
			TbDestinationCountryEntity	contryEntity = new TbDestinationCountryEntity();
			contryEntity.setDestinationCountry(destinationCountry);
			tbDestinationContryDAO.save(contryEntity);
			LogUtil.info("Save contryEntity Success.");
			return contryEntity;
		}
		return (TbDestinationCountryEntity) obj;
	}

}