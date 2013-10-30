package jeecg.kxcomm.service.impl.systemmanager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.contactm.TbConfigModelsEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesEntityEntity;
import jeecg.kxcomm.service.systemmanager.TbContractTemplatesEntityServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbContractTemplatesEntityService")
@Transactional
public class TbContractTemplatesEntityServiceImpl extends CommonServiceImpl implements TbContractTemplatesEntityServiceI {
	/**
	 * 查询审核通过的合同模板
	 */
	@Override
	public List<TbContractTemplatesEntityEntity> getContractTemplatesList()
	{
		List<TbContractTemplatesEntityEntity> list=new ArrayList<TbContractTemplatesEntityEntity>();
		String hql=" from TbContractTemplatesEntityEntity t where t.status=3";
		 list=this.findHql(hql);
		return list;
	}
}