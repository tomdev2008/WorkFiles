package jeecg.kxcomm.service.impl.hrm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.service.hrm.TbCheckingInServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("tbCheckingInService")
@Transactional
public class TbCheckingInServiceImpl extends CommonServiceImpl implements TbCheckingInServiceI {

	@Override
	public void delDataByTimeAndEmp(String[] times, String empId_id,String hptime) {
		StringBuffer delsql = new StringBuffer();
		delsql.append("delete from tb_checking_in where 1=1 ");
		String startime = null;
		String endtime = null;
		String empId = null;
		if(null != times[0] && !"".equals(times[0]) && !"null".equals(times[0])) {
			startime = times[0];
			delsql.append(" and date_format(time,'%Y-%m-%d') >= date_format('"+startime+"','%Y-%m-%d') ");
		} //else {
		//	delsql.append(" and date_format(a.time,'%Y-%m-%d') >= date_format('"+hptime+" 00:00:00','%Y-%m-%d') ");
		//}
		if(null != times[1] && !"".equals(times[1]) && !"null".equals(times[0])) {
			endtime = times[1];
			delsql.append(" and date_format(time,'%Y-%m-%d') <= date_format('"+endtime+"','%Y-%m-%d') ");
		} //else {
			//delsql.append(" and date_format(a.time,'%Y-%m-%d') <= date_format('"+hptime+" 00:00:00','%Y-%m-%d') ");
		//}
		if(null != empId_id && !"".equals(empId_id)) {
			empId = empId_id;
			delsql.append(" and emp_id = '"+empId+"'");
		}
		this.commonDao.executeSql(delsql.toString());
		String delprisql = "delete from tb_checking_instance where 1=1 and emp_id = '"+empId+"'";
		this.commonDao.executeSql(delprisql.toString());
	}
}