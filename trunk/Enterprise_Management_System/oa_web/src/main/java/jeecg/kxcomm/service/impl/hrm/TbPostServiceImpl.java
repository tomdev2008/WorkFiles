package jeecg.kxcomm.service.impl.hrm;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.hrm.TbEmployeeEntity;
import jeecg.kxcomm.service.hrm.TbPostServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbPostService")
@Transactional
public class TbPostServiceImpl extends CommonServiceImpl implements TbPostServiceI {

	//删除中间表关系
	@Override
	public void deleteMidEntityById(String postid) {
		String delsql = "delete from tb_post_city_relationship where post_id = ?";
		this.commonDao.executeSql(delsql,postid);
	}
	//检测岗位是否已被关联
	@Override
	public List<TbEmployeeEntity> checkPostCanDel(String id) {
		List<TbEmployeeEntity> employeeEntities = this.commonDao.findByProperty(TbEmployeeEntity.class,"postId.id",id);
		return employeeEntities;
	}
}