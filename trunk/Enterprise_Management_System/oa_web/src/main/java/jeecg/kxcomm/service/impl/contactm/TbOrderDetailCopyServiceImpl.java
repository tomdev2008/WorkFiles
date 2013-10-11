package jeecg.kxcomm.service.impl.contactm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.service.contactm.TbOrderDetailCopyServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbOrderDetailCopyService")
@Transactional
public class TbOrderDetailCopyServiceImpl extends CommonServiceImpl implements TbOrderDetailCopyServiceI {
	
}