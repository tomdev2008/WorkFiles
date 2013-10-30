package jeecg.kxcomm.service.impl.contactm;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.contactm.TbProjectEntityEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesRelationshipEntity;
import jeecg.kxcomm.service.contactm.TbProjectEntityServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbProjectEntityService")
@Transactional
public class TbProjectEntityServiceImpl extends CommonServiceImpl implements TbProjectEntityServiceI {
	@Override
	public List<TbProjectEntityEntity> listByCustomerId(String cusId) {
		String hql = "from TbProjectEntityEntity a where a.customer.id = ?";
		List<TbProjectEntityEntity> projectList = this.findHql(hql, cusId);
		return projectList;
	}
}