package jeecg.kxcomm.entity.hrm;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 考勤统计表
 * @author zhangdaihao
 * @date 2013-07-23 14:59:53
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_checking_instance", schema = "")
@SuppressWarnings("serial")
public class TbCheckingInstanceEntity implements java.io.Serializable {
	/**主键id*/
	private java.lang.String id;
	/**机构名称*/
	private java.lang.String orgenName;
	/**应到*/
	private java.lang.Integer empDue;
	/**实到*/
	private java.lang.Integer empActual;
	/**旷工*/
	private java.lang.Integer neglectWork;
	/**迟到*/
	private java.lang.Integer empLate;
	/**早退*/
	private java.lang.Integer leaveEarly;
	/**加班*/
	private java.lang.Integer overtime;
	/**请假*/
	private java.lang.Integer empLeave;
	/**公出*/
	private java.lang.Integer empAway;
	/**周末-加班*/
	private java.lang.Integer weekendOvertime;
	/**时间*/
	private java.util.Date happenday;
	/**员工*/
	private TbEmployeeEntity empId = new TbEmployeeEntity();
	/**员工姓名*/
	private java.lang.String empName;
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,precision=19,scale=0)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  orgenName
	 */
	@Column(name ="ORGEN_NAME",nullable=true,length=100)
	public java.lang.String getOrgenName(){
		return this.orgenName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  orgenName
	 */
	public void setOrgenName(java.lang.String orgenName){
		this.orgenName = orgenName;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  empDue
	 */
	@Column(name ="EMP_DUE",nullable=true,precision=10,scale=0)
	public java.lang.Integer getEmpDue(){
		return this.empDue;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  empDue
	 */
	public void setEmpDue(java.lang.Integer empDue){
		this.empDue = empDue;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  empActual
	 */
	@Column(name ="EMP_ACTUAL",nullable=true,precision=10,scale=0)
	public java.lang.Integer getEmpActual(){
		return this.empActual;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  empActual
	 */
	public void setEmpActual(java.lang.Integer empActual){
		this.empActual = empActual;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  neglectWork
	 */
	@Column(name ="NEGLECT_WORK",nullable=true,precision=10,scale=0)
	public java.lang.Integer getNeglectWork(){
		return this.neglectWork;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  neglectWork
	 */
	public void setNeglectWork(java.lang.Integer neglectWork){
		this.neglectWork = neglectWork;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  empLate
	 */
	@Column(name ="EMP_LATE",nullable=true,precision=10,scale=0)
	public java.lang.Integer getEmpLate(){
		return this.empLate;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  empLate
	 */
	public void setEmpLate(java.lang.Integer empLate){
		this.empLate = empLate;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  leaveEarly
	 */
	@Column(name ="LEAVE_EARLY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getLeaveEarly(){
		return this.leaveEarly;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  leaveEarly
	 */
	public void setLeaveEarly(java.lang.Integer leaveEarly){
		this.leaveEarly = leaveEarly;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  overtime
	 */
	@Column(name ="OVERTIME",nullable=true,precision=10,scale=0)
	public java.lang.Integer getOvertime(){
		return this.overtime;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  overtime
	 */
	public void setOvertime(java.lang.Integer overtime){
		this.overtime = overtime;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  empLeave
	 */
	@Column(name ="EMP_LEAVE",nullable=true,precision=10,scale=0)
	public java.lang.Integer getEmpLeave(){
		return this.empLeave;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  empLeave
	 */
	public void setEmpLeave(java.lang.Integer empLeave){
		this.empLeave = empLeave;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  empAway
	 */
	@Column(name ="EMP_AWAY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getEmpAway(){
		return this.empAway;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  empAway
	 */
	public void setEmpAway(java.lang.Integer empAway){
		this.empAway = empAway;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  weekendOvertime
	 */
	@Column(name ="WEEKEND_OVERTIME",nullable=true,precision=10,scale=0)
	public java.lang.Integer getWeekendOvertime(){
		return this.weekendOvertime;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  weekendOvertime
	 */
	public void setWeekendOvertime(java.lang.Integer weekendOvertime){
		this.weekendOvertime = weekendOvertime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  happenday
	 */
	@Column(name ="HAPPENDAY",nullable=true)
	public java.util.Date getHappenday(){
		return this.happenday;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  happenday
	 */
	public void setHappenday(java.util.Date happenday){
		this.happenday = happenday;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "emp_id")
	public TbEmployeeEntity getEmpId() {
		return this.empId;
	}

	public void setEmpId(TbEmployeeEntity empId) {
		this.empId = empId;
	}

	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  员工姓名
	 */
	@Column(name ="EMP_NAME",nullable=true,length=100)
	public java.lang.String getEmpName(){
		return this.empName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  员工姓名
	 */
	public void setEmpName(java.lang.String empName){
		this.empName = empName;
	}

	@Override
	public String toString() {
		return "TbCheckingInstanceEntity [id=" + this.id + ", orgenName="
				+ this.orgenName + ", empDue=" + this.empDue + ", empActual="
				+ this.empActual + ", neglectWork=" + this.neglectWork
				+ ", empLate=" + this.empLate + ", leaveEarly="
				+ this.leaveEarly + ", overtime=" + this.overtime
				+ ", empLeave=" + this.empLeave + ", empAway=" + this.empAway
				+ ", weekendOvertime=" + this.weekendOvertime + ", happenday="
				+ this.happenday + ", empId=" + this.empId + ", empName="
				+ this.empName + "]";
	}
}
