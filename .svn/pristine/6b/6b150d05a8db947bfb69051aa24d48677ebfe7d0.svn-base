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
 * @Description: 考勤表
 * @author zhangdaihao
 * @date 2013-07-23 14:39:49
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_checking_in", schema = "")
@SuppressWarnings("serial")
public class TbCheckingInEntity implements java.io.Serializable {
	/**考勤主键id*/
	private java.lang.String id;
	/**员工*/
	private TbEmployeeEntity empId = new TbEmployeeEntity();
	/**状态*/
	private java.lang.String stauts;
	/**原因*/
	private java.lang.String reason;
	/**时间*/
	private java.util.Date time;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  考勤主键id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=32)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  考勤主键id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态
	 */
	@Column(name ="STAUTS",nullable=true,length=50)
	public java.lang.String getStauts(){
		return this.stauts;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态
	 */
	public void setStauts(java.lang.String stauts){
		this.stauts = stauts;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  原因
	 */
	@Column(name ="REASON",nullable=true,length=100)
	public java.lang.String getReason(){
		return this.reason;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  原因
	 */
	public void setReason(java.lang.String reason){
		this.reason = reason;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  时间
	 */
	@Column(name ="TIME",nullable=true)
	public java.util.Date getTime(){
		return this.time;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  时间
	 */
	public void setTime(java.util.Date time){
		this.time = time;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "emp_id")
	public TbEmployeeEntity getEmpId() {
		return this.empId;
	}

	public void setEmpId(TbEmployeeEntity empId) {
		this.empId = empId;
	}
}
