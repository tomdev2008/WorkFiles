package jeecg.kxcomm.service.contactm;

import java.util.List;

import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.service.CommonService;
import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.entity.contactm.TbOrderDetailEntity;
import jeecg.kxcomm.entity.hrm.TbCheckingInstanceEntity;

public interface TbOrderServiceI extends CommonService{

	/**
	 * 添加一对多
	 * 
	 */
	public void addMain(TbOrderEntity tbOrder,
	        List<TbOrderDetailEntity> tbOrderDetailList) ;
	/**
	 * 修改一对多
	 * 
	 */
	public void updateMain(TbOrderEntity tbOrder,
	        List<TbOrderDetailEntity> tbOrderDetailList);
	public void delMain (TbOrderEntity tbOrder);
	
	public PageList getPageList(HqlQuery hqlQuery, boolean b,TbOrderEntity tbOrder, String kxOrderNo,String projectName,String contractNo,String client,String principal,String status);
}
