package jeecg.kxcomm.service.impl.contactm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jeecg.kxcomm.service.contactm.TbContractServiceI;

import org.hibernate.SQLQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.hibernate.qbc.PagerUtil;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.entity.hrm.TbCheckingInstanceEntity;
import jeecg.kxcomm.entity.hrm.TbEmployeeEntity;
import jeecg.kxcomm.entity.hrm.TbOrgenEntity;
@Service("tbContractService")
@Transactional
public class TbContractServiceImpl extends CommonServiceImpl implements TbContractServiceI {

	@Override
	public void addMain(TbContractEntity tbContract,
	        List<TbOrderEntity> tbOrderList){
//			//保存主信息
//			this.save(tbContract);
//		
//			/**保存-销售订单*/
//			for(TbOrderEntity tbOrder:tbOrderList){
//				//外键设置
//				tbOrder.setContractId(tbContract.getId());
//				this.save(tbOrder);
//			}
		//保存主信息
		this.save(tbContract);

		/**保存-销售订单*/
		for(TbOrderEntity tbOrder:tbOrderList){
			System.out.println(tbOrder.getId());
			String hql = "from TbOrderEntity where 1 = 1 AND kxOrderNo = ?  and  finalClient=?";
			List<TbOrderEntity> t = this.findHql(hql,tbOrder.getKxOrderNo(),tbOrder.getFinalClient());
			if(t.size()>0){
				//t.get(0).setContractId(tbContract.getId());
				t.get(0).setTbContract(tbContract);
				this.updateEntitie(t.get(0));
			}
		}
	}

	@Override
	public void updateMain(TbContractEntity tbContract, List<TbOrderEntity> tbOrderList) {
		//保存订单主信息
		this.saveOrUpdate(tbContract);
		
		
		//===================================================================================
		//获取参数
		Object id0 = tbContract.getId();
		//===================================================================================
		//删除-销售订单
	    String hql0 = "from TbOrderEntity where 1 = 1 AND tbContract = ? ";
	    List<TbOrderEntity> tbOrderOldList = this.findHql(hql0,tbContract);
	    for(TbOrderEntity tbOrder:tbOrderOldList){
	    	//tbOrder.setContractId(null);
	    	tbOrder.setTbContract(null);
	    }
		//this.deleteAllEntitie(tbOrderOldList);
		//保存-销售订单
		for(TbOrderEntity tbOrder:tbOrderList){
			String hql = "from TbOrderEntity where 1 = 1 AND kxOrderNo = ? ";
			List<TbOrderEntity> t = this.findHql(hql,tbOrder.getKxOrderNo());
		
			//t.get(0).setContractId(tbContract.getId());
			t.get(0).setTbContract(tbContract);
			this.updateEntitie(t.get(0));
		}
		
	}

	@Override
	public void delMain(TbContractEntity tbContract) {
		//===================================================================================
		//获取参数
		Object id0 = tbContract.getId();
		//===================================================================================
		//删除-销售订单
	    String hql0 = "from TbOrderEntity where 1 = 1 AND tbContract = ? ";
	    List<TbOrderEntity> tbOrderOldList = this.findHql(hql0,tbContract);
		//this.deleteAllEntitie(tbOrderOldList);
	    for(TbOrderEntity tbOrder:tbOrderOldList){
	    	tbOrder.setTbContract(null);
	    }
	  //删除主表信息
	  	this.delete(tbContract);
	}

	@Override
	public PageList getPageList(HqlQuery hqlQuery, boolean b,
			TbContractEntity tbContract, String contractNo) {
		StringBuffer whereSql = new StringBuffer();
		
		if(null != contractNo   && !"".equals(contractNo)  ){
			whereSql.append(" and a.contract_no like '%"+contractNo+"%' ");
		}
		
		//主干sql
		StringBuffer hql = new StringBuffer();
		hql.append(" select a.id,a.contract_no,a.contract_price,a.billing_date,a.daohuo_payment_date," +
				"a.chuyan_payment_date,a.zhongyan_payment_date,a.contract_filing_date,a.contract_signing_date,a.remark ");
		hql.append(" from tb_contract a where 1=1 ");
		hql.append(whereSql.toString());
		
		hqlQuery.setQueryString(hql.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("1", 1);
		hqlQuery.setMap(map);
		hqlQuery.setClass1(TbContractEntity.class);
		
		SQLQuery query = getSession().createSQLQuery(hqlQuery.getQueryString());
		int allCounts = query.list().size();
		int curPageNO = hqlQuery.getCurPage();
		int offset = PagerUtil.getOffset(allCounts, curPageNO, hqlQuery.getPageSize());
		query.setFirstResult(offset);
		query.setMaxResults(hqlQuery.getPageSize());
	 	List list= query.list();
		List<TbContractEntity> volist = new ArrayList<TbContractEntity>();
		Object[]  obj = new Object[volist.size()];
		for (int i = 0; i < list.size(); i++) {
			obj = (Object[]) list.get(i);
			TbContractEntity vo = new TbContractEntity();
			vo.setId(""+obj[0]);
			vo.setContractNo(""+obj[1]);
			vo.setContractPrice(""+obj[2]);
			SimpleDateFormat a=new SimpleDateFormat("yyyy-MM-dd");
			
			try {
				Date d1 = null;
				Date d2 = null;
				Date d3 = null;
				Date d4 = null;
				Date d5 = null;
				Date d6 = null;
				if(obj[3]!=null){
					 d1 = a.parse(""+obj[3]);
				}
				if(obj[4]!=null){
					 d2=a.parse(""+obj[4]);
				}
				if(obj[5]!=null){
					 d3=a.parse(""+obj[5]);
				}
				if(obj[6]!=null){
					 d4=a.parse(""+obj[6]);
				}
				
				if(obj[7]!=null){
					 d5=a.parse(""+obj[7]);
				}
				if(obj[8]!=null){
					 d6=a.parse(""+obj[8]);
				}
				vo.setBillingDate(d1);
				vo.setDaohuoPaymentDate(d2);
				vo.setChuyanPaymentDate(d3);
				vo.setZhongyanPaymentDate(d4);
				vo.setContractFilingDate(d5);
				vo.setContractSigningDate(d6);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			vo.setRemark(""+obj[9]);
			volist.add(vo);
		}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}

	
}