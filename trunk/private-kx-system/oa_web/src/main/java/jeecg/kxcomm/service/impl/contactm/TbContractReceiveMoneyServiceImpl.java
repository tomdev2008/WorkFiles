package jeecg.kxcomm.service.impl.contactm;

import java.util.List;

import jeecg.kxcomm.entity.contactm.TbContractReceiveMoneyEntity;
import jeecg.kxcomm.service.contactm.TbContractReceiveMoneyServiceI;

import org.hibernate.Query;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.hibernate.qbc.PagerUtil;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("tbContractReceiveMoneyService")
@Transactional
public class TbContractReceiveMoneyServiceImpl extends CommonServiceImpl implements TbContractReceiveMoneyServiceI {

}