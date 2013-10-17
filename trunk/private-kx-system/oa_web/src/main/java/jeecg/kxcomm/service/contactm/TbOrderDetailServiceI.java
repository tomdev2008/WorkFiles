package jeecg.kxcomm.service.contactm;

import jeecg.kxcomm.entity.contactm.TbOrderDetailEntity;

import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.service.CommonService;

public interface TbOrderDetailServiceI extends CommonService{
	public PageList getPageList(HqlQuery hqlQuery, boolean b,TbOrderDetailEntity tbOrderDetail, String kxOrderNo,String projectName ,String client ,String finalClient ,String principal ,String name,String type ,String supplier ,String saleContractNo ,String purchaser,String status );
	
}
