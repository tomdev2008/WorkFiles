package jeecg.kxcomm.service.impl.contactm;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.contactm.TbOrderDetailEntity;
import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.service.contactm.TbOrderDetailServiceI;
import jeecg.kxcomm.vo.contactm.TbOrderDetailVo;

import org.hibernate.SQLQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.hibernate.qbc.PagerUtil;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbOrderDetailCopyService")
@Transactional
public class TbOrderDetailServiceImpl extends CommonServiceImpl implements TbOrderDetailServiceI {

	@Override
	public PageList getPageList(HqlQuery hqlQuery, boolean b,TbOrderDetailEntity tbOrderDetail, String kxOrderNo) {
		StringBuffer whereSql = new StringBuffer();
		
		if(null != kxOrderNo && !("").equals(kxOrderNo)) {
			whereSql.append(" and a.kx_order_no like '%"+kxOrderNo+"%' ");
		}
		whereSql.append(" group by b.id order by a.create_time desc");
		//------------------
		StringBuffer hql = new StringBuffer();
		hql.append(" select b.id,b.name,b.type,b.price,b.number," +
				"a.kx_order_no,a.final_client,a.create_time,sum(c.total_price) as totalPrice,a.project_name,a.client,a.principal,a.remark");
		hql.append(" from tb_order_detail b left join tb_purchase c on b.id=c.order_detail_id left join tb_order a on a.id=b.order_id where b.order_id is not null");
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
				vo.setSum("0.0");
			}else{
				vo.setSum(""+obj[8]);
			}
			//a.project_name,a.client,a.principal,a.remark
			vo.setProjectName(""+obj[9]);
			vo.setClient(""+obj[10]);
			vo.setPrincipal(""+obj[11]);
			vo.setRemark(""+obj[12]);
			volist.add(vo);
		}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}
	
}