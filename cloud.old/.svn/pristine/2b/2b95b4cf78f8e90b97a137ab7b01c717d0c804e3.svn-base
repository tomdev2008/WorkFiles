package jeecg.kxcomm.service.impl.hrm;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.hrm.TbOrgenEntity;
import jeecg.kxcomm.service.hrm.TbOrgenServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbOrgenService")
@Transactional
public class TbOrgenServiceImpl extends CommonServiceImpl implements TbOrgenServiceI {
	
	//保存中间表的数据（部门and机构）
	@Override
	public void saveMidDeptEntity(TbOrgenEntity tbOrders, String deptid) {
		//重新补充新的数据
		String sql = "insert into tb_deptorgen value(?,?)";
		this.commonDao.executeSql(sql, tbOrders.getId(),deptid);
	}
	
	//删除中间表的数据（部门and机构）
	@Override
	public void delMidDeptEntity(TbOrgenEntity tbOrders) {
		//删除中间表中的数据
		String delsql = "delete from tb_deptorgen where orgen_id = ?";
		this.commonDao.executeSql(delsql, tbOrders.getId());
	}
	
	//根据机构ID查询部门
	@Override
	public String queryDeptByOrgenId(TbOrgenEntity tbOrders) {
		String querysql = "select dept_id from tb_deptorgen where orgen_id = '"+tbOrders.getId()+"'";
		List<String> list = this.commonDao.findListbySql(querysql);
		String ids = "";
		for(int i= 0; i < list.size(); i++) {
			ids = ids + list.get(i) +",";
		}
		if(0 < list.size()) {
			ids = ids.substring(0,ids.length()-1);
		}
		return ids;
	}
}