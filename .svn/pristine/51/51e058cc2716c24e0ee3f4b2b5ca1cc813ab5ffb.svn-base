package jeecg.kxcomm.service.hrm;

import java.io.InputStream;

import jeecg.kxcomm.entity.hrm.TbCheckingInstanceEntity;

import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.service.CommonService;

public interface TbCheckingInstanceServiceI extends CommonService{

	/**
	 * 根据查询条件查询考勤情况.
	 *
	 * @param hqlQuery
	 * @param b
	 * @param tbCheckingInstance
	 * @param id
	 * @param user
	 * @return
	 */
	public PageList getPageList(HqlQuery hqlQuery, boolean b,TbCheckingInstanceEntity tbCheckingInstance, String starttime, String endtime,String empname);
	
	/**
	 * 
	* 方法用途和描述: 考勤导入
	* @param io
	* @return
	* @author chenliang 新增日期：2013-7-25
	* @since oa_web
	 */
	public boolean importExcel(InputStream io,String startTime,String endTime) throws Exception;

	/**
	 * TODO 删除考勤明细.
	 *
	 * @param tbCheckingInstance
	 */
	public void delMiddleDatas(TbCheckingInstanceEntity tbCheckingInstance);
	
	
	/**
	 * 
	* 方法用途和描述: 统计考勤情况
	* @author chenliang 新增日期：2013-7-31
	* @since oa_web
	 */
	public void statisticsChecking(String startTime,String endTime);
}
