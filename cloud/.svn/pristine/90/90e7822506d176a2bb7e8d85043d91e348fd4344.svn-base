package jeecg.kxcomm.service.contactm;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractDocEntity;

import org.jeecgframework.core.common.service.CommonService;

public interface TbContractQuotationsServiceI extends CommonService{
	public TbContractEntity exportContractTotalPrice(TbContractEntity contract,HttpServletRequest request);
	public boolean shengchengContractFile(String contractId,HttpServletRequest request);
	public List<TbContractDocEntity> queryConFileById(String contractId);
}
