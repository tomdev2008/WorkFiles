/**
 * 
 */
/**
 * @author Lu
 *
 */
package jeecg.kxcomm.vo.hrm;

import java.io.Serializable;

/**
 * 
 * 功能描述:考勤Vo
 * 
 * @author chenliang 新增日期：2013-7-26
 * @since oa_web
 */
public class CheckingInstanceVo implements Serializable {

	private String empId; //员工id
	private String name;  //姓名
	private String number; //登记号码
	private String shiftPeriod; //班次时段
	private String time; // 时间，存的是日
	private String workState; //工作状态

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getShiftPeriod() {
		return shiftPeriod;
	}

	public void setShiftPeriod(String shiftPeriod) {
		this.shiftPeriod = shiftPeriod;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getWorkState() {
		return workState;
	}

	public void setWorkState(String workState) {
		this.workState = workState;
	}
	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	@Override
	public String toString() {
		return "CheckingInstanceVo [name=" + name + ", number=" + number
				+ ", shiftPeriod=" + shiftPeriod + ", time=" + time
				+ ", workState=" + workState + "]";
	}
	

}
