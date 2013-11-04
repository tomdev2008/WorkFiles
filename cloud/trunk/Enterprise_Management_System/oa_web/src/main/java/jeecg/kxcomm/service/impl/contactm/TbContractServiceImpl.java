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
import jeecg.kxcomm.vo.contactm.ConfigVo;
import jeecg.kxcomm.vo.contactm.ContractDocVo;
import jeecg.kxcomm.vo.contactm.TbContractVo;
import jeecg.kxcomm.vo.contactm.TbQuotationsVo;

import org.hibernate.SQLQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.hibernate.qbc.PagerUtil;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.StringUtil;

import jeecg.kxcomm.entity.contactm.TbConfigModelsEntity;
import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.contactm.TbContractQuotationsEntity;
import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.entity.contactm.TbQuotationsDataEntity;
import jeecg.kxcomm.entity.contactm.TbQuotationsEntity;
import jeecg.kxcomm.entity.hrm.TbCheckingInstanceEntity;
import jeecg.kxcomm.entity.hrm.TbEmployeeEntity;
import jeecg.kxcomm.entity.hrm.TbOrgenEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractDocEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractDocTypeEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractDocVariableEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocVariableEntity;
import jeecg.kxcomm.entity.systemmanager.TbDataSourceEntityEntity;
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
		hql.append(" SELECT SUM(b.receive_money) as bsum,tt.ct,tt.aname,tt.cname,tt.adata,tt.ano,tt.anumber,tt.aremark,tt.aid,tt.astatus,tt.uname,tt.contractType "); 
		hql.append(" FROM (SELECT a.contract_no ano,a.contract_number anumber,a.contract_date adata,a.remark aremark,"+
				"a.contract_total_price ct,a.id aid,a.contract_name aname,c.company_name cname,a.status astatus,base.realname uname,a.contact_type contractType");
		hql.append(" FROM tb_contract a,tb_project p,tb_customer c,t_s_user u,t_s_base_user base ");
		hql.append(" WHERE a.creator_id=u.id AND a.project_id=p.project_id AND p.customer=c.customer_id and u.id=base.id");
		hql.append(whereSql.toString());
		hql.append(")tt ");
		hql.append(" LEFT JOIN tb_contract_receive_money b ON tt.aid=b.contract_id GROUP BY tt.aid");
		
		
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
			vo.setStruts(obj[9]==null?"":""+obj[9]);
			vo.setResponsible(obj[10]==null?"":""+obj[10]);
			vo.setContractType(obj[11]==null?"":""+obj[11]);
			double a=0.0;
			if(obj[1]!=null){
			    a=java.lang.Double.parseDouble(""+obj[1]);
					}
			double c=0.0;
			if(obj[0]!=null){
			  c=java.lang.Double.parseDouble(""+obj[0]);
			}
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
		
		//主干sql
