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
 * @Description: 员工合同表
 * @author zhangdaihao
 * @date 2013-07-22 16:34:08
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_employee_contracts", schema = "")
@SuppressWarnings("serial")
public class TbEmployeeContractsEntity implements java.io.Serializable {
	/**员工合同主键ID*/
	private java.lang.String id;
	/**员工id*/
	private java.lang.String employeeId;
	/**合同生效日期*/
	private java.util.Date contractEffectiveDate;
	/**合同终止日期*/
	private java.util.Date contractEndDate;
	/**合同签订日期*/
	private java.util.Date contractDate;
	/**状态*/
	private java.lang.String status;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  员工合同主键ID
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=50)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  员工合同主键ID
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  员工id
	 */
	@Column(name ="EMPLOYEE_ID",nullable=true,length=50)
	public java.lang.String getEmployeeId(){
		return this.employeeId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  员工id
	 */
	public void setEmployeeId(java.lang.String employeeId){
		this.employeeId = employeeId;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  合同生效日期
	 */
	@Column(name ="CONTRACT_EFFECTIVE_DATE",nullable=true)
	public java.util.Date getContractEffectiveDate(){
		return this.contractEffectiveDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  合同生效日期
	 */
	public void setContractEffectiveDate(java.util.Date contractEffectiveDate){
		this.contractEffectiveDate = contractEffectiveDate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  合同终止日期
	 */
	@Column(name ="CONTRACT_END_DATE",nullable=true)
	public java.util.Date getContractEndDate(){
		return this.contractEndDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  合同终止日期
	 */
	public void setContractEndDate(java.util.Date contractEndDate){
		this.contractEndDate = contractEndDate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  合同签订日期
	 */
	@Column(name ="CONTRACT_DATE",nullable=true)
	public java.util.Date getContractDate(){
		return this.contractDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  合同签订日期
	 */
	public void setContractDate(java.util.Date contractDate){
		this.contractDate = contractDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态
	 */
	@Column(name ="STATUS",nullable=true,length=2)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
}
