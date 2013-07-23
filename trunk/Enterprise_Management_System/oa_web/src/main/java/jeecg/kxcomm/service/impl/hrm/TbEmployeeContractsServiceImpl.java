package jeecg.kxcomm.service.impl.hrm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.service.hrm.TbEmployeeContractsServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbEmployeeContractsService")
@Transactional
public class TbEmployeeContractsServiceImpl extends CommonServiceImpl implements TbEmployeeContractsServiceI {
	
}