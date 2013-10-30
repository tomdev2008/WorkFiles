package jeecg.kxcomm.service.hrm;

import java.util.List;

import jeecg.kxcomm.entity.hrm.TbEmployeeEntity;

import org.jeecgframework.core.common.service.CommonService;

public interface TbPostServiceI extends CommonService{

	/**
	 * 删除中间表的关联关系.
	 *
	 * @param postid
	 * 
	 */
	public void deleteMidEntityById(String postid);

	/**
	 * 检测岗位是否已被关联
	 *
	 * @param id
	 */
	public List<TbEmployeeEntity> checkPostCanDel(String id);
}
