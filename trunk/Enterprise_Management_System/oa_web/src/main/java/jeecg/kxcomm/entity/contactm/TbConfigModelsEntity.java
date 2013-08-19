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
 * @Description: 机型配置
 * @author zhangdaihao
 * @date 2013-08-19 10:56:22
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_config_models", schema = "")
@SuppressWarnings("serial")
public class TbConfigModelsEntity implements java.io.Serializable {
	/**ID*/
	private java.lang.String id;
	/**折扣后现场价*/
	private java.lang.String afterDiscountNowPrice;
	/**折扣后价格*/
	private java.lang.String afterDiscountPrice;
	/**目录合价*/
	private java.lang.String catalogTotalPrice;
	/**创建时间*/
	private java.util.Date createTime;
	/**名称*/
	private java.lang.String name;
	/**状态*/
	private java.lang.String status;
	/**总价*/
	private java.lang.String totalPrice;
	/**类型*/
	private java.lang.String type;
	/**创建者ID*/
	private java.lang.String creatorId;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ID
	 */
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="CONFIG_ID",nullable=false,length=32)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ID
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  折扣后现场价
	 */
	@Column(name ="AFTER_DISCOUNT_NOW_PRICE",nullable=true,length=50)
	public java.lang.String getAfterDiscountNowPrice(){
		return this.afterDiscountNowPrice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  折扣后现场价
	 */
	public void setAfterDiscountNowPrice(java.lang.String afterDiscountNowPrice){
		this.afterDiscountNowPrice = afterDiscountNowPrice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  折扣后价格
	 */
	@Column(name ="AFTER_DISCOUNT_PRICE",nullable=true,length=50)
	public java.lang.String getAfterDiscountPrice(){
		return this.afterDiscountPrice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  折扣后价格
	 */
	public void setAfterDiscountPrice(java.lang.String afterDiscountPrice){
		this.afterDiscountPrice = afterDiscountPrice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  目录合价
	 */
	@Column(name ="CATALOG_TOTAL_PRICE",nullable=true,length=50)
	public java.lang.String getCatalogTotalPrice(){
		return this.catalogTotalPrice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  目录合价
	 */
	public void setCatalogTotalPrice(java.lang.String catalogTotalPrice){
		this.catalogTotalPrice = catalogTotalPrice;
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
	 *@return: java.lang.String  名称
	 */
	@Column(name ="NAME",nullable=true,length=50)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  名称
	 */
	public void setName(java.lang.String name){
		this.name = name;
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
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  总价
	 */
	@Column(name ="TOTAL_PRICE",nullable=true,length=50)
	public java.lang.String getTotalPrice(){
		return this.totalPrice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  总价
	 */
	public void setTotalPrice(java.lang.String totalPrice){
		this.totalPrice = totalPrice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  类型
	 */
	@Column(name ="TYPE",nullable=true,length=20)
	public java.lang.String getType(){
		return this.type;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  类型
	 */
	public void setType(java.lang.String type){
		this.type = type;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建者ID
	 */
	@Column(name ="CREATOR_ID",nullable=true,length=20)
	public java.lang.String getCreatorId(){
		return this.creatorId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建者ID
	 */
	public void setCreatorId(java.lang.String creatorId){
		this.creatorId = creatorId;
	}
}
