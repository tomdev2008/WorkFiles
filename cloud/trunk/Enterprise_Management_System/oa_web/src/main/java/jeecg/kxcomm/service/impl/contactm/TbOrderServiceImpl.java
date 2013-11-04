package jeecg.kxcomm.service.impl.contactm;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.contactm.TbOrderDetailEntity;
import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.service.contactm.TbContractServiceI;
import jeecg.kxcomm.service.contactm.TbOrderServiceI;
import jeecg.kxcomm.util.BusinessUtil;
import jeecg.kxcomm.util.CommonUtil;
import jeecg.kxcomm.vo.contactm.TbOrderEntityVo;

import org.hibernate.SQLQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.hibernate.qbc.PagerUtil;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service("tbOrderService")
@Transactional
public class TbOrderServiceImpl extends CommonServiceImpl implements TbOrderServiceI {

	@Autowired
	private TbContractServiceI tbContractService;
	private CommonUtil commonUtil =CommonUtil.getInstance();
	@Override
	public void addMain(TbOrderEntity tbOrder,
	        List<TbOrderDetailEntity> tbOrderDetailList){
			double sum=0;
			for(TbOrderDetailEntity tbOrderDetail:tbOrderDetailList){
				double totalPrice =0;
				if(tbOrderDetail.getTotalprice()!=null&&!"".equals(tbOrderDetail.getTotalprice().trim())){
					String rs = commonUtil.numberFormat(tbOrderDetail.getTotalprice(), 4, true);
					totalPrice = Double.parseDouble(rs);
					sum+=totalPrice;
				}
			}
			tbOrder.setTotalPrice(""+sum);
			this.save(tbOrder);
		
			/**保存-产品明细*/
			for(TbOrderDetailEntity tbOrderDetail:tbOrderDetailList){
				//外键设置
				tbOrderDetail.setStatus(BusinessUtil.TO_PURCHASE);
				tbOrderDetail.setTbOrder(tbOrder);//.setOrderId(tbOrder.getId());////
				this.save(tbOrderDetail);
			}
	}

