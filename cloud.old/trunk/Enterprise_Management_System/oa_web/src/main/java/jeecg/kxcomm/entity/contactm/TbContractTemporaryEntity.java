package jeecg.kxcomm.entity.contactm;

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
 * @Description: 临时合同
 * @author zhangdaihao
 * @date 2013-09-13 14:12:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_contract_temporary", schema = "")
@SuppressWarnings("serial")
public class TbContractTemporaryEntity implements java.io.Serializable {
	/**id*/
	private java.lang.String id;
	/**contractNo*/
	private java.lang.String contractNo;
	/**contractTotalPrice*/
	private java.lang.Double contractTotalPrice;
	/**createTime*/
	private java.util.Date createTime;
	/**fileName*/
	private java.lang.String fileName;
	/**status*/
	private java.lang.Integer status;
	/**title*/
	private java.lang.String title;
	/**creatorId*/
	private java.lang.Integer creatorId;
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,precision=10,scale=0)
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
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  contractTotalPrice
	 */
	@Column(name ="CONTRACT_TOTAL_PRICE",nullable=true,precision=22)
	public java.lang.Double getContractTotalPrice(){
		return this.contractTotalPrice;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  contractTotalPrice
	 */
	public void setContractTotalPrice(java.lang.Double contractTotalPrice){
		this.contractTotalPrice = contractTotalPrice;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  createTime
	 */
	@Column(name ="CREATE_TIME",nullable=false)
	public java.util.Date getCreateTime(){
		return this.createTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  createTime
	 */
	public void setCreateTime(java.util.Date createTime){
		this.createTime = createTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  fileName
	 */
	@Column(name ="FILE_NAME",nullable=true,length=33)
	public java.lang.String getFileName(){
		return this.fileName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  fileName
	 */
	public void setFileName(java.lang.String fileName){
		this.fileName = fileName;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  status
	 */
	@Column(name ="STATUS",nullable=false,precision=10,scale=0)
	public java.lang.Integer getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  status
	 */
	public void setStatus(java.lang.Integer status){
		this.status = status;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  title
	 */
	@Column(name ="TITLE",nullable=false,length=10)
	public java.lang.String getTitle(){
		return this.title;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  title
	 */
	public void setTitle(java.lang.String title){
		this.title = title;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  creatorId
	 */
	@Column(name ="CREATOR_ID",nullable=false,precision=19,scale=0)
	public java.lang.Integer getCreatorId(){
		return this.creatorId;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  creatorId
	 */
	public void setCreatorId(java.lang.Integer creatorId){
		this.creatorId = creatorId;
	}
}
