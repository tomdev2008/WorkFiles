package jeecg.kxcomm.service.impl.systemmanager;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesEntityEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesRelationshipEntity;
import jeecg.kxcomm.service.systemmanager.TbContractTemplatesRelationshipServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;


@Service("tbContractTemplatesRelationshipService")
@Transactional
public class TbContractTemplatesRelationshipServiceImpl extends CommonServiceImpl implements TbContractTemplatesRelationshipServiceI {
	
	@Override
	public List<TbContractTemplatesRelationshipEntity> listByDocId(String docId) {
		String hql = "from TbContractTemplatesRelationshipEntity a where a.templatesdocId.id = ?";
		List<TbContractTemplatesRelationshipEntity> relationShiplist = this.findHql(hql, docId);
		return relationShiplist;
	}
	
	//保存中间表的数据（模板and文件）
	@Override
	public void saveMidTempFileEntity(String contempIds, String filesId) {
		//重新补充新的数据
		TbContractTemplatesRelationshipEntity relationshipEntity = new TbContractTemplatesRelationshipEntity();
		TbContractTemplatesDocEntity docEntity = new TbContractTemplatesDocEntity();
		docEntity.setId(filesId);
		relationshipEntity.setTemplatesdocId(docEntity);
		TbContractTemplatesEntityEntity templatesEntityEntity = new TbContractTemplatesEntityEntity();
		templatesEntityEntity.setId(contempIds);
		relationshipEntity.setTemplatesId(templatesEntityEntity);
		this.commonDao.save(relationshipEntity);
	}
}