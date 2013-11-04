package jeecg.kxcomm.entity.contactm;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.CascadeType;
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
import org.jeecgframework.core.annotation.excel.Excel;
import org.jeecgframework.core.annotation.excel.ExcelEntity;

import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 销售订单
 * @author zhangdaihao
 * @date 2013-09-27 17:00:22
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_order", schema = "")
@SuppressWarnings("serial")
public class TbOrderEntity implements java.io.Serializable {
	/**id*/
	private java.lang.String id;
	/**contractId*/
	//private java.lang.String contractId;
	
	@ExcelEntity
	private TbContractEntity tbContract = new TbContractEntity();
	
	/**kxOrderNo*/
	@Excel(exportName="康讯订单号",exportFieldWidth=20,exportConvertSign=0, importConvertSign = 0)
	private java.lang.String kxOrderNo;
	/**projectName*/
	@Excel(exportName="项目名称",exportFieldWidth=20,exportConvertSign=0, importConvertSign = 0)
	private java.lang.String projectName;
	/**contractNo*/
	private java.lang.String contractNo;
	/**client*/
	@Excel(exportName="客户",exportFieldWidth=20,exportConvertSign=0, importConvertSign = 0)
	private java.lang.String client;
	/**finalClient*/
	@Excel(exportName="最终客户",exportFieldWidth=20,exportConvertSign=0, importConvertSign = 0)
	private java.lang.String finalClient;
	/**payment*/
	@Excel(exportName="付款方式",exportFieldWidth=20,exportConvertSign=0, importConvertSign = 0)
	private java.lang.String payment;
	/**principal*/
	@Excel(exportName="负责人",exportFieldWidth=20,exportConvertSign=0, importConvertSign = 0)
	private java.lang.String principal;
	
	@Excel(exportName="订单总价格",exportFieldWidth=20,exportConvertSign=0, importConvertSign = 0)
	private java.lang.String totalPrice;
	
	private java.util.Date createTime;
	
	/**remark*/
	private java.lang.String remark;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=12)
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
//	/**
//	 *方法: 取得java.lang.String
//	 *@return: java.lang.String  contractId
//	 */
//	@Column(name ="CONTRACT_ID",nullable=true,length=85)
//	public java.lang.String getContractId(){
//		return this.contractId;
//	}
//
//	/**
//	 *方法: 设置java.lang.String
//	 *@param: java.lang.String  contractId
//	 */
//	public void setContractId(java.lang.String contractId){
//		this.contractId = contractId;
//	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "contract_id")
	public TbContractEntity  getTbContract() {
		return this.tbContract;
	}

	public void setTbContract(TbContractEntity tbContract) {
		this.tbContract = tbContract;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  kxOrderNo
	 */
	@Column(name ="KX_ORDER_NO",nullable=true,length=16)
	public java.lang.String getKxOrderNo(){
		return this.kxOrderNo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  kxOrderNo
	 */
	public void setKxOrderNo(java.lang.String kxOrderNo){
		this.kxOrderNo = kxOrderNo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  projectName
	 */
	@Column(name ="PROJECT_NAME",nullable=true,length=16)
	public java.lang.String getProjectName(){
		return this.projectName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  projectName
	 */
	public void setProjectName(java.lang.String projectName){
		this.projectName = projectName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  contractNo
	 */
	@Column(name ="CONTRACT_NO",nullable=true,length=16)
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
	 *@return: java.lang.String  client
	 */
	@Column(name ="CLIENT",nullable=true,length=16)
	public java.lang.String getClient(){
		return this.client;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  client
	 */
	public void setClient(java.lang.String client){
		this.client = client;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  finalClient
	 */
	@Column(name ="FINAL_CLIENT",nullable=true,length=16)
	public java.lang.String getFinalClient(){
		return this.finalClient;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  finalClient
	 */
	public void setFinalClient(java.lang.String finalClient){
		this.finalClient = finalClient;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  payment
	 */
	@Column(name ="PAYMENT",nullable=true,length=33)
	public java.lang.String getPayment(){
		return this.payment;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  payment
	 */
	public void setPayment(java.lang.String payment){
		this.payment = payment;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  principal
	 */
	@Column(name ="PRINCIPAL",nullable=true,length=16)
	public java.lang.String getPrincipal(){
		return this.principal;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  principal
	 */
	public void setPrincipal(java.lang.String principal){
		this.principal = principal;
	}
	
	@Column(name ="TOTAL_PRICE",nullable=true,length=16)
	public java.lang.String getTotalPrice(){
		return this.totalPrice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  principal
	 */
	public void setTotalPrice(java.lang.String totalPrice){
		this.totalPrice = totalPrice;
	}
	
	@Column(name ="CREATE_TIME",nullable=true)
	public java.util.Date getCreateTime(){
		return this.createTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  daohuoPaymentDate
	 */
	public void setCreateTime(java.util.Date createTime){
		this.createTime = createTime;
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
}