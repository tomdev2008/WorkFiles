package jeecg.kxcomm.service.hrm;

import java.util.List;

import jeecg.kxcomm.entity.hrm.TbOrgenEntity;

import org.jeecgframework.core.common.service.CommonService;

public interface TbOrgenServiceI extends CommonService{

	//保存中间表的数据（部门and机构）
	public void saveMidDeptEntity(TbOrgenEntity tbOrders, String deptid);
	//删除中间表的数据（部门and机构）
	public void delMidDeptEntity(TbOrgenEntity tbOrders);
	//根据机构ID查询部门
	public String queryDeptByOrgenId(TbOrgenEntity tbOrders);
}
