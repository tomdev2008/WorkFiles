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

import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesEntityEntity;
import jeecg.system.pojo.base.TSUser;

/**   
 * @Title: Entity
 * @Description: 销售合同
 * @author zhangdaihao
 * @date 2013-09-27 17:00:23
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_contract", schema = "")
@SuppressWarnings("serial")
public class TbContractEntity implements java.io.Serializable {
	/**id*/
	private java.lang.String id;
	/**外部合同号*/
	private java.lang.String contractNo;
	/**内部合同号*/
	private java.lang.String contractNumber;
	/**创建时间*/
	private java.util.Date createTime;
	/**签订日期*/
	private java.util.Date contractDate;
	/**下载地址*/
	private java.lang.String downloadUrl;
	/**报价表地址*/
	private java.lang.String quotationsExcel;
	/**状态*/
	private java.lang.String status;
	/**合同名称*/
	private java.lang.String contractName;
	/**合同模板*/
	private TbContractTemplatesEntityEntity contractTemplatesId = new TbContractTemplatesEntityEntity();
	/**项目名称*/
	private TbProjectEntityEntity projectId = new TbProjectEntityEntity();
	/**创建者*/
	private TSUser creatorId = new TSUser();
	/**临时合同上传的附件*/
	private java.lang.String fileName;
	/**合同类型（1、正式合同 2、临时合同）*/
	private java.lang.String contactType;
	/**合同金额*/
	private java.lang.String contractTotalPrice;
	/**备注*/
	private java.lang.String remark;
	/**所包含临时合同*/
	private java.lang.String parentId;
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  id
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=85)
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
	@Column(name ="CONTRACT_NO",nullable=true,length=255)
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
	 *@return: java.lang.String  remark
	 */
	@Column(name ="REMARK",nullable=true,length=85)
	public java.lang.String getRemark(){
		return this.remark;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  remark
	 */
	public void setRemark(java.lang.String remark){
		this.remark = remark;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  remark
	 */
	@Column(name ="CONTACT_TYPE",nullable=true,length=5)
	public java.lang.String getContactType() {
		return contactType;
	}

	public void setContactType(java.lang.String contactType) {
		this.contactType = contactType;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  remark
	 */
	@Column(name ="CONTRACT_NAME",nullable=true,length=100)
	public java.lang.String getContractName() {
		return contractName;
	}

	public void setContractName(java.lang.String contractName) {
		this.contractName = contractName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  
	 */
	@Column(name ="CONTRACT_NUMBER",nullable=true,length=255)
	public java.lang.String getContractNumber() {
		return contractNumber;
	}

	public void setContractNumber(java.lang.String contractNumber) {
		this.contractNumber = contractNumber;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String 
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name ="contract_templates_id",nullable=true)
	public TbContractTemplatesEntityEntity getContractTemplatesId() {
		return contractTemplatesId;
	}

	public void setContractTemplatesId(
			TbContractTemplatesEntityEntity contractTemplatesId) {
		this.contractTemplatesId = contractTemplatesId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  
	 */
	@Column(name ="contract_total_price",nullable=true,length=255)
	public java.lang.String getContractTotalPrice() {
		return contractTotalPrice;
	}

	public void setContractTotalPrice(java.lang.String contractTotalPrice) {
		this.contractTotalPrice = contractTotalPrice;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建时间
	 */
	@Column(name ="CREATE_TIME",nullable=true)
	public java.util.Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String 
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name ="creator_id",nullable=true)
	public TSUser getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(TSUser creatorId) {
		this.creatorId = creatorId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  
	 */
	@Column(name ="download_url",nullable=true,length=255)
	public java.lang.String getDownloadUrl() {
		return downloadUrl;
	}

	public void setDownloadUrl(java.lang.String downloadUrl) {
		this.downloadUrl = downloadUrl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  
	 */
	@Column(name ="file_name",nullable=true,length=255)
	public java.lang.String getFileName() {
		return fileName;
	}

	public void setFileName(java.lang.String fileName) {
		this.fileName = fileName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  
	 */
	@Column(name ="parent_id",nullable=true,length=255)
	public java.lang.String getParentId() {
		return parentId;
	}

	public void setParentId(java.lang.String parentId) {
		this.parentId = parentId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String projectId
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name ="project_id",nullable=true)
	public TbProjectEntityEntity getProjectId() {
		return projectId;
	}

	public void setProjectId(TbProjectEntityEntity projectId) {
		this.projectId = projectId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  
	 */
	@Column(name ="quotations_excel",nullable=true,length=255)
	public java.lang.String getQuotationsExcel() {
		return quotationsExcel;
	}

	public void setQuotationsExcel(java.lang.String quotationsExcel) {
		this.quotationsExcel = quotationsExcel;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  
	 */
	@Column(name ="status",nullable=true,length=5)
	public java.lang.String getStatus() {
		return status;
	}

	public void setStatus(java.lang.String status) {
		this.status = status;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建时间
	 */
	@Column(name ="contract_date",nullable=true)
	public java.util.Date getContractDate() {
		return contractDate;
	}

	public void setContractDate(java.util.Date contractDate) {
		this.contractDate = contractDate;
	}
	
	
	
}
