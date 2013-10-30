package jeecg.kxcomm.service.impl.contactm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.service.contactm.TbPurchaseServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbPurchaseService")
@Transactional
public class TbPurchaseServiceImpl extends CommonServiceImpl implements TbPurchaseServiceI {
	
}