package jeecg.kxcomm.service.impl.systemmanager;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.service.systemmanager.TbContractDocServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbContractDocService")
@Transactional
public class TbContractDocServiceImpl extends CommonServiceImpl implements TbContractDocServiceI {
	
}