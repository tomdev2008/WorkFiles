package jeecg.kxcomm.service.impl.systemmanager;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.entity.systemmanager.TbDataRecordEntityEntity;
import jeecg.kxcomm.service.systemmanager.TbDataRecordEntityServiceI;


import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.hibernate.qbc.PagerUtil;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbDataRecordEntityService")
@Transactional
public class TbDataRecordEntityServiceImpl extends CommonServiceImpl implements TbDataRecordEntityServiceI {

	@Override
	public PageList getPageList(HqlQuery hqlQuery, boolean b,
			TbDataRecordEntityEntity tbDataRecordEntity, String dataSourceId,
			String typeId) {
		
		StringBuffer whereSql = new StringBuffer();
		if(null != dataSourceId && !("").equals(dataSourceId)) {
			whereSql.append(" and t.source_id = '"+dataSourceId+"'");
		}
		if(null != typeId && !("").equals(typeId)) {
			whereSql.append(" and t.productType_id ='"+typeId+"'");
		}
		
		//主干sql
		StringBuffer hql = new StringBuffer();
		hql.append(" select t.productorderno,t.productDesc,t.quantity,t.unitPrice,t.discountRate,t.otherRates,t.installServiceCharge,t.firstYear,t.secondYear,t.thirdYear,t.remark ");
		hql.append(" from tb_data_record t  where 1=1");
		hql.append(whereSql.toString());
		
		hqlQuery.setQueryString(hql.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("1", 1);
		hqlQuery.setMap(map);
		hqlQuery.setClass1(TbDataRecordEntityEntity.class);
		
		SQLQuery query = getSession().createSQLQuery(hqlQuery.getQueryString());
		int allCounts = query.list().size();
		int curPageNO = hqlQuery.getCurPage();
		int offset = PagerUtil.getOffset(allCounts, curPageNO, hqlQuery.getPageSize());
		query.setFirstResult(offset);
		query.setMaxResults(hqlQuery.getPageSize());
	 	List list= query.list();
		List<TbDataRecordEntityEntity> volist = new ArrayList<TbDataRecordEntityEntity>();
		Object[]  obj = new Object[volist.size()];
		for (int i = 0; i < list.size(); i++) {
			obj = (Object[]) list.get(i);
			TbDataRecordEntityEntity vo = new TbDataRecordEntityEntity();
			
			vo.setProductorderno(""+obj[0]);
			vo.setProductdesc(""+obj[1]);
			if(!("null".equals(""+obj[2]))){
				vo.setQuantity(Integer.parseInt(""+obj[2]));
			}
			
			vo.setUnitprice(""+obj[3]);
			vo.setDiscountrate(""+obj[4]);
			vo.setOtherrates(""+obj[5]);
			vo.setInstallservicecharge(""+obj[6]);
			vo.setFirstyear(""+obj[7]);
			vo.setSecondyear(""+obj[8]);
			vo.setThirdyear(""+obj[9]);
			
			vo.setRemark(""+obj[10]);
			volist.add(vo);
		}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}

	
}