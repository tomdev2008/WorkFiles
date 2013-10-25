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
 * @Description: 合同报价表关系管理
 * @author zhangdaihao
 * @date 2013-10-25 10:45:06
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_contract_quotations", schema = "")
@SuppressWarnings("serial")
public class TbContractQuotationsEntity implements java.io.Serializable {
	/**id*/
	private java.lang.String id;
	/**quotationsId*/
	private java.lang.String quotationsId;
	/**contractId*/
	private java.lang.String contractId;
	
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
	 *@return: java.lang.String  quotationsId
	 */
	@Column(name ="QUOTATIONS_ID",nullable=true,length=255)
	public java.lang.String getQuotationsId(){
		return this.quotationsId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  quotationsId
	 */
	public void setQuotationsId(java.lang.String quotationsId){
		this.quotationsId = quotationsId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  contractId
	 */
	@Column(name ="CONTRACT_ID",nullable=true,length=255)
	public java.lang.String getContractId(){
		return this.contractId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  contractId
	 */
	public void setContractId(java.lang.String contractId){
		this.contractId = contractId;
	}
}
