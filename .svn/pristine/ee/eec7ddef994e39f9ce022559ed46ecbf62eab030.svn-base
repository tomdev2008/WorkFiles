package jeecg.kxcomm.service.impl.hrm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeecg.kxcomm.entity.hrm.TbCheckingInstanceEntity;
import jeecg.kxcomm.entity.hrm.TbEmployeeEntity;
import jeecg.kxcomm.entity.hrm.TbOrgenEntity;
import jeecg.kxcomm.service.hrm.TbCheckingInstanceServiceI;

import org.hibernate.SQLQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.hibernate.qbc.PagerUtil;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.excel.ExcelUtil;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import jeecg.kxcomm.entity.hrm.TbCheckingInEntity;
import jeecg.kxcomm.service.hrm.TbEmployeeContractsServiceI;
import jeecg.kxcomm.util.BusinessUtil;
import jeecg.kxcomm.vo.hrm.CheckingInstanceVo;
import jeecg.kxcomm.vo.hrm.ExcelVo;

@Service("tbCheckingInstanceService")
@Transactional
public class TbCheckingInstanceServiceImpl extends CommonServiceImpl implements TbCheckingInstanceServiceI {

	@Autowired
	private TbEmployeeContractsServiceI tbEmployeeContractsService;
	

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
	@Override
	public PageList getPageList(HqlQuery hqlQuery, boolean b,TbCheckingInstanceEntity tbCheckingInstance, String starttime, String endtime, String empname) {
		//条件拼接，根据登陆不同的角色，看到的订单不同
		StringBuffer whereSql = new StringBuffer();
		if(null != starttime && !("").equals(starttime)) {
			whereSql.append(" and date_format(a.happenday,'%Y-%m-%d') >= date_format('"+starttime+" 00:00:00','%Y-%m-%d') ");
		}
		if(null != endtime && !("").equals(endtime)) {
			whereSql.append(" and date_format(a.happenday,'%Y-%m-%d') <= date_format('"+endtime+" 23:59:59','%Y-%m-%d') ");
		}
		if(null != empname && !("").equals(empname)) {
			whereSql.append(" and b.emp_name like '%"+empname+"%' ");
		}
		//主干sql
		StringBuffer hql = new StringBuffer();
		hql.append(" select max(a.id),sum(a.emp_due),sum(a.emp_actual),sum(a.neglect_work),sum(a.emp_late)," +
				"sum(a.leave_early),sum(a.overtime),sum(a.emp_leave),sum(a.emp_away),sum(a.weekend_overtime)," +
				"b.id,max(b.emp_name),max(c.perm_name) ");
		hql.append(" from tb_checking_instance a,tb_employee b,tb_orgen c where 1=1 and a.emp_id = b.id and b.orgen_id = c.id ");
		hql.append(whereSql.toString());
		hql.append("group by b.id");
		hqlQuery.setQueryString(hql.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("1", 1);
		hqlQuery.setMap(map);
		hqlQuery.setClass1(TbCheckingInstanceEntity.class);
		
		SQLQuery query = getSession().createSQLQuery(hqlQuery.getQueryString());
		int allCounts = query.list().size();
		int curPageNO = hqlQuery.getCurPage();
		int offset = PagerUtil.getOffset(allCounts, curPageNO, hqlQuery.getPageSize());
		query.setFirstResult(offset);
		query.setMaxResults(hqlQuery.getPageSize());
	 	List list= query.list();
		List<TbCheckingInstanceEntity> volist = new ArrayList<TbCheckingInstanceEntity>();
		Object[]  obj = new Object[volist.size()];
		for (int i = 0; i < list.size(); i++) {
			obj = (Object[]) list.get(i);
			TbCheckingInstanceEntity vo = new TbCheckingInstanceEntity();
			vo.setId(""+obj[0]);
			vo.setEmpDue(Integer.parseInt(""+obj[1]));
			vo.setEmpActual(Integer.parseInt(""+obj[2]));
			vo.setNeglectWork(Integer.parseInt(""+obj[3]));
			vo.setEmpLate(Integer.parseInt(""+obj[4]));
			vo.setLeaveEarly(Integer.parseInt(""+obj[5]));
			vo.setOvertime(Integer.parseInt(""+obj[6]));
			vo.setEmpLeave(Integer.parseInt(""+obj[7]));
			vo.setEmpAway(Integer.parseInt(""+obj[8]));
			vo.setWeekendOvertime(Integer.parseInt(""+obj[9]));
			TbEmployeeEntity employeeEntity = new TbEmployeeEntity();
			employeeEntity.setId(""+obj[10]);
			employeeEntity.setEmpName(""+obj[11]);
			TbOrgenEntity entity = new TbOrgenEntity();
			entity.setPermName(""+obj[12]);
			employeeEntity.setOrgenId(entity);
			vo.setEmpId(employeeEntity);
			volist.add(vo);
		}
		return new PageList(hqlQuery, volist, offset, curPageNO, allCounts);
	}

	
	@Override
	public boolean importExcel(InputStream io,String yyyyMM) throws Exception {
		//解析excel
		List<List<List<CheckingInstanceVo>>> excelList = readExcel(io,yyyyMM);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<TbCheckingInEntity> entityList = new ArrayList<TbCheckingInEntity>();
		//批量保存考勤信息到数据库
		for (int i = 0; i < excelList.size(); i++) {
			List<List<CheckingInstanceVo>> volist =  excelList.get(i);
			for (int j = 0; j < volist.size(); j++) {
				List<CheckingInstanceVo> checking = volist.get(j);
				for (int k = 0; k < checking.size(); k++) {
					CheckingInstanceVo vo = checking.get(k);
					TbCheckingInEntity entity = new TbCheckingInEntity();
					TbEmployeeEntity empId = new TbEmployeeEntity();
					empId.setId(vo.getEmpId());
					entity.setEmpId(empId);
					entity.setStauts(vo.getWorkState());
					entity.setTime(sdf.parse(vo.getTime()));
					if(null!=entity.getEmpId()&&!"".equals(entity.getEmpId())){
						entityList.add(entity);
					}
				}
			}
		}
		if(entityList.size()>0){
			batchSave(entityList);
		}
		return true;
	}
	
	/**
	 * 
	* 方法用途和描述: 解析excel读出的数据
	* @param io
	* @return
	* @throws Exception
	* @author chenliang 新增日期：2013-7-29
	* @since oa_web
	 */
	private List<List<List<CheckingInstanceVo>>> readExcel(InputStream io,String yyyy_MM) throws Exception{
		List<List<Object>> llo = ExcelUtil.readExcelByInputStream(io);
		List<List<Object>> listExcel = new ArrayList<List<Object>>();
		List<Integer> firstRows = new ArrayList<Integer>();
		//去除换行符号
		Pattern p = Pattern.compile("\r|\n");
        for (int i = 0; i < llo.size(); i++) {
			List<Object> objlist = llo.get(i);
			List<Object> lo = new ArrayList<Object>();
			for (int j = 0; j < objlist.size(); j++) {
				 Matcher m = p.matcher(""+objlist.get(j));
			     String after = m.replaceAll(""); 
			     lo.add(after);
			     if(BusinessUtil.FIRST_VALUE.equals(objlist.get(j))){
			    	 firstRows.add(i);
			     }
			}
			listExcel.add(lo);
		}
		
//		System.out.println("firstRows:"+firstRows);
//		System.out.println("listExcel:"+listExcel);
		
		List<List<List<CheckingInstanceVo>>> lists = new ArrayList<List<List<CheckingInstanceVo>>>();
		
		for (int n = 0; n < firstRows.size(); n++) {
			int title_rows = firstRows.get(n); 
			List<ExcelVo> excelList = new ArrayList<ExcelVo>();
			//先获取excel表头，固定是在第9行
			if(listExcel.size()>=title_rows){
				List<Object> listObj = listExcel.get(title_rows);
				if(listObj.size()>0){
					int num = 1;
					//循环列，先保存表头以及表头所在的列数(有些列是合并单元格，所有需要保存列数，用于后面对该列进行取值)
					HashMap<Integer, String> map = new HashMap<Integer, String>();
					for (int j = 0; j < listObj.size(); j++) {
						//当表头循环到“应到”这列时，退出循环
						if(BusinessUtil.END_COL.equals(listObj.get(j))){
							break;
						}else{
							if(listObj.get(j)!=null && !"".equals(listObj.get(j))){
								ExcelVo vo = new ExcelVo();
								vo.setRows(title_rows);
								vo.setColumn(j);
								vo.setValue(""+listObj.get(j));
								excelList.add(vo);
							}
						}
					}
				}
			}
		
//		System.out.println("excelList:"+excelList.toString());
		
		
			//循环数据行
			for (int i = title_rows+1; i < listExcel.size(); i++) {
				List<List<CheckingInstanceVo>> allList = new ArrayList<List<CheckingInstanceVo>>();
				String name = ""; //姓名
				String number = ""; //登记号码
				String shiftPeriod = ""; //班次时段
				String empId = ""; //员工id
				int beginIndex = 0;  //开始列
				List<Object> collist = listExcel.get(i);  //数据列
				//只遍历第一个表格
				if(collist.size()>0){
					//某个员工的姓名以及登记号和班次
					for (int j = 0; j < collist.size(); j++) {
						//循环标题动态列
						for (int j2 = 0; j2 < excelList.size(); j2++) {
							ExcelVo vo = excelList.get(j2);
							//根据标题所在的列的值与所有数据列匹配，获取某行的某列值
							if(vo.getColumn() == j && BusinessUtil.FIRST_COL_VALUE.equals(vo.getValue())){ //姓名列
								name = ""+collist.get(j);
								break;
							}else if(vo.getColumn() == j && BusinessUtil.SECOND_COL_VALUE.equals(vo.getValue())){ //登记号码列
								number = ""+collist.get(j);
								break;
							}else if(vo.getColumn() == j && BusinessUtil.THIRD_COL_VALUE.equals(vo.getValue())){ //班次时段列
								shiftPeriod = ""+collist.get(j);
								beginIndex = j;
								break;
							}else {
								if(!"".equals(name) && !"".equals(number) && !"".equals(shiftPeriod)){
									break;
								}
							}
						}
					}
				
	//				System.out.println("name:"+name+",number:"+number+",shiftPeriod:"+shiftPeriod);

					//根据员工名字查询员工
					TbEmployeeEntity employeeEntity = tbEmployeeContractsService.findUniqueByProperty(TbEmployeeEntity.class, "empName", name);
					if(null!=employeeEntity){
						empId = employeeEntity.getId();
					}
					
					List<CheckingInstanceVo> volist = new ArrayList<CheckingInstanceVo>();
					//循环数据列,因为是固定的
					for (int j = beginIndex+1; j < collist.size(); j++) {
						//循环标题动态列
						for (int j2 = 0; j2 < excelList.size(); j2++) {
							ExcelVo vo = excelList.get(j2);
							//根据标题所在的列的值与所有数据列匹配，获取某行的某列值
							if(vo.getColumn() == j && !"".equals(name) && !"".equals(number) && !"".equals(shiftPeriod) ){
								CheckingInstanceVo checkvo = new CheckingInstanceVo();
								checkvo.setEmpId(empId);
								checkvo.setName(name);
								checkvo.setNumber(number);
								checkvo.setShiftPeriod(shiftPeriod);
								checkvo.setTime(dateFormart(yyyy_MM,vo.getValue()));
								String stats = ""+collist.get(j);
								if(stats.length()>1){
									String[] checkings = stats.split("");
									for (int k = 0; k < checkings.length; k++) {
										String st = checkings[k];
										if(null!=st && !"".equals(st)){
											checkvo.setWorkState(""+BusinessUtil.check_stats.get(st));
											volist.add(checkvo);
										}
									}
								}else{
									checkvo.setWorkState(""+BusinessUtil.check_stats.get(collist.get(j)));
									volist.add(checkvo);
								}
								break;
							}
						}
					}
					if(volist.size()>0){
						allList.add(volist);
					}
				}else{
					break;
				}
				lists.add(allList);
			}
		}
		return lists;
	}
	
	
	/**
	 * 
	* 方法用途和描述: 时间转换
	* @return
	* @author chenliang 新增日期：2013-7-29
	* @since oa_web
	 */
	private String dateFormart(String yyyyMM,String dd){
		if(null!=dd && !"".equals(dd)){
			Pattern pattern = Pattern.compile("^(\\d+)(.*)");
			Matcher matcher = pattern.matcher(dd);
			if (matcher.matches()) {//数字开头
				if(matcher.group(1).length()<=1){
					yyyyMM = yyyyMM +"-0"+ matcher.group(1);
				}else{
					yyyyMM = yyyyMM +"-"+ matcher.group(1);
				}
			}
		}
		return yyyyMM;
	}

	/**
	 * 
	* 方法用途和描述: 删除考勤明细
	* @return
	* @author lizl 新增日期：2013-7-31
	* @since oa_web
	 */
	@Override
	public void delMiddleDatas(TbCheckingInstanceEntity tbCheckingInstance) {
		//删除中间表中的数据
		String delsql = "delete from tb_checking_in where emp_id = ? and date_format(time,'%Y-%m-%d') = date_format('"+tbCheckingInstance.getHappenday()+" 00:00:00','%Y-%m-%d') ";
		this.commonDao.executeSql(delsql, tbCheckingInstance.getEmpId().getId());
	}
}