package jeecg.kxcomm.page.contactm;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

import jeecg.kxcomm.entity.contactm.TbOrderCopyEntity;

/**   
 * @Title: Entity
 * @Description: 销售合同
 * @author zhangdaihao
 * @date 2013-09-26 16:58:31
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_contract", schema = "")
@SuppressWarnings("serial")
public class TbContactPage implements java.io.Serializable {
	/**保存-销售订单*/
	private List<TbOrderCopyEntity> tbOrderCopyList = new ArrayList<TbOrderCopyEntity>();
	public List<TbOrderCopyEntity> getTbOrderCopyList() {
		return tbOrderCopyList;
	}
	public void setTbOrderCopyList(List<TbOrderCopyEntity> tbOrderCopyList) {
		this.tbOrderCopyList = tbOrderCopyList;
	}


	/**id*/
	private java.lang.String id;
	/**contractNo*/
	private java.lang.String contractNo;
	/**contractPrice*/
	private java.lang.String contractPrice;
	/**billingDate*/
	private java.util.Date billingDate;
	/**daohuoPaymentDate*/
	private java.util.Date daohuoPaymentDate;
	/**chuyanPaymentDate*/
	private java.util.Date chuyanPaymentDate;
	/**zhongyanPaymentDate*/
	private java.util.Date zhongyanPaymentDate;
	/**contractFilingDate*/
	private java.util.Date contractFilingDate;
	/**contractSigningDate*/
	private java.util.Date contractSigningDate;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=10)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  contractNo
	 */
	@Column(name ="CONTRACT_NO",nullable=true,length=33)
	public java.lang.String getContractNo(){
		return this.contractNo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  contractNo
	 */
	public void setContractNo(java.lang.String contractNo){
		this.contractNo = contractNo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  contractPrice
	 */
	@Column(name ="CONTRACT_PRICE",nullable=true)
	public java.lang.String getContractPrice(){
		return this.contractPrice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  contractPrice
	 */
	public void setContractPrice(java.lang.String contractPrice){
		this.contractPrice = contractPrice;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  billingDate
	 */
	@Column(name ="BILLING_DATE",nullable=true)
	public java.util.Date getBillingDate(){
		return this.billingDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  billingDate
	 */
	public void setBillingDate(java.util.Date billingDate){
		this.billingDate = billingDate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  daohuoPaymentDate
	 */
	@Column(name ="DAOHUO_PAYMENT_DATE",nullable=true)
	public java.util.Date getDaohuoPaymentDate(){
		return this.daohuoPaymentDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  daohuoPaymentDate
	 */
	public void setDaohuoPaymentDate(java.util.Date daohuoPaymentDate){
		this.daohuoPaymentDate = daohuoPaymentDate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  chuyanPaymentDate
	 */
	@Column(name ="CHUYAN_PAYMENT_DATE",nullable=true)
	public java.util.Date getChuyanPaymentDate(){
		return this.chuyanPaymentDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  chuyanPaymentDate
	 */
	public void setChuyanPaymentDate(java.util.Date chuyanPaymentDate){
		this.chuyanPaymentDate = chuyanPaymentDate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  zhongyanPaymentDate
	 */
	@Column(name ="ZHONGYAN_PAYMENT_DATE",nullable=true)
	public java.util.Date getZhongyanPaymentDate(){
		return this.zhongyanPaymentDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  zhongyanPaymentDate
	 */
	public void setZhongyanPaymentDate(java.util.Date zhongyanPaymentDate){
		this.zhongyanPaymentDate = zhongyanPaymentDate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  contractFilingDate
	 */
	@Column(name ="CONTRACT_FILING_DATE",nullable=true)
	public java.util.Date getContractFilingDate(){
		return this.contractFilingDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  contractFilingDate
	 */
	public void setContractFilingDate(java.util.Date contractFilingDate){
		this.contractFilingDate = contractFilingDate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  contractSigningDate
	 */
	@Column(name ="CONTRACT_SIGNING_DATE",nullable=true)
	public java.util.Date getContractSigningDate(){
		return this.contractSigningDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  contractSigningDate
	 */
	public void setContractSigningDate(java.util.Date contractSigningDate){
		this.contractSigningDate = contractSigningDate;
	}
}
