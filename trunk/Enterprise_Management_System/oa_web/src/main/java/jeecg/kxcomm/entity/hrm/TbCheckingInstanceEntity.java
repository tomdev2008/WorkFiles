package jeecg.kxcomm.entity.hrm;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	private java.lang.String empId;
	/**id*/
	private java.lang.Integer id;
	/**员工姓名*/
	private java.lang.String empName;
	/**orgenName*/
	private java.lang.String orgenName;
	/**empDue*/
	private java.lang.Integer empDue;
	/**empActual*/
	private java.lang.Integer empActual;
	/**neglectWork*/
	private java.lang.Integer neglectWork;
	/**empLate*/
	private java.lang.Integer empLate;
	/**leaveEarly*/
	private java.lang.Integer leaveEarly;
	/**overtime*/
	private java.lang.Integer overtime;
	/**empLeave*/
	private java.lang.Integer empLeave;
	/**empAway*/
	private java.lang.Integer empAway;
	/**weekendOvertime*/
	private java.lang.Integer weekendOvertime;
	/**happenday*/
	private java.util.Date happenday;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键id
	 */
	@Column(name ="EMP_ID",nullable=true,length=50)
	public java.lang.String getEmpId(){
		return this.empId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键id
	 */
	public void setEmpId(java.lang.String empId){
		this.empId = empId;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,precision=19,scale=0)
	public java.lang.Integer getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  id
	 */
	public void setId(java.lang.Integer id){
		this.id = id;
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
}
