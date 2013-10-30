package jeecg.kxcomm.vo.contactm;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

import jeecg.kxcomm.entity.contactm.TbConfigModelsEntity;
import jeecg.kxcomm.entity.contactm.TbQuotationsDataEntity;
import jeecg.kxcomm.entity.contactm.TbQuotationsEntity;

/**   
 * @Title: Entity
 * @Description: 报价总表
 * @author zhangdaihao
 * @date 2013-10-24 10:18:54
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_quotations_data", schema = "")
@SuppressWarnings("serial")
public class QuotationsDataVo implements java.io.Serializable {
	private List<TbQuotationsDataEntity> quotationsDataList=new ArrayList<TbQuotationsDataEntity>();
	
	public List<TbQuotationsDataEntity> getQuotationsDataList() {
		return quotationsDataList;
	}

	public void setQuotationsDataList(
			List<TbQuotationsDataEntity> quotationsDataList) {
		this.quotationsDataList = quotationsDataList;
	}

	/**id*/
	private java.lang.String id;
	/**name*/
	private java.lang.String name;
	/**ordered*/
	private java.lang.String ordered;
	/**projectName*/
	private java.lang.String projectName;
	/**quantity*/
	private java.lang.Integer quantity;
	/**toUsed*/
	private java.lang.String toUsed;
	/**quotationsId*/
	private TbQuotationsEntity tbQuotations = new TbQuotationsEntity();
	/**configModelsId*/
	private TbConfigModelsEntity tbConfigModels = new TbConfigModelsEntity();
	
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
	 *@return: java.lang.String  name
	 */
	@Column(name ="NAME",nullable=true,length=100)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  name
	 */
	public void setName(java.lang.String name){
		this.name = name;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ordered
	 */
	@Column(name ="ORDERED",nullable=true,length=11)
	public java.lang.String getOrdered(){
		return this.ordered;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ordered
	 */
	public void setOrdered(java.lang.String ordered){
		this.ordered = ordered;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  projectName
	 */
	@Column(name ="PROJECT_NAME",nullable=true,length=50)
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
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  quantity
	 */
	@Column(name ="QUANTITY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getQuantity(){
		return this.quantity;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  quantity
	 */
	public void setQuantity(java.lang.Integer quantity){
		this.quantity = quantity;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  toUsed
	 */
	@Column(name ="TO_USED",nullable=true,length=11)
	public java.lang.String getToUsed(){
		return this.toUsed;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  toUsed
	 */
	public void setToUsed(java.lang.String toUsed){
		this.toUsed = toUsed;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  quotationsId
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "QUOTATIONS_ID")
	public TbQuotationsEntity getTbQuotations(){
		return this.tbQuotations;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  quotationsId
	 */
	public void setTbQuotations(TbQuotationsEntity tbQuotations){
		this.tbQuotations = tbQuotations;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  configModelsId
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "CONFIG_MODELS_ID")
	public TbConfigModelsEntity getTbConfigModels(){
		return this.tbConfigModels;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  configModelsId
	 */
	public void setTbConfigModels(TbConfigModelsEntity tbConfigModels){
		this.tbConfigModels = tbConfigModels;
	}
}
