package jeecg.kxcomm.service.impl.systemmanager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.systemmanager.TbContractDocVariableEntity;
import jeecg.kxcomm.service.systemmanager.TbContractDocVariableServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbContractDocVariableService")
@Transactional
public class TbContractDocVariableServiceImpl extends CommonServiceImpl implements TbContractDocVariableServiceI {
	@Override
	public List<TbContractDocVariableEntity> getContractDocVariableEntity(
			String docId) {
		List<TbContractDocVariableEntity> list=new ArrayList<TbContractDocVariableEntity>();
		String hql=" from TbContractDocVariableEntity t where t.docId.id=?";
		if(docId!=null)
		{
		 list=this.findHql(hql, docId);
		}
		return list;
	}
}