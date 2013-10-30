package jeecg.kxcomm.service.impl.contactm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.awt.geom.Arc2D.Double;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jeecg.kxcomm.service.contactm.TbContractServiceI;
import jeecg.kxcomm.vo.contactm.TbContractVo;
import jeecg.kxcomm.vo.contactm.TbQuotationsVo;

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

/*	@Override
	public void addMain(TbContractEntity tbContract,
	        List<TbOrderEntity> tbOrderList){*/
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
/*		this.save(tbContract);

		*//**保存-销售订单*//*
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
*/
/*	@Override
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
		
	}*/

/*	@Override
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
	}*/

	@Override
	public PageList getPageList(HqlQuery hqlQuery, boolean b,
			TbContractVo tbContract, String contractNo) {
		StringBuffer whereSql = new StringBuffer();
		
		if(null != contractNo   && !"".equals(contractNo)  ){
			whereSql.append(" and a.contract_no like '%"+contractNo+"%' ");
		}
		
		//主干sql
		StringBuffer hql = new StringBuffer();
		hql.append(" SELECT SUM(b.receive_money) as bsum,tt.ct,tt.aname,tt.cname,tt.adata,tt.ano,tt.anumber,tt.aremark,tt.aid "); 
		hql.append(" FROM (SELECT a.contract_no ano,a.contract_number anumber,a.contract_date adata,a.remark aremark,"+
				"a.contract_total_price ct,a.id aid,a.contract_name aname,c.company_name cname");
		hql.append(" FROM tb_contract a,tb_project p,tb_customer c,t_s_user u ");
		hql.append(" WHERE a.creator_id=u.id AND a.project_id=p.project_id AND p.customer=c.customer_id");
		hql.append(whereSql.toString());
		hql.append(")tt ");
		hql.append(" LEFT JOIN tb_contract_receive_money b ON tt.aid=b.contract_id ");
		
		
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
		List<TbContractVo> volist = new ArrayList<TbContractVo>();
		Object[]  obj = new Object[volist.size()];
		for (int i = 0; i < list.size(); i++) {
			obj = (Object[]) list.get(i);
			TbContractVo vo = new TbContractVo();
			vo.setBackMoney(obj[0]==null?"0.0":""+obj[0]);
			vo.setContractPrice(obj[1]==null?"0.0":""+obj[1]);
			vo.setContractName(obj[2]==null?"":""+obj[2]);
			vo.setCustomer(obj[3]==null?"":""+obj[3]);
			vo.setContractDate(obj[4]==null?"":""+obj[4]);
			vo.setContractNo(obj[5]==null?"":""+obj[5]);
			vo.setContractNumber(obj[6]==null?"":""+obj[6]);
			vo.setRemark(obj[7]==null?"":""+obj[7]);
			vo.setId(obj[8]==null?"":""+obj[8]);
			double a=java.lang.Double.parseDouble(obj[1]==null?"0.0":""+obj[1]);
			double c=java.lang.Double.parseDouble(obj[0]==null?"0.0":""+obj[0]);
			double un=a-c;
			vo.setUnbackMoney(""+un);
			volist.add(vo);
		}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}

	/**
	 * 获取报价表
	 */
	@Override
	public PageList getQuotationsList(HqlQuery hqlQuery, boolean b,
			TbQuotationsVo quotationsVo) {
		StringBuffer whereSql = new StringBuffer();
		
		//主干sql
		StringBuffer hql = new StringBuffer();
		hql.append(" select t1.quotations_id tqid,t3.title ttitle,sum(t2.after_discount_now_price*t1.quantity) as after_discount_now_price,sum(t2.after_discount_price*t1.quantity) as after_discount_price,"+
				"sum(t2.catalog_total_price*t1.quantity) as catalog_total_price,sum(t2.total_price*t1.quantity) as total_price,t3.create_time ttime ");
		hql.append(" from tb_quotations_data t1,tb_config_models t2,tb_quotations t3 ");
		hql.append("  where t1.config_models_id=t2.id AND t3.id=t1.quotations_id AND t3.status=1 ");
		hql.append(" AND t3.id not in (select quotations_id from tb_contract_quotations)");
		hql.append(" group by t1.quotations_id ");
		
		
		hqlQuery.setQueryString(hql.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("1", 1);
		hqlQuery.setMap(map);
		hqlQuery.setClass1(TbQuotationsVo.class);
		
		SQLQuery query = getSession().createSQLQuery(hqlQuery.getQueryString());
		int allCounts = query.list().size();
		int curPageNO = hqlQuery.getCurPage();
		int offset = PagerUtil.getOffset(allCounts, curPageNO, hqlQuery.getPageSize());
		query.setFirstResult(offset);
		query.setMaxResults(hqlQuery.getPageSize());
	 	List list= query.list();
		List<TbQuotationsVo> volist = new ArrayList<TbQuotationsVo>();
		Object[]  obj = new Object[volist.size()];
		for (int i = 0; i < list.size(); i++) {
			NumberFormat nf = NumberFormat.getNumberInstance();
			nf.setMaximumFractionDigits(2);
			obj = (Object[]) list.get(i);
			TbQuotationsVo vo = new TbQuotationsVo();
		     vo.setId(obj[0]==null?"":""+obj[0]);
		     vo.setQuotationName(obj[1]==null?"":""+obj[1]);
		     vo.setNowPrice(obj[2]==null?"0.0":""+obj[2]);
		     vo.setAfterPrice(obj[3]==null?"0.0":""+obj[3]);
		     vo.setCatalogTotalPrice(obj[4]==null?"0.0":""+obj[4]);
		     vo.setTotalPrice(obj[5]==null?"0.0":""+obj[5]);
		     vo.setCreateTime(obj[6]==null?"":""+obj[6]);
			 volist.add(vo);
		}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}

	
}