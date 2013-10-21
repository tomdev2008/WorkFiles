package jeecg.kxcomm.service.systemmanager;

import java.util.List;

import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocVariableEntity;

import org.jeecgframework.core.common.service.CommonService;


public interface TbContractTemplatesDocVariableServiceI extends CommonService{

	/**
	 * 根据合同模板文件ID查询模板文件变量
	 */
	public List<TbContractTemplatesDocVariableEntity> getTemplatesDocVariable(String docId);
	
/**
 * 检查合同模板文件变量是否与word文档中变量名一致
 */
	public boolean checkVariable(String templatesDoc,List<TbContractTemplatesDocVariableEntity> docVariable); 
}
