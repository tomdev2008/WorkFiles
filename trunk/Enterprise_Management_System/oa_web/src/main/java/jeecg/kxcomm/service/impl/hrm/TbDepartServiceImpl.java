package jeecg.kxcomm.service.impl.hrm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.service.hrm.TbDepartServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbDepartService")
@Transactional
public class TbDepartServiceImpl extends CommonServiceImpl implements TbDepartServiceI {
	
}