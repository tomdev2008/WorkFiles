package jeecg.kxcomm.service.impl.contactm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.service.contactm.TbCustomerEntityServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbCustomerEntityService")
@Transactional
public class TbCustomerEntityServiceImpl extends CommonServiceImpl implements TbCustomerEntityServiceI {
	
}