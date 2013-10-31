package jeecg.kxcomm.service.impl.contactm;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.contactm.TbConfigModelsEntity;
import jeecg.kxcomm.entity.contactm.TbQuotationsEntity;
import jeecg.kxcomm.entity.systemmanager.TbDataRecordEntityEntity;
import jeecg.kxcomm.service.contactm.TbQuotationsServiceI;
import jeecg.kxcomm.util.CommonUtil;
import jeecg.kxcomm.vo.contactm.TbQuotationsVo;
import jeecg.kxcomm.vo.systemmanager.TbDataRecordVo;

import org.hibernate.SQLQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.hibernate.qbc.PagerUtil;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbQuotationsService")
@Transactional
public class TbQuotationsServiceImpl extends CommonServiceImpl implements TbQuotationsServiceI {
	
	@Override
	public PageList getPageList(HqlQuery hqlQuery, boolean b,TbQuotationsEntity tbQuotations) {
		//主干sql
		StringBuffer hql = new StringBuffer();
		hql.append(" select q.id,q.create_time,q.down_url,q.quotation_type,q.status,q.title,q.project_id,q.creator_id," +
						"sum(c.after_discount_now_price),sum(c.after_discount_price),sum(c.catalog_total_price),sum(c.total_price)");
		hql.append(" from tb_quotations q left join tb_config_models c on q.id=c.quotations_id where 1=1 group by q.id order by q.create_time desc");
		
				
		hqlQuery.setQueryString(hql.toString()); 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("1", 1);
		hqlQuery.setMap(map);
		hqlQuery.setClass1(TbQuotationsEntity.class);
				
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
			
			vo.setId(""+obj[0]);
			
			vo.setCreateTime(""+obj[1]);
			vo.setDownUrl(""+obj[2]);
			vo.setQuotationType(""+obj[3]);
			vo.setStatus(""+obj[4]);
			vo.setQuotationName(""+obj[5]);
			vo.setProjectId(""+obj[6]);
			vo.setCreatorId(""+obj[7]);
			if(!("null".equals(""+obj[8]))){
				vo.setNowPrice(CommonUtil.getInstance().numberFormat(""+obj[8], 4, true));
			}
			if(!("null".equals(""+obj[9]))){
				vo.setAfterPrice(CommonUtil.getInstance().numberFormat(""+obj[9], 4, true));
			}
			if(!("null".equals(""+obj[10]))){
				vo.setCatalogTotalPrice(CommonUtil.getInstance().numberFormat(""+obj[10], 4, true));
			}
			if(!("null".equals(""+obj[11]))){
				vo.setTotalPrice(CommonUtil.getInstance().numberFormat(""+obj[11], 4, true));
			}
			
			volist.add(vo);
		}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}
	
	@Override
	public List<List<TbDataRecordVo>> listConfigModelData(List<TbConfigModelsEntity> configModelsList){
		List<List<TbDataRecordVo>> volist = new ArrayList<List<TbDataRecordVo>>();
		for(TbConfigModelsEntity t : configModelsList){
			if(t.getId()==null||"".equals(t.getId())){
				continue;
			}
			List<TbDataRecordVo> datavolist = listConfigModelDataById(t.getId());	
		
			volist.add(datavolist);
		}
		return volist;
	}
	
	@Override
	public List<TbDataRecordVo> listConfigModelDataById(String id) {
		StringBuffer whereSql = new StringBuffer();
		if(null != id && !("").equals(id)) {
			whereSql.append(" and tt.config_id = '"+id+"'");
		}
		
		StringBuffer hql = new StringBuffer();
		hql.append(" select t.productorderno,t.productDesc,tt.quantity,t.unitPrice,tt.discountRate,t.otherRates,t.installServiceCharge," +
				"tt.first_year,tt.second_year,tt.third_year,t.remark,t.record_id,t.source_id,t.productType_id,p.productTypeName,tt.catalog_price,"+
				 "tt.discounted_after_price,tt.discounted_price,tt.total_price ");
		hql.append(" from tb_data_record t,tb_product_type p,tb_configmodel_data tt where t.record_id=tt.data_record_id and t.productType_id=p.productType_id");
		hql.append(whereSql.toString());
		
		List list = getSession().createSQLQuery(hql.toString()).list();
		List<TbDataRecordVo> volist = new ArrayList<TbDataRecordVo>();
		Object[]  obj = new Object[volist.size()];
		for (int i = 0; i < list.size(); i++) {
			obj = (Object[]) list.get(i);
			TbDataRecordVo vo = new TbDataRecordVo();
			
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
			vo.setId(""+obj[11]);
			vo.setSourceId(""+obj[12]);
			vo.setProductTypeId(""+obj[13]);
			vo.setProductTypeName(""+obj[14]);
			vo.setHeJia(""+obj[15]);
			vo.setDiscountPrice(""+obj[17]);
			vo.setXianChangJia(""+obj[16]);
			vo.setTotalPrice(""+obj[18]);
			
			volist.add(vo);
		}
		return volist;
	}
}