package jeecg.kxcomm.service.systemmanager;

import java.util.List;

import jeecg.kxcomm.entity.systemmanager.TbContractDocVariableEntity;

import org.jeecgframework.core.common.service.CommonService;

public interface TbContractDocVariableServiceI extends CommonService{
	public List<TbContractDocVariableEntity> getContractDocVariableEntity(
			String docId);

}
