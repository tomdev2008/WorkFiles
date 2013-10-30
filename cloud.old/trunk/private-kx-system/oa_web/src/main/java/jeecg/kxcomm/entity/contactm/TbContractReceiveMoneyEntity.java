package jeecg.kxcomm.entity.contactm;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 合同回款
 * @author zhangdaihao
 * @date 2013-10-19 22:04:24
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_contract_receive_money", schema = "")
@SuppressWarnings("serial")
public class TbContractReceiveMoneyEntity implements java.io.Serializable {
	/**合同回款序号*/
	private java.lang.String id;
	/**合同编号*/
	private TbContractEntity tbContract = new TbContractEntity();
	/**回款金额*/
	private java.lang.String receiveMoney;
	/**回款日期*/
	private java.util.Date receivedate;
	/**未回款金额*/
	private java.lang.String notReceiveMoney;
	/**回款备注*/
	private java.lang.String remark;
	/**回款分类*/
	private java.lang.String moneyType;
	/**创建时间*/
	private java.util.Date createTime;
	/**创建人*/
	private java.lang.String createUser;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  合同回款序号
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=255)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  合同回款序号
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	
	/**
	 *方法: 取得TbContractEntity
	 *@return: TbContractEntity  合同编号
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "contract_id")
	public TbContractEntity getTbContract() {
		return tbContract;
	}

	/**
	 *方法: 设置TbContractEntity
	 *@param: TbContractEntity  合同编号
	 */
	public void setTbContract(TbContractEntity tbContract) {
		this.tbContract = tbContract;
	}

	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  回款金额
	 */
	@Column(name ="RECEIVE_MONEY",nullable=true,length=255)
	public java.lang.String getReceiveMoney(){
		return this.receiveMoney;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  回款金额
	 */
	public void setReceiveMoney(java.lang.String receiveMoney){
		this.receiveMoney = receiveMoney;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  回款日期
	 */
	@Column(name ="RECEIVEDATE",nullable=true)
	public java.util.Date getReceivedate(){
		return this.receivedate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  回款日期
	 */
	public void setReceivedate(java.util.Date receivedate){
		this.receivedate = receivedate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  未回款金额
	 */
	@Column(name ="NOT_RECEIVE_MONEY",nullable=true,length=255)
	public java.lang.String getNotReceiveMoney(){
		return this.notReceiveMoney;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  未回款金额
	 */
	public void setNotReceiveMoney(java.lang.String notReceiveMoney){
		this.notReceiveMoney = notReceiveMoney;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  回款备注
	 */
	@Column(name ="REMARK",nullable=true,length=255)
	public java.lang.String getRemark(){
		return this.remark;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  回款备注
	 */
	public void setRemark(java.lang.String remark){
		this.remark = remark;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  回款分类
	 */
	@Column(name ="MONEY_TYPE",nullable=true,length=255)
	public java.lang.String getMoneyType(){
		return this.moneyType;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  回款分类
	 */
	public void setMoneyType(java.lang.String moneyType){
		this.moneyType = moneyType;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建时间
	 */
	@Column(name ="CREATE_TIME",nullable=true)
	public java.util.Date getCreateTime(){
		return this.createTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创建时间
	 */
	public void setCreateTime(java.util.Date createTime){
		this.createTime = createTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建人
	 */
	@Column(name ="CREATE_USER",nullable=true,length=255)
	public java.lang.String getCreateUser(){
		return this.createUser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建人
	 */
	public void setCreateUser(java.lang.String createUser){
		this.createUser = createUser;
	}
}