/*		StringBuffer hql = new StringBuffer();
		hql.append(" select t1.quotations_id tqid,t3.title ttitle,sum(t2.after_discount_now_price*t1.quantity) as after_discount_now_price,sum(t2.after_discount_price*t1.quantity) as after_discount_price,"+
				"sum(t2.catalog_total_price*t1.quantity) as catalog_total_price,sum(t2.total_price*t1.quantity) as total_price,t3.create_time ttime ");
		hql.append(" from tb_quotations_data t1,tb_config_models t2,tb_quotations t3 ");
		hql.append("  where t1.config_models_id=t2.id AND t3.id=t1.quotations_id AND t3.status=1 ");
		hql.append(" AND t3.id not in (select quotations_id from tb_contract_quotations)");
		hql.append(" group by t1.quotations_id ");
		*/
		StringBuffer hql=new StringBuffer();
		hql.append(" SELECT b.id,b.title,SUM(a.after_discount_now_price),SUM(a.after_discount_price),SUM(a.catalog_total_price),SUM(a.total_price),b.create_time ");
		hql.append(" FROM tb_config_models a,tb_quotations b WHERE a.quotations_id=b.id ");
		hql.append(" AND b.status=1 ");
		hql.append(" AND b.id not in (select quotations_id from tb_contract_quotations) ");
		hql.append(" GROUP BY b.id ");
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
	
	/**
	 * 获取报价表
	 */
	@Override
	public PageList getQuotationsEditList(HqlQuery hqlQuery, boolean b,
			TbQuotationsVo quotationsVo,String contractId) {
		StringBuffer hql=new StringBuffer();
		hql.append(" SELECT b.id,b.title,SUM(a.after_discount_now_price),SUM(a.after_discount_price),SUM(a.catalog_total_price),SUM(a.total_price),b.create_time ");
		hql.append(" FROM tb_config_models a,tb_quotations b WHERE a.quotations_id=b.id ");
		hql.append(" AND b.status=1 ");
		hql.append(" AND b.id not in (select quotations_id from tb_contract_quotations) ");
		hql.append(" GROUP BY b.id ");
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
		StringBuffer sb=new StringBuffer();
		sb.append(" SELECT tt.bid,tt.btitle,SUM(c.after_discount_now_price) nowPrice,SUM(c.after_discount_price) afterPrice,SUM(c.catalog_total_price) catPrice,SUM(c.total_price) totalPrice,tt.btime ");
		sb.append(" from (SELECT a.id aid,cq.id cqid,b.title btitle,b.create_time btime,b.id bid ");
		sb.append(" FROM tb_contract_quotations cq,tb_contract a,tb_quotations b ");
		sb.append(" WHERE cq.contract_id=a.id AND cq.quotations_id=b.id) tt ");
		sb.append(" LEFT JOIN tb_config_models c ON c.quotations_id=tt.bid ");
		sb.append(" WHERE tt.aid=?");
		sb.append(" GROUP BY tt.bid ");
		List<Map<String, Object>> list2=this.findForJdbc(sb.toString(), contractId);
		for (int i = 0; i < list2.size(); i++) {
			Map<String, Object> mtt = list2.get(i);
			TbQuotationsVo vo = new TbQuotationsVo();
			     vo.setId((String)mtt.get("bid")+"");
			     vo.setQuotationName(mtt.get("btitle")+"");
			     vo.setNowPrice(mtt.get("nowPrice")==null?"0.0":""+mtt.get("nowPrice"));
			     vo.setAfterPrice(mtt.get("afterPrice")==null?"0.0":""+mtt.get("afterPrice"));
			     vo.setCatalogTotalPrice(mtt.get("catPrice")==null?"0.0":""+mtt.get("catPrice"));
			     vo.setTotalPrice(mtt.get("totalPrice")==null?"0.0":""+mtt.get("totalPrice"));
			     vo.setCreateTime(mtt.get("btime")+"");
			     vo.setDownUrl("yes");
				 volist.add(vo);
		}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}
	
	/**
	 * 分页查看用户选中的报价表
	 */
	@Override
	public PageList getQuoList(HqlQuery hqlQuery, boolean b,
			TbQuotationsVo quotationsVo,String contractId) 
	{
		List<TbQuotationsVo> volist = new ArrayList<TbQuotationsVo>();
		StringBuffer sb=new StringBuffer();
		sb.append(" SELECT tt.bid,tt.btitle,SUM(c.after_discount_now_price) nowPrice,SUM(c.after_discount_price) afterPrice,SUM(c.catalog_total_price) catPrice,SUM(c.total_price) totalPrice,tt.btime,tt.cqid ");
		sb.append(" from (SELECT a.id aid,cq.id cqid,b.title btitle,b.create_time btime,b.id bid ");
		sb.append(" FROM tb_contract_quotations cq,tb_contract a,tb_quotations b ");
		sb.append(" WHERE cq.contract_id=a.id AND cq.quotations_id=b.id) tt ");
		sb.append(" LEFT JOIN tb_config_models c ON c.quotations_id=tt.bid ");
		if(null != contractId && !("").equals(contractId)) {
			sb.append(" WHERE tt.aid= '"+contractId+"' ");
		}
		sb.append(" GROUP BY tt.bid ");
		hqlQuery.setQueryString(sb.toString());
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
		Object[]  obj = new Object[volist.size()];
		for (int i = 0; i < list.size(); i++) {
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

	 /**
	  * 查询用户已选中报价表
	  */
	@Override
	public List<TbQuotationsVo> geTbQuotationsVos(String contractId)
	{
		List<TbQuotationsVo> volist = new ArrayList<TbQuotationsVo>();
		StringBuffer sb=new StringBuffer();
		sb.append(" SELECT tt.bid,tt.btitle,SUM(c.after_discount_now_price) nowPrice,SUM(c.after_discount_price) afterPrice,SUM(c.catalog_total_price) catPrice,SUM(c.total_price) totalPrice,tt.btime,tt.cqid ");
		sb.append(" from (SELECT a.id aid,cq.id cqid,b.title btitle,b.create_time btime,b.id bid ");
		sb.append(" FROM tb_contract_quotations cq,tb_contract a,tb_quotations b ");
		sb.append(" WHERE cq.contract_id=a.id AND cq.quotations_id=b.id) tt ");
		sb.append(" LEFT JOIN tb_config_models c ON c.quotations_id=tt.bid ");
		sb.append(" WHERE tt.aid=?");
		sb.append(" GROUP BY tt.bid ");
		List<Map<String, Object>> list2=this.findForJdbc(sb.toString(), contractId);
		for (int i = 0; i < list2.size(); i++) {
			Map<String, Object> mtt = list2.get(i);
			TbQuotationsVo vo = new TbQuotationsVo();
			     vo.setId((String)mtt.get("bid")+"");
			     vo.setQuotationName(mtt.get("btitle")+"");
			     vo.setNowPrice(mtt.get("nowPrice")+"");
			     vo.setAfterPrice(mtt.get("afterPrice")+"");
			     vo.setCatalogTotalPrice(mtt.get("catPrice")+"");
			     vo.setTotalPrice(mtt.get("totalPrice")+"");
			     vo.setCreateTime(mtt.get("btime")+"");
			     vo.setCqId(mtt.get("cqid")+"");
				 volist.add(vo);
		}
		return volist;
	}

	/**
	 * 根据报价表id查询下面的机型配置
	 */
/*	@Override
	public List<TbConfigModelsEntity> getConfigByQuoList(
			String quoId) {
		List<TbConfigModelsEntity> list=new ArrayList<TbConfigModelsEntity>();
		String hql=" from TbConfigModelsEntity t where t.tbQuotations.id=?";
		if(quoId!=null)
		{
		 list=this.findHql(hql, quoId);
		}
		return list;
	}*/
	
	/**
	 * 根据报价表id查询下面的机型配置
	 */
	@Override
	public List<ConfigVo> getConfigByQuoList(String quoId) {
		List<ConfigVo> list=new ArrayList<ConfigVo>();
		StringBuffer sb=new StringBuffer();
		sb.append(" SELECT tt.cid,tt.cto,tt.qid,tt.cname,tt.stname,a.quantity,a.id,a.project_name,a.ordered ");
		sb.append(" FROM (SELECT c.id cid,c.total_price cto,q.id qid,c.name cname,tp.sourcetypename stname FROM tb_config_models c ,tb_quotations q ,tb_data_source_type tp ");
		sb.append(" WHERE c.quotations_id=q.id AND q.id=? AND tp.type_id = c.type)tt ");
		sb.append(" LEFT JOIN tb_quotations_data a ON tt.qid=a.quotations_id AND a.config_models_id=tt.cid ");
		sb.append(" GROUP BY tt.cid ");
		if(quoId!=null)
		{
		 List<Map<String, Object>> list2=this.findForJdbc(sb.toString(), quoId);
		 for(int i=0;i<list2.size();i++)
		 {
			 ConfigVo coVo=new ConfigVo();
			 Map<String, Object> map=list2.get(i);
			  coVo.setId(map.get("cid")+"");
			  coVo.setQuoId(map.get("qid")+"");
			 coVo.setTotalPrice(map.get("cto")==null?"0.0":map.get("cto")+"");
			 coVo.setQuoName(map.get("cname")==null?"":map.get("cname")+"");
			 coVo.setQuoDataId(map.get("id")==null?"":map.get("id")+"");
			 coVo.setShuliang(map.get("quantity")==null?"1":map.get("quantity")+"");
			 coVo.setProjectName(map.get("project_name")==null?"":map.get("project_name")+"");
			 coVo.setOrdered(map.get("ordered")==null?"0":map.get("ordered")+"");
			 coVo.setQuotationsName(map.get("qtitle")==null?"":map.get("qtitle")+"");
			 double a=java.lang.Double.parseDouble(map.get("cto")==null?"0.0":map.get("cto")+"");
			 int b=Integer.parseInt(map.get("quantity")==null?"1":map.get("quantity")+"");
			 coVo.setTypename(map.get("stname")==null?"":map.get("stname")+"");
			 coVo.setQuoTotalPrice(a*b+"");
	 	list.add(coVo);	 
		 }
		}
		return list;
	}
	/**
	 * 分页查询报价总表
	 */
	@Override
	public PageList getQuoDataList(HqlQuery hqlQuery, boolean b,
			ConfigVo configVo,String contractId) 
	{
		List<ConfigVo> volist = new ArrayList<ConfigVo>();
		String hql=" from TbContractQuotationsEntity tb where tb.contractId.id=? ";
		List<TbContractQuotationsEntity> list=this.findHql(hql, contractId);
		int offset=0;
		int curPageNO=0;
		int allCounts=0;
		for(TbContractQuotationsEntity contractQuotationsEntity:list)
		{
			String quoId=contractQuotationsEntity.getQuotationsId().getId();
			StringBuffer sb=new StringBuffer();
			sb.append(" SELECT tt.cid,tt.cto,tt.qid,tt.cname,a.quantity,a.id,a.project_name,tt.qtitle ");
			sb.append(" FROM (SELECT c.id cid,c.total_price cto,q.id qid,c.name cname,q.title qtitle FROM tb_config_models c ,tb_quotations q ");
			sb.append(" WHERE 1=1 ");
			if(null != quoId && !("").equals(quoId)) {
				sb.append(" AND q.id='"+quoId+"' ");
			}
			sb.append(" and c.quotations_id=q.id)tt ");
			sb.append(" LEFT JOIN tb_quotations_data a ON tt.qid=a.quotations_id AND a.config_models_id=tt.cid ");
			sb.append(" GROUP BY tt.cid ");
			hqlQuery.setQueryString(sb.toString());
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("1", 1);
			hqlQuery.setMap(map);
			hqlQuery.setClass1(TbQuotationsVo.class);
			
			SQLQuery query = getSession().createSQLQuery(hqlQuery.getQueryString());
			allCounts = query.list().size();
			curPageNO = hqlQuery.getCurPage();
			 offset = PagerUtil.getOffset(allCounts, curPageNO, hqlQuery.getPageSize());
			query.setFirstResult(offset);
			query.setMaxResults(hqlQuery.getPageSize());
		 	List list2= query.list();
			Object[]  obj = new Object[volist.size()];
			for (int i = 0; i < list2.size(); i++) {
				obj = (Object[]) list2.get(i);
				ConfigVo vo=new ConfigVo();
				 vo.setId(obj[0]==null?"":""+obj[0]);
				 vo.setTotalPrice(obj[1]==null?"0.0":""+obj[1]);
				 vo.setQuoId(obj[2]==null?"":""+obj[2]);
				 vo.setQuoName(obj[3]==null?"":""+obj[3]);
				 vo.setShuliang(obj[4]==null?"1":""+obj[4]);
				 vo.setQuoId(obj[5]==null?"":""+obj[5]);
				 vo.setProjectName(obj[6]==null?"":""+obj[6]);
				 vo.setQuotationsName(obj[7]==null?"":""+obj[7]);
				 double price=java.lang.Double.parseDouble(obj[1]==null?"0.0":""+obj[1]);
				 int shuliang=Integer.parseInt(obj[4]==null?"1":""+obj[4]);
				 double total=price*shuliang;
				 vo.setQuoTotalPrice(total+"");
				 volist.add(vo);
			}
		}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}
	/**
	 * 删除合同
	 */
	@Override
	public void delContract(String contractId)
	{
		//删除合同与报价表的关系
		String hql="from TbContractQuotationsEntity tb where tb.contractId.id=?";
		List<TbContractQuotationsEntity> list=this.findHql(hql, contractId);
		for(TbContractQuotationsEntity contractQuotationsEntity:list)
		{
			//删除报价总表
		    String quoId=contractQuotationsEntity.getQuotationsId().getId();
		    String hqlString=" from TbQuotationsDataEntity tb where tb.tbQuotations.id=? ";
		    List<TbQuotationsDataEntity> list2=this.findHql(hqlString, quoId);
		    for(TbQuotationsDataEntity quotationsDataEntity:list2)
		    {
		    	this.delete(quotationsDataEntity);
		    }
			this.delete(contractQuotationsEntity);
		}
		//删除合同文件
		String hql2=" from TbContractDocEntity tb where tb.contractId.id=? ";
		List<TbContractDocEntity> list3=this.findHql(hql2, contractId);
		for(TbContractDocEntity contractDocEntity:list3)
		{
			//删除合同文件变量
			String id=contractDocEntity.getId();
			String hql3=" from TbContractDocVariableEntity tb where tb.docId.id=?";
		 List<TbContractDocVariableEntity> list4=this.findHql(hql3, id);
			for(TbContractDocVariableEntity contractDocVariableEntity:list4)
			{
				this.delete(contractDocVariableEntity);
			}
			this.delete(contractDocEntity);
		}
	   TbContractEntity contractEntity=this.getEntity(TbContractEntity.class, contractId);
	   this.delete(contractEntity);
	}
	
	/**
	 * 分页查询合同文件
	 */
	@Override
	public PageList getContractDocList(HqlQuery hqlQuery, boolean b,String contractId) 
	{
		
	List<ContractDocVo> volist=new ArrayList<ContractDocVo>();
		StringBuffer sb=new StringBuffer();
		sb.append(" SELECT t.doc_id,d.docName,t.createtime,d.bVariable,d.docType,c.typename,d.id,c.docType_id   ");
		sb.append(" from tb_contract_doc t,tb_contract_templates_doc d,tb_contract_doc_type c  ");
        sb.append(" WHERE c.docType_id=d.docType AND t.templatesDoc_id=d.id ");
		if(null != contractId && !("").equals(contractId)) {
			sb.append(" AND t.contract_id='"+contractId+"' ");
		}
		hqlQuery.setQueryString(sb.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("1", 1);
		hqlQuery.setMap(map);
		hqlQuery.setClass1(TbQuotationsVo.class);
		
		SQLQuery query = getSession().createSQLQuery(hqlQuery.getQueryString());
		int allCounts = query.list().size();
		int  curPageNO = hqlQuery.getCurPage();
		int  offset = PagerUtil.getOffset(allCounts, curPageNO, hqlQuery.getPageSize());
		query.setFirstResult(offset);
		query.setMaxResults(hqlQuery.getPageSize());
	 	List list2= query.list();
		Object[]  obj = new Object[volist.size()];
		for (int i = 0; i < list2.size(); i++) {
			obj = (Object[]) list2.get(i);
			ContractDocVo vo=new ContractDocVo();
			vo.setId(obj[0]==null?"":obj[0]+"");
			vo.setFileName(obj[1]==null?"":obj[1]+"");
			vo.setCreateTime(obj[2]==null?"":obj[2]+"");
			vo.setIsB(obj[3]==null?"":obj[3]+"");
			vo.setFileType(obj[5]==null?"":obj[5]+"");
			volist.add(vo);
	}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}

	/**
	 * 根据合同ID查询合同和报价表的关系（临时合同转正式）
	 * @param contractId
	 * @return
	 */
	@Override
	public List<TbContractQuotationsEntity> getContractQuotationsList(String contractId)
	{
		String hql=" from TbContractQuotationsEntity tb where tb.contractId.id=?";
		List<TbContractQuotationsEntity> list=new ArrayList<TbContractQuotationsEntity>();
		if(StringUtil.isNotEmpty(contractId))
		{
		 list=this.findHql(hql, contractId);
		}
		return list;
	}
}