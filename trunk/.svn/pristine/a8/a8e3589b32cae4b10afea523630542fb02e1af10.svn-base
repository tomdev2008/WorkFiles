package jeecg.kxcomm.service.impl.contactm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jeecg.kxcomm.entity.contactm.TbOrderDetailEntity;
import jeecg.kxcomm.service.contactm.TbOrderDetailServiceI;
import jeecg.kxcomm.vo.contactm.TbOrderDetailVo;

import org.hibernate.SQLQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.hibernate.qbc.PagerUtil;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("tbOrderDetailCopyService")
@Transactional
public class TbOrderDetailServiceImpl extends CommonServiceImpl implements TbOrderDetailServiceI {

	@Override
	public PageList getPageList(HqlQuery hqlQuery, boolean b,TbOrderDetailEntity tbOrderDetail, String kxOrderNo,String projectName ,String client ,String finalClient ,String principal ,String name,String type ,String supplier ,String saleContractNo ,String purchaser ) {
		StringBuffer whereSql = new StringBuffer();
		
		if(null != kxOrderNo  && "".equals(kxOrderNo)  ) {
			whereSql.append(" and  a.kx_order_no is null or trim(a.kx_order_no) = '' ");
		}else if(null != kxOrderNo){
			whereSql.append(" and a.kx_order_no like '%"+kxOrderNo+"%' ");
		}
		
		if(null != projectName  && "".equals(projectName)  ) {
			whereSql.append(" and  a.project_name is null or trim(a.project_name) = '' ");
		}else if(null != projectName){
			whereSql.append(" and a.project_name like '%"+projectName+"%' ");
		}
		
		if(null != client  && "".equals(client)  ) {
			whereSql.append(" and  a.client is null or trim(a.client) = '' ");
		}else if(null != client){
			whereSql.append(" and a.client like '%"+client+"%' ");
		}
		
		if(null != finalClient  && "".equals(finalClient)  ) {
			whereSql.append(" and  a.final_client is null or trim(a.final_client) = '' ");
		}else if(null != finalClient){
			whereSql.append(" and a.final_client like '%"+finalClient+"%' ");
		}
	
		if(null != principal  && "".equals(principal)  ) {
			whereSql.append(" and  a.principal is null or trim(a.principal) = '' ");
		}else if(null != principal){
			whereSql.append(" and a.principal like '%"+principal+"%' ");
		}
		
		if(null != name  && "".equals(name)  ) {
			whereSql.append(" and  b.name is null or trim(b.name) = ''  or  c.product_name is null or trim( c.product_name) = '' ");
		}else if(null != name){
			whereSql.append(" and b.name like '%"+name+"%'  or c.product_name like '%"+name+"%'  ");
		}
		
		if(null != type  && "".equals(type)  ) {
			whereSql.append(" and  b.type is null or trim(b.type) = ''  or  c.model is null or trim(c.model) = ''  ");
		}else if(null != type){
			whereSql.append(" and b.type like '%"+type+"%' or c.model like '%"+type+"%'");
		}
		
		if(null != supplier  && "".equals(supplier)  ) {
			whereSql.append(" and  c.supplier is null or trim(c.supplier) = '' ");
		}else if(null != supplier){
			whereSql.append(" and c.supplier like '%"+supplier+"%' ");
		}
		
		if(null != purchaser  && "".equals(purchaser)  ) {
			whereSql.append(" and  c.purchaser is null or trim(c.purchaser) = '' ");
		}else if(null != purchaser){
			whereSql.append(" and c.purchaser like '%"+purchaser+"%' ");
		}
		
		if(null != saleContractNo  && "".equals(saleContractNo)  ) {
			whereSql.append(" and  a.contract_no is null or trim(a.contract_no) = '' ");
		}else if(null != saleContractNo){
			whereSql.append(" and a.contract_no like '%"+saleContractNo+"%' ");
		}
		
		whereSql.append(" group by b.id order by a.create_time desc");
		//------------------
		StringBuffer hql = new StringBuffer();
		hql.append(" select b.id,b.name,b.type,b.price,b.number," +
				"a.kx_order_no,a.final_client,a.create_time,b.purchase_price,a.project_name,a.client,a.principal,a.remark,b.status");
		hql.append(" from tb_order_detail b left join tb_purchase c on b.id=c.order_detail_id left join tb_order a on a.id=b.order_id where b.order_id is not null ");
		hql.append(whereSql.toString());
		
		hqlQuery.setQueryString(hql.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("1", 1);
		hqlQuery.setMap(map);
		hqlQuery.setClass1(TbOrderDetailVo.class);
		
		SQLQuery query = getSession().createSQLQuery(hqlQuery.getQueryString());
		int allCounts = query.list().size();
		int curPageNO = hqlQuery.getCurPage();
		int offset = PagerUtil.getOffset(allCounts, curPageNO, hqlQuery.getPageSize());
		query.setFirstResult(offset);
		query.setMaxResults(hqlQuery.getPageSize());
	 	List list= query.list();
	 	
		List<TbOrderDetailVo> volist = new ArrayList<TbOrderDetailVo>();
		Object[]  obj = new Object[volist.size()];
		for (int i = 0; i < list.size(); i++) {
			obj = (Object[]) list.get(i);
			TbOrderDetailVo vo = new TbOrderDetailVo();
			vo.setId(""+obj[0]);
			vo.setName(""+obj[1]);
			vo.setNumber(""+obj[4]);
			vo.setType(""+obj[2]);
			vo.setKxOrderNo(""+obj[5]);
			vo.setFinalClient(""+obj[6]);
			
			if((""+obj[8]).equals("null")){
				vo.setSum("0");
			}else{
				vo.setSum(""+obj[8]);
			}
			//a.project_name,a.client,a.principal,a.remark
			vo.setProjectName(""+obj[9]);
			vo.setClient(""+obj[10]);
			vo.setPrincipal(""+obj[11]);
			vo.setRemark(""+obj[12]);
			vo.setStatus(""+obj[13]);
			volist.add(vo);
		}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}
	
}