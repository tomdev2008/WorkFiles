package jeecg.kxcomm.entity.contactm;

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

import jeecg.system.pojo.base.TSUser;

/**   
 * @Title: Entity
 * @Description: 销售发票管理
 * @author zhangdaihao
 * @date 2013-10-26 13:05:48
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_invoice", schema = "")
@SuppressWarnings("serial")
public class TbInvoiceEntity implements java.io.Serializable {
	/**id*/
	private java.lang.String id;
	/**金额*/
	private java.lang.String amount;
	/**创建时间*/
	private java.util.Date createTime;
	/**发票状态：1.已接收；2.未接收*/
	private java.lang.String status;
	/**增值税类型: 1.增值税普通发票；2.增值税专用发票*/
	private java.lang.String taxType;
	/**合同ID*/
	private TbContractEntity contractId = new TbContractEntity();
	/**创建者ID*/
	private TSUser creatorId = new TSUser();
	/**公司名称：1、北京市康讯通讯设备有限公司  2、北京云上云天信息技术有限公司*/
	private java.lang.String purchaseCompanyId;
	/**客户ID*/
	private TbCustomerEntityEntity customerId = new TbCustomerEntityEntity();
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  id
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
	 *@param: java.lang.String  id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  金额
	 */
	@Column(name ="AMOUNT",nullable=true,length=50)
	public java.lang.String getAmount(){
		return this.amount;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  金额
	 */
	public void setAmount(java.lang.String amount){
		this.amount = amount;
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
	 *@return: java.lang.String  发票状态：1.已接收；2.未接收
	 */
	@Column(name ="STATUS",nullable=true,length=5)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  发票状态：1.已接收；2.未接收
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  增值税类型
	 */
	@Column(name ="TAX_TYPE",nullable=true,length=5)
	public java.lang.String getTaxType(){
		return this.taxType;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  增值税类型
	 */
	public void setTaxType(java.lang.String taxType){
		this.taxType = taxType;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  合同ID
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name ="CONTRACT_ID",nullable=true)
	public TbContractEntity getContractId(){
		return this.contractId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  合同ID
	 */
	public void setContractId(TbContractEntity contractId){
		this.contractId = contractId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建者ID
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name ="CREATOR_ID",nullable=true)
	public TSUser getCreatorId(){
		return this.creatorId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建者ID
	 */
	public void setCreatorId(TSUser creatorId){
		this.creatorId = creatorId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公司名称：1、北京市康讯通讯设备有限公司  2、北京云上云天信息技术有限公司
	 */
	@Column(name ="PURCHASE_COMPANY_ID",nullable=true,length=255)
	public java.lang.String getPurchaseCompanyId(){
		return this.purchaseCompanyId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公司名称：1、北京市康讯通讯设备有限公司  2、北京云上云天信息技术有限公司
	 */
	public void setPurchaseCompanyId(java.lang.String purchaseCompanyId){
		this.purchaseCompanyId = purchaseCompanyId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  客户ID
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name ="CUSTOMER_ID",nullable=true)
	public TbCustomerEntityEntity getCustomerId(){
		return this.customerId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  客户ID
	 */
	public void setCustomerId(TbCustomerEntityEntity customerId){
		this.customerId = customerId;
	}
}
