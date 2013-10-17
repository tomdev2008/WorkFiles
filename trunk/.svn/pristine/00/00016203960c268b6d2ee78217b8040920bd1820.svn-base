package jeecg.kxcomm.service.impl.systemmanager;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.hrm.TbCheckingInstanceEntity;
import jeecg.kxcomm.entity.hrm.TbOrgenEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesEntityEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesRelationshipEntity;
import jeecg.kxcomm.service.systemmanager.TbContractTemplatesDocServiceI;

import org.hibernate.SQLQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.hibernate.qbc.PagerUtil;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbContractTemplatesDocService")
@Transactional
public class TbContractTemplatesDocServiceImpl extends CommonServiceImpl implements TbContractTemplatesDocServiceI {

	//获取合同模板关联的合同模板文件
	@Override
	public List<TbContractTemplatesDocEntity> getConTempList(HqlQuery hqlQuery, boolean b,TbContractTemplatesDocEntity tbContractTemplatesDocEntity,String temple_id) {
		//条件拼接，根据登陆不同的角色，看到的订单不同
		StringBuffer whereSql = new StringBuffer();
		if(null != temple_id && !("").equals(temple_id)) {
			whereSql.append(" and c.id = '"+temple_id+"' ");
		}
		//主干sql
		StringBuffer hql = new StringBuffer();
		hql.append(" select a.id,a.docName,a.createtime,a.bVariable ");
		hql.append(" from tb_contract_templates_doc a,tb_contract_templates_relationship b,tb_contract_templates c ");
		hql.append(" where 1=1 and a.id = b.templatesDoc_id and b.templates_id = c.id ");
		
		hql.append(whereSql.toString());
		hqlQuery.setQueryString(hql.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("1", 1);
		hqlQuery.setMap(map);
		hqlQuery.setClass1(TbContractTemplatesDocEntity.class);
		
		SQLQuery query = getSession().createSQLQuery(hqlQuery.getQueryString());
	 	List list= query.list();
		List<TbContractTemplatesDocEntity> volist = new ArrayList<TbContractTemplatesDocEntity>();
		Object[]  obj = new Object[volist.size()];
		for (int i = 0; i < list.size(); i++) {
			obj = (Object[]) list.get(i);
			TbContractTemplatesDocEntity vo = new TbContractTemplatesDocEntity();
			vo.setId(""+obj[0]);
			vo.setDocname(""+obj[1]);
			try {
				vo.setCreatetime(new SimpleDateFormat("yyyy-MM-dd").parse(""+obj[2]));
			} catch (ParseException exception) {
				exception.printStackTrace();
			}
			vo.setBvariable(Integer.parseInt(""+obj[3]));
			volist.add(vo);
		}
		return volist;
	}
	
	//获得所有的模板文件
	@Override
	public PageList getPageList(HqlQuery hqlQuery, boolean b,TbContractTemplatesDocEntity tbContractTemplatesDocEntity,String temple_id, String statsvalues) {
		//主干sql
		StringBuffer hql = null;
		//条件拼接，根据登陆不同的角色，看到的订单不同
		StringBuffer whereSql = new StringBuffer();
		if(null == statsvalues || ("2").equals(statsvalues) || ("4").equals(statsvalues) || ("6").equals(statsvalues)) {
			hql = new StringBuffer();
			hql.append(" select a.id,a.docName,a.createtime,a.bVariable ");
			hql.append(" from tb_contract_templates_doc a,tb_contract_templates_relationship b,tb_contract_templates c ");
			hql.append(" where 1=1 and a.id = b.templatesDoc_id and b.templates_id = c.id ");
			if(null != temple_id && !("").equals(temple_id)) {
				whereSql.append(" and c.id = '"+temple_id+"' ");
			}
		} else {
			hql = new StringBuffer();
			hql.append(" select a.id,a.docName,a.createtime,a.bVariable from tb_contract_templates_doc a ");
		}
		hql.append(whereSql.toString());
		hqlQuery.setQueryString(hql.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("1", 1);
		hqlQuery.setMap(map);
		hqlQuery.setClass1(TbContractTemplatesDocEntity.class);
		
		SQLQuery query = getSession().createSQLQuery(hqlQuery.getQueryString());
		int allCounts = query.list().size();
		int curPageNO = 0;
		int offset = PagerUtil.getOffset(allCounts, curPageNO, hqlQuery.getPageSize());
		query.setFirstResult(0);
		query.setMaxResults(1000);
	 	List list= query.list();
		List<TbContractTemplatesDocEntity> volist = new ArrayList<TbContractTemplatesDocEntity>();
		Object[]  obj = new Object[volist.size()];
		for (int i = 0; i < list.size(); i++) {
			obj = (Object[]) list.get(i);
			TbContractTemplatesDocEntity vo = new TbContractTemplatesDocEntity();
			vo.setId(""+obj[0]);
			vo.setDocname(""+obj[1]); 
			try {
				vo.setCreatetime(new SimpleDateFormat("yyyy-MM-dd").parse(""+obj[2]));
			} catch (ParseException exception) {
				exception.printStackTrace();
			}
			vo.setBvariable(Integer.parseInt(""+obj[3]));
			volist.add(vo);
		}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}

	//保存中间表的数据（模板and文件）
	@Override
	public void saveMidTempFileEntity(String contempIds, String filesId) {
		//重新补充新的数据
		TbContractTemplatesRelationshipEntity relationshipEntity = new TbContractTemplatesRelationshipEntity();
		TbContractTemplatesDocEntity docEntity = new TbContractTemplatesDocEntity();
		docEntity.setId(filesId);
		relationshipEntity.setTemplatesdocId(docEntity);
		TbContractTemplatesEntityEntity templatesEntityEntity = new TbContractTemplatesEntityEntity();
		templatesEntityEntity.setId(contempIds);
		relationshipEntity.setTemplatesId(templatesEntityEntity);
		this.commonDao.save(relationshipEntity);
	}
	
	//删除中间表的数据（模板and文件）
	@Override
	public void delMidTempFileEntity(String contempIds) {
		//删除中间表中的数据
		String delsql = "delete from tb_contract_templates_relationship where templates_id = ?";
		this.commonDao.executeSql(delsql, contempIds);
	}
}