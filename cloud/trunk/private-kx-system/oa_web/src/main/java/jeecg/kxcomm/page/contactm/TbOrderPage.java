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

import jeecg.kxcomm.entity.contactm.TbOrderDetailEntity;

/**   
 * @Title: Entity
 * @Description: 销售订单
 * @author zhangdaihao
 * @date 2013-09-24 15:45:03
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_order", schema = "")
@SuppressWarnings("serial")
public class TbOrderPage implements java.io.Serializable {
	/**保存-产品明细*/
	private List<TbOrderDetailEntity> tbOrderDetailList = new ArrayList<TbOrderDetailEntity>();
	public List<TbOrderDetailEntity> getTbOrderDetailList() {
		return tbOrderDetailList;
	}
	public void setTbOrderDetailList(List<TbOrderDetailEntity> tbOrderDetailList) {
		this.tbOrderDetailList = tbOrderDetailList;
	}


	/**id*/
	private java.lang.String id;
	/**kxOrderNo*/
	private java.lang.String kxOrderNo;
	/**projectName*/
	private java.lang.String projectName;
	/**contractNo*/
	private java.lang.String contractNo;
	/**client*/
	private java.lang.String client;
	/**finalClient*/
	private java.lang.String finalClient;
	/**payment*/
	private java.lang.String payment;
	/**principal*/
	private java.lang.String principal;
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
