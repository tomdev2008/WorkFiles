package jeecg.kxcomm.service.impl.systemmanager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractDocEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractDocVariableEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocVariableEntity;
import jeecg.kxcomm.service.systemmanager.TbContractDocServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.StringUtil;

@Service("tbContractDocService")
@Transactional
public class TbContractDocServiceImpl extends CommonServiceImpl implements TbContractDocServiceI {
	@Override
	public TbContractDocEntity getTbContractDocEntity(String contractId,String templatesDocId)
	{
		String hql="from TbContractDocEntity a where a.contractId.id=? and a.templatesdocId.id=?";
		if(contractId!=null && templatesDocId!=null)
		{
		 List<TbContractDocEntity> contractDocList=this.findHql(hql, contractId,templatesDocId);
		 return contractDocList.get(0);
		}else{
		return null;
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 保存合同文件变量，根据合同选中的合同模板id查询合同文件，根据合同文件查询对应的变量保存到合同文件变量
	* @param contractVo
	* @author chenliang 新增日期：2013-3-7
	* @since ContractManage
	 */
	@Override
	public void saveContractDocVaialbe(TbContractEntity contract){
		String pkid = "";
		if(StringUtil.isNotEmpty(contract)){
			pkid = contract.getId();
		}
		String hql = " select a,b from TbContractDocEntity a,TbContractTemplatesDocVariableEntity b "+
					 " where a.templatesdocId.id = b.templatesdocId.id "+
					 " and a.contractId.id = ? ";
		List<Object[]> lists = this.findHql(hql, pkid);
		for (int i = 0; i < lists.size(); i++) {
			Object[] obj = lists.get(i);
			TbContractDocEntity contractDoc = (TbContractDocEntity) obj[0];
			TbContractTemplatesDocVariableEntity templateDocVariable = (TbContractTemplatesDocVariableEntity) obj[1];
			//设置合同文件变量
			TbContractDocVariableEntity docVariable = new TbContractDocVariableEntity();
			TbContractDocEntity doc = new TbContractDocEntity();
			doc.setId(contractDoc.getId());
			docVariable.setDocId(doc);
			docVariable.setVariablename(templateDocVariable.getVariablename());
			this.save(docVariable);
		}
	}

}