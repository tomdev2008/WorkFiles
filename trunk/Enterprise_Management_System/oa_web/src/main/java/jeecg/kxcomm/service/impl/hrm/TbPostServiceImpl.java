package jeecg.kxcomm.service.impl.hrm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.service.hrm.TbPostServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbPostService")
@Transactional
public class TbPostServiceImpl extends CommonServiceImpl implements TbPostServiceI {
	
}