	@Override
	public void updateMain(TbOrderEntity tbOrder,List<TbOrderDetailEntity> tbOrderDetailList) {
		double sum=0;
		for(TbOrderDetailEntity tbOrderDetail:tbOrderDetailList){
			double totalPrice = 0;
			if(tbOrderDetail.getTotalprice()!=null&&!"".equals(tbOrderDetail.getTotalprice().trim())){
				String rs = commonUtil.numberFormat(tbOrderDetail.getTotalprice(), 4, true);
				totalPrice = Double.parseDouble(rs);
				System.out.println("******"+totalPrice);
			}
			if(null != tbOrderDetail.getNumber() && !"".equals(tbOrderDetail.getNumber())) {
				if(0 < tbOrderDetail.getNumber().indexOf(",")) {
					String[] ends = tbOrderDetail.getNumber().split(",");
					tbOrderDetail.setNumber(ends[0]);
				}
			}
			sum+=totalPrice;
		}
		System.out.println(""+sum);
		tbOrder.setTotalPrice(""+sum);
	    this.saveOrUpdate(tbOrder);
		
		
		//===================================================================================
		//获取参数
		Object id0 = tbOrder.getId();
		//===================================================================================
		String hql0 = "from TbOrderDetailEntity where 1 = 1 AND tbOrder = ? ";
	    List<TbOrderDetailEntity> tbOrderDetailOldList = this.findHql(hql0,tbOrder);
	    
		//this.deleteAllEntitie(tbOrderDetailOldList);
	    
//	    for(TbOrderDetailEntity tbOrderDetail:tbOrderDetailOldList){
//	    	String hql1 = "from TbPurchaseEntity where 1 = 1 AND tbOrderDetail = ? ";
//		    List<TbPurchaseEntity> tbPurchaseList = this.findHql(hql1,tbOrderDetail);
//	    	//tbOrderDetail.setTbOrder(null);
//		    this.deleteAllEntitie(tbPurchaseList);
//	    }
//	    this.deleteAllEntitie(tbOrderDetailOldList);
		
		HashMap newMap = new HashMap<String,TbOrderDetailEntity>();
	    for(TbOrderDetailEntity tbOrderDetail:tbOrderDetailList){
	    	if(null!=tbOrderDetail.getId() && !(tbOrderDetail.getId()).equals("")){
	    		TbOrderDetailEntity t = this.getEntity(TbOrderDetailEntity.class, tbOrderDetail.getId());
	    		t.setName(tbOrderDetail.getName());
	    		t.setNumber(tbOrderDetail.getNumber());
	    		System.out.println("********************: "+tbOrderDetail.getNumber());
	    		t.setPrice(tbOrderDetail.getPrice());
	    		t.setTotalprice(tbOrderDetail.getTotalprice());
	    		t.setType(tbOrderDetail.getType());
				this.updateEntitie(t);
	    		newMap.put(tbOrderDetail.getId(), tbOrderDetail);
	    		
	    	}else{
	    		tbOrderDetail.setStatus(BusinessUtil.TO_PURCHASE);
	    		tbOrderDetail.setTbOrder(tbOrder);
				this.save(tbOrderDetail);
	    	}
	    }
	    
	    
	    for(TbOrderDetailEntity tbOrderDetailOld:tbOrderDetailOldList){
	    	TbOrderDetailEntity tmp = (TbOrderDetailEntity) newMap.get(tbOrderDetailOld.getId());
	    	if(tmp==null){
	    		this.delete(tbOrderDetailOld);
	    	}
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
			TbOrderEntity tbOrder, String kxOrderNo,String projectName,String contractNo,String client,String principal,String status,String totalPrice) {
		//条件拼接，根据登陆不同的角色，看到的订单不同
				StringBuffer whereSql = new StringBuffer();
				
				if(null != kxOrderNo && !"".equals(kxOrderNo)){
					whereSql.append(" and a.kx_order_no like '%"+kxOrderNo+"%' ");
				}
				
				if(null != projectName && !"".equals(projectName)) {
					whereSql.append(" and a.project_name like '%"+projectName+"%' ");
				}
				
				if(null != contractNo&& !"".equals(contractNo) ){
					whereSql.append(" and a.contract_no like '%"+contractNo+"%' ");
				}
				
				if(null != client&& !"".equals(client) ){
					whereSql.append(" and a.client like '%"+client+"%' ");
				}
				
				if(null != principal&& !"".equals(principal) ){
					whereSql.append(" and a.principal like '%"+principal+"%' ");
				}
				if(null != status&& !"".equals(status) ){
					whereSql.append(" and b.status like '%"+status+"%' ");
				}
				if(null != totalPrice&& !"".equals(totalPrice) ){
					whereSql.append(" and a.total_price like '%"+totalPrice+"%' ");
				}
			
				//if((null == kxOrderNo && ("").equals(kxOrderNo))&&(null == projectName && ("").equals(projectName))&&(null == contractNo && ("").equals(contractNo))&&(null == client && ("").equals(client))&&(null == principal && ("").equals(principal))){
					whereSql.append(" group by a.id order by create_time desc");
				//}
				//主干sql
				StringBuffer hql = new StringBuffer();
				hql.append(" select a.id,a.kx_order_no,a.project_name,a.client,a.final_client," +
						"a.payment,a.principal,a.total_price,a.create_time,a.remark ,a.contract_id");
				hql.append("  ,sum(b.status='"+BusinessUtil.TO_PURCHASE+"') as aa,sum(b.status='"+BusinessUtil.PURCHASE_ING+"') as bb, sum(b.status='"+BusinessUtil.END_PURCHASE+"') as cc");
				hql.append(" from tb_order a left join tb_order_detail b on a.id=b.order_id  where 1=1");
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
				List<TbOrderEntityVo> volist = new ArrayList<TbOrderEntityVo>();
				for (int i = 0; i < list.size(); i++) {
					Object[]  obj = (Object[]) list.get(i);
					TbOrderEntityVo vo = new TbOrderEntityVo();
					SimpleDateFormat a=new SimpleDateFormat("yyyy-MM-dd");
					
					try {
						if(obj[8]!=null){
							Date d1 = a.parse(obj[8].toString());
							vo.setCreateTime(d1);
						}
						
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					vo.setId(""+obj[0]);
					vo.setKxOrderNo(""+obj[1]);
					vo.setProjectName(""+obj[2]);
					vo.setClient(""+obj[3]);
					vo.setFinalClient(""+obj[4]);
					vo.setPayment(""+obj[5]);
					vo.setPrincipal(""+obj[6]);
					
					if((""+obj[7]).equals("null")){
						vo.setTotalPrice("0");
					}else{
						vo.setTotalPrice(""+obj[7]);
					}
					vo.setRemark(""+obj[9]);
					String contractId = ""+obj[10];
					TbContractEntity c =tbContractService.getEntity(TbContractEntity.class, contractId);
					vo.setTbContract(c);
					vo.setPurchaseNumTo(""+obj[11]);
					vo.setPurchaseNumIng(""+obj[12]);
					vo.setPurchaseNumEnd(""+obj[13]);
					volist.add(vo);
				}
				return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}
	
	
}