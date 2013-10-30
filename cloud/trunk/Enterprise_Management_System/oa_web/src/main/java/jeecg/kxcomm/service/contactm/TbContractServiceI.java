package jeecg.kxcomm.service.contactm;

import java.util.List;

import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.service.CommonService;

import jeecg.kxcomm.entity.contactm.TbConfigModelsEntity;
import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.entity.hrm.TbCheckingInstanceEntity;
import jeecg.kxcomm.vo.contactm.TbContractVo;
import jeecg.kxcomm.vo.contactm.TbQuotationsVo;

public interface TbContractServiceI extends CommonService{

	/**
	 * 添加一对多
	 * 
	 */
/*	public void addMain(TbContractEntity tbContract,
	        List<TbOrderEntity> tbOrderList) ;*/
	/**
	 * 修改一对多
	 * 
	 */
/*	public void updateMain(TbContractEntity tbContract,
	        List<TbOrderEntity> tbOrderList);
	public void delMain (TbContractEntity tbContract);
	*/
	public PageList getPageList(HqlQuery hqlQuery, boolean b,TbContractVo tbContract,String contractNo);
	public PageList getQuotationsList(HqlQuery hqlQuery, boolean b,
			TbQuotationsVo quotationsVo);
/*	public PageList getConfigByQuoList(HqlQuery hqlQuery, boolean b,
			TbConfigModelsEntity tbConfigModelsEntity,String quoId);*/
	public List<TbConfigModelsEntity> getConfigByQuoList(
			String quoId) ;
}
