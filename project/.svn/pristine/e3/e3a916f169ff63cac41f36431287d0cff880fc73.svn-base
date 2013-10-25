package jeecg.test.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jeecg.test.entity.orders.TbRemarkEntity;
import jeecg.test.vo.OrdersVo;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.jeecgframework.core.common.dao.impl.CommonDao;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.hibernate.qbc.PagerUtil;
import org.jeecgframework.core.util.ToEntityUtil;
import org.springframework.stereotype.Repository;

@Repository
public class TbOrdersDAO extends CommonDao {

	@Override
	public PageList getPageListBySql(HqlQuery hqlQuery, boolean isToEntity) {
		SQLQuery query = getSession().createSQLQuery(hqlQuery.getQueryString());

		// query.setParameters(hqlQuery.getParam(), (Type[])
		// hqlQuery.getTypes());
		int allCounts = query.list().size();
		int curPageNO = hqlQuery.getCurPage();
		int offset = PagerUtil.getOffset(allCounts, curPageNO, hqlQuery.getPageSize());
		query.setFirstResult(offset);
		query.setMaxResults(hqlQuery.getPageSize());
//		 = null;
//		if (isToEntity) {
//			list = ToEntityUtil.toEntityList(query.list(), hqlQuery.getClass1(), hqlQuery.getDataGrid().getField().split(","));
//		} else {
		 	List list= query.list();
			List<OrdersVo> volist = new ArrayList<OrdersVo>();
			Object[]  obj = new Object[volist.size()];
			for (int i = 0; i < list.size(); i++) {
				obj = (Object[]) list.get(i);
				OrdersVo vo = new OrdersVo();
				vo.setId(""+obj[0]);
				vo.setOrderNumber(""+obj[1]);
				vo.setImportant(""+obj[2]);
				vo.setStatus(""+obj[3]);
				vo.setCreateTime(obj[4]!=null?(Date)obj[4]:null);
				vo.setAgentsName(""+obj[5]);
				vo.setChannelName(""+obj[6]);
				vo.setCountryName(""+obj[7]);
				vo.setPhone(""+obj[8]);
				vo.setRemark(""+(obj[9]!=null||obj[9]!=""||obj[9]!="\"null\""?obj[9]:""));
				vo.setUserName(""+obj[10]);
				volist.add(vo);
			}
//		}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}

	public List getEntity(String hql,Object ...obj){
		Query query = getSession().createSQLQuery(hql);
		int j = 0;
		for (int i = 0; i < obj.length; i++) {
			if(null!=obj[i]){
				if(obj[i] instanceof Integer){
					query.setInteger(j, Integer.parseInt(obj[i].toString()));
				}else if(obj[i] instanceof String){
					query.setString(j, obj[i].toString());
				}
				j++;
			}
		}
		List<TbRemarkEntity> list = query.list();
		return list;
	}
}
