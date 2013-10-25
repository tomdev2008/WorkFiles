package jeecg.test.dao;

import java.util.List;

import jeecg.test.entity.orders.TbAgentsEntity;
import jeecg.test.entity.orders.TbRemarkEntity;

import org.hibernate.Query;
import org.jeecgframework.core.common.dao.impl.CommonDao;
import org.springframework.stereotype.Repository;

@Repository
public class TbAgentsDAO extends CommonDao {

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
		List list = query.list();
		return list;
	}
}
