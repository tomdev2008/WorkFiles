package jeecg.kxcomm.service.systemmanager;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractDocEntity;

import org.jeecgframework.core.common.service.CommonService;

public interface TbContractDocServiceI extends CommonService{
	public TbContractDocEntity getTbContractDocEntity(String contractId,String templatesDocId);
	public void saveContractDocVaialbe(TbContractEntity contract);

}
