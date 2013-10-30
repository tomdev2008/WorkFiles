package jeecg.kxcomm.service.impl.systemmanager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocVariableEntity;
import jeecg.kxcomm.service.systemmanager.TbContractTemplatesDocVariableServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import jeecg.kxcomm.util.WordTools;

@Service("tbContractTemplatesDocVariableService")
@Transactional
public class TbContractTemplatesDocVariableServiceImpl extends CommonServiceImpl implements TbContractTemplatesDocVariableServiceI {

	@Override
	public List<TbContractTemplatesDocVariableEntity> getTemplatesDocVariable(
			String docId) {
		List<TbContractTemplatesDocVariableEntity> list=new ArrayList<TbContractTemplatesDocVariableEntity>();
		String hql=" from TbContractTemplatesDocVariableEntity t where t.templatesdocId.id=?";
		if(docId!=null)
		{
		 list=this.findHql(hql, docId);
		}
		return list;
	}

	@Override
	public boolean checkVariable(String templatesDoc,
			List<TbContractTemplatesDocVariableEntity> docVariable) {
		//调用检查变量名称是否一致
		WordTools tools = WordTools.getInstance();
		HashMap<String , TbContractTemplatesDocVariableEntity> table = tools.checkVariable(templatesDoc, docVariable);
		return false;
	}
	
}