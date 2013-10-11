package jeecg.kxcomm.service.impl.contactm;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.entity.contactm.TbPurchaseContractEntity;
import jeecg.kxcomm.entity.contactm.TbPurchaseEntity;
import jeecg.kxcomm.service.contactm.TbPurchaseContractServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbPurchaseContractService")
@Transactional
public class TbPurchaseContractServiceImpl extends CommonServiceImpl implements TbPurchaseContractServiceI {
	@Override
	public void addMain(TbPurchaseContractEntity tbPurchaseContract,
	        List<TbPurchaseEntity> tbPurchaseList){
			//保存主信息
			this.save(tbPurchaseContract);
		
			/**保存-采购订单*/
			for(TbPurchaseEntity tbPurchase:tbPurchaseList){
				//外键设置
				tbPurchase.setTbPurchaseContract(tbPurchaseContract);
				this.updateEntitie(tbPurchase);
			}
	}

	@Override
	public void updateMain(TbPurchaseContractEntity tbPurchaseContract,
	        List<TbPurchaseEntity> tbPurchaseList) {
//		//保存订单主信息
//		this.saveOrUpdate(tbPurchaseContract);
//		
//		
//		//===================================================================================
//		//获取参数
//		Object id0 = tbPurchaseContract.getId();
//		//===================================================================================
//		//删除-采购订单
//	    String hql0 = "from TbPurchaseCopyEntity where 1 = 1 AND purchaseContractId = ? ";
//	    List<TbPurchaseCopyEntity> tbPurchaseCopyOldList = this.findHql(hql0,id0);
//		this.deleteAllEntitie(tbPurchaseCopyOldList);
//		//保存-采购订单
//		for(TbPurchaseCopyEntity tbPurchaseCopy:tbPurchaseCopyList){
//			//外键设置
//			tbPurchaseCopy.setPurchaseContractId(tbPurchaseContract.getId());
//			this.save(tbPurchaseCopy);
//		}
		
	}

	@Override
	public void delMain(TbPurchaseContractEntity tbPurchaseContract) {
		
		//===================================================================================
		//获取参数
		Object id0 = tbPurchaseContract.getId();
		//===================================================================================
		//删除-采购订单
	    String hql0 = "from TbPurchaseEntity where 1 = 1 AND tbPurchaseContract = ? ";
	    List<TbPurchaseEntity> tbPurchaseOldList = this.findHql(hql0,tbPurchaseContract);
	    for(TbPurchaseEntity tbPurchase:tbPurchaseOldList){
	    	tbPurchase.setTbPurchaseContract(null);
	    }
		//删除主表信息
		this.delete(tbPurchaseContract);
	}
}