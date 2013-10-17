package jeecg.kxcomm.service.impl.systemmanager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.service.systemmanager.TbDataSourceEntityServiceI;
import jeecg.kxcomm.vo.systemmanager.DataBean;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbDataSourceEntityService")
@Transactional
public class TbDataSourceEntityServiceImpl extends CommonServiceImpl implements TbDataSourceEntityServiceI {

	public List<DataBean> listDetailDataRecord(String id) {
		StringBuffer hql = new StringBuffer();
		hql.append(" select t.source_id,t.productType_id,ty.productTypeName,ty.category_id ");
		hql.append(" from tb_data_record t,tb_product_type ty ");
		hql.append(" where t.source_id='"+id+"' ");
		hql.append(" and t.productType_id=ty.productType_id ");
		hql.append(" group by ty.productType_id ");
		
		List lists = this.findListbySql(hql.toString());
		//List lists = this.findByPage(hql.toString(), id);
		List<DataBean> dataBeans = new ArrayList<DataBean>();
		Object[] obj = new Object[lists.size()];
		for (int i = 0; i < lists.size(); i++) {
			obj = (Object[]) lists.get(i);
			DataBean bean = new DataBean();
			bean.setId(obj[0].toString());
			bean.setTypeId(obj[1].toString());
			bean.setName(obj[2].toString());
			bean.setParam(obj[3].toString());
			bean.setUrl("tbDataRecordEntityController.do?datagrid&dataSourceId="+bean.getId()+"&productTypeId="+bean.getTypeId());
			dataBeans.add(bean);
		}
		return dataBeans;
		//return null;
	}
}