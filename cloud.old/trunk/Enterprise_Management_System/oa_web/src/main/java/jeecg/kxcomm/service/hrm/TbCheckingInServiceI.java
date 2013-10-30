package jeecg.kxcomm.service.hrm;

import org.jeecgframework.core.common.service.CommonService;

public interface TbCheckingInServiceI extends CommonService{

	/**
	 * 删除数据.
	 *
	 * @param times
	 * @param empId_id
	 */
	void delDataByTimeAndEmp(String[] times, String empId_id,String hptime);
}
