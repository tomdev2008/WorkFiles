package jeecg.kxcomm.service.systemmanager;

import java.util.List;

import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesRelationshipEntity;

import org.jeecgframework.core.common.service.CommonService;

public interface TbContractTemplatesRelationshipServiceI extends CommonService{
 /**
  *根据模板文件ID查询关系表 
  */
	public List<TbContractTemplatesRelationshipEntity> listByDocId(String docId);
	
	/**
	 * 保存合同模板与模板文件之间的关系.
	 *
	 * @param contempIds
	 * @param filesId
	 */
	public void saveMidTempFileEntity(String contempIds, String filesId);
}
