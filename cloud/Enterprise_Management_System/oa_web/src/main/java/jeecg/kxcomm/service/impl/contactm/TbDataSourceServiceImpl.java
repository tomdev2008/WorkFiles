package jeecg.kxcomm.service.impl.contactm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.service.contactm.TbDataSourceServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbDataSourceService")
@Transactional
public class TbDataSourceServiceImpl extends CommonServiceImpl implements TbDataSourceServiceI {
	
}