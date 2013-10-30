package jeecg.kxcomm.service.impl.contactm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.service.contactm.TbQuotationsDataServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbQuotationsDataService")
@Transactional
public class TbQuotationsDataServiceImpl extends CommonServiceImpl implements TbQuotationsDataServiceI {
	
}