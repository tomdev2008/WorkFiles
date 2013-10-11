package jeecg.kxcomm.service.impl.contactm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jeecg.kxcomm.service.contactm.TbOrderServiceI;

import org.hibernate.SQLQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.hibernate.qbc.PagerUtil;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.entity.contactm.TbOrderDetailEntity;
import jeecg.kxcomm.entity.hrm.TbCheckingInstanceEntity;
import jeecg.kxcomm.entity.hrm.TbEmployeeEntity;
import jeecg.kxcomm.entity.hrm.TbOrgenEntity;
@Service("tbOrderService")
@Transactional
public class TbOrderServiceImpl extends CommonServiceImpl implements TbOrderServiceI {

	@Override
	public void addMain(TbOrderEntity tbOrder,
	        List<TbOrderDetailEntity> tbOrderDetailList){
			//保存主信息
			tbOrder.setTbContract(null);//有主外键关系
			this.save(tbOrder);
		
			/**保存-产品明细*/
			for(TbOrderDetailEntity tbOrderDetail:tbOrderDetailList){
				//外键设置
				tbOrderDetail.setTbOrder(tbOrder);//.setOrderId(tbOrder.getId());////
				this.save(tbOrderDetail);
			}
	}

	@Override
	public void updateMain(TbOrderEntity tbOrder,
	        List<TbOrderDetailEntity> tbOrderDetailList) {
		//保存订单主信息
//		String id = tbOrder.getTbContract().getId();
//		
//		if(id!=null){
//			TbContractEntity tbContract = this.getEntity(TbContractEntity.class, id);
//		    tbOrder.setTbContract(tbContract);
//		}else{
//			tbOrder.setTbContract(null);
//		}
	   
	    this.saveOrUpdate(tbOrder);
		
		
		//===================================================================================
		//获取参数
		Object id0 = tbOrder.getId();
		//===================================================================================
		//删除-产品明细
	    String hql0 = "from TbOrderDetailEntity where 1 = 1 AND tbOrder = ? ";
	    List<TbOrderDetailEntity> tbOrderDetailOldList = this.findHql(hql0,tbOrder);
		//this.deleteAllEntitie(tbOrderDetailOldList);
	    for(TbOrderDetailEntity tbOrderDetail:tbOrderDetailOldList){
	    	
	    	tbOrderDetail.setTbOrder(null);
	    }
	    
		//保存-产品明细
		for(TbOrderDetailEntity tbOrderDetail:tbOrderDetailList){
			
			//if(!tbOrderDetail.getId().equals("")){
				tbOrderDetail.setTbOrder(tbOrder);
				this.save(tbOrderDetail);
			//}else{
				//外键设置
				tbOrderDetail.setTbOrder(tbOrder);
				this.save(tbOrderDetail);
			//}
			
		}
		
	}

	@Override
	public void delMain(TbOrderEntity tbOrder) {
		
		
		//===================================================================================
		//获取参数
		Object id0 = tbOrder.getId();
		//===================================================================================
		//删除-产品明细
	    String hql0 = "from TbOrderDetailEntity where 1 = 1 AND tbOrder = ? ";
	    List<TbOrderDetailEntity> tbOrderDetailOldList = this.findHql(hql0,tbOrder);
		this.deleteAllEntitie(tbOrderDetailOldList);
		//删除主表信息
		this.delete(tbOrder);
	}

	@Override
	public PageList getPageList(HqlQuery hqlQuery, boolean b,
			TbOrderEntity tbOrder, String kxOrderNo,String projectName,String contractNo,String client,String principal) {
		//条件拼接，根据登陆不同的角色，看到的订单不同
				StringBuffer whereSql = new StringBuffer();
				
				if(null != kxOrderNo && !("").equals(kxOrderNo)) {
					whereSql.append(" and a.kx_order_no like '%"+kxOrderNo+"%' ");
				}
				
				if(null != projectName && !("").equals(projectName)) {
					whereSql.append(" and a.project_name like '%"+projectName+"%' ");
				}
				if(null != contractNo && !("").equals(contractNo)) {
					whereSql.append(" and a.contract_no like '%"+contractNo+"%' ");
				}
				if(null != client && !("").equals(client)) {
					whereSql.append(" and a.client like '%"+client+"%' ");
				}
				if(null != principal && !("").equals(principal)) {
					whereSql.append(" and a.principal like '%"+principal+"%' ");
				}
				//主干sql
				StringBuffer hql = new StringBuffer();
				hql.append(" select a.id,a.kx_order_no,a.project_name,a.client,a.final_client," +
						"a.payment,a.principal,a.total_price,a.remark ");
				hql.append(" from tb_order a where 1=1 ");
				hql.append(whereSql.toString());
				
				hqlQuery.setQueryString(hql.toString());
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("1", 1);
				hqlQuery.setMap(map);
				hqlQuery.setClass1(TbOrderEntity.class);
				
				SQLQuery query = getSession().createSQLQuery(hqlQuery.getQueryString());
				int allCounts = query.list().size();
				int curPageNO = hqlQuery.getCurPage();
				int offset = PagerUtil.getOffset(allCounts, curPageNO, hqlQuery.getPageSize());
				query.setFirstResult(offset);
				query.setMaxResults(hqlQuery.getPageSize());
			 	List list= query.list();
				List<TbOrderEntity> volist = new ArrayList<TbOrderEntity>();
				Object[]  obj = new Object[volist.size()];
				for (int i = 0; i < list.size(); i++) {
					obj = (Object[]) list.get(i);
					TbOrderEntity vo = new TbOrderEntity();
					vo.setId(""+obj[0]);
					vo.setKxOrderNo(""+obj[1]);
					vo.setProjectName(""+obj[2]);
					vo.setClient(""+obj[3]);
					vo.setFinalClient(""+obj[4]);
					vo.setPayment(""+obj[5]);
					vo.setPrincipal(""+obj[6]);
					vo.setTotalPrice(""+obj[7]);
					vo.setRemark(""+obj[8]);
					
					volist.add(vo);
				}
				return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}
	
}