package jeecg.kxcomm.service.impl.contactm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.service.contactm.TbConfigModelsServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbConfigModelsService")
@Transactional
public class TbConfigModelsServiceImpl extends CommonServiceImpl implements TbConfigModelsServiceI {
	
}