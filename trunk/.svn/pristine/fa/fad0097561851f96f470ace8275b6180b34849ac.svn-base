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
 * @Description: 配置单
 * @author zhangdaihao
 * @date 2013-09-16 14:47:59
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_configmodel_data", schema = "")
@SuppressWarnings("serial")
public class TbConfigModelDataEntity implements java.io.Serializable {
	/**id*/
	private java.lang.String id;
	/**ID*/
	private java.lang.String configId;
	/**catalogPrice*/
	private java.lang.String catalogPrice;
	/**discountedAfterPrice*/
	private java.lang.String discountedAfterPrice;
	/**折扣率*/
	private java.lang.String discountrate;
	/**discountedPrice*/
	private java.lang.String discountedPrice;
	/**第一年*/
	private java.lang.String firstYear;
	/**第二年*/
	private java.lang.String secondYear;
	/**第三年*/
	private java.lang.String thirdYear;
	/**数量*/
	private BigDecimal quantity;
	/**总价*/
	private java.lang.String totalPrice;
	
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
	 *@return: java.lang.String  ID
	 */
	@Column(name ="CONFIG_ID",nullable=true,length=10)
	public java.lang.String getConfigId(){
		return this.configId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ID
	 */
	public void setConfigId(java.lang.String configId){
		this.configId = configId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  catalogPrice
	 */
	@Column(name ="CATALOG_PRICE",nullable=true,length=6)
	public java.lang.String getCatalogPrice(){
		return this.catalogPrice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  catalogPrice
	 */
	public void setCatalogPrice(java.lang.String catalogPrice){
		this.catalogPrice = catalogPrice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  discountedAfterPrice
	 */
	@Column(name ="DISCOUNTED_AFTER_PRICE",nullable=true,length=6)
	public java.lang.String getDiscountedAfterPrice(){
		return this.discountedAfterPrice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  discountedAfterPrice
	 */
	public void setDiscountedAfterPrice(java.lang.String discountedAfterPrice){
		this.discountedAfterPrice = discountedAfterPrice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  折扣率
	 */
	@Column(name ="DISCOUNTRATE",nullable=true,length=6)
	public java.lang.String getDiscountrate(){
		return this.discountrate;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  折扣率
	 */
	public void setDiscountrate(java.lang.String discountrate){
		this.discountrate = discountrate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  discountedPrice
	 */
	@Column(name ="DISCOUNTED_PRICE",nullable=true,length=6)
	public java.lang.String getDiscountedPrice(){
		return this.discountedPrice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  discountedPrice
	 */
	public void setDiscountedPrice(java.lang.String discountedPrice){
		this.discountedPrice = discountedPrice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  第一年
	 */
	@Column(name ="FIRST_YEAR",nullable=true,length=16)
	public java.lang.String getFirstYear(){
		return this.firstYear;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  第一年
	 */
	public void setFirstYear(java.lang.String firstYear){
		this.firstYear = firstYear;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  第二年
	 */
	@Column(name ="SECOND_YEAR",nullable=true,length=16)
	public java.lang.String getSecondYear(){
		return this.secondYear;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  第二年
	 */
	public void setSecondYear(java.lang.String secondYear){
		this.secondYear = secondYear;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  第三年
	 */
	@Column(name ="THIRD_YEAR",nullable=true,length=16)
	public java.lang.String getThirdYear(){
		return this.thirdYear;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  第三年
	 */
	public void setThirdYear(java.lang.String thirdYear){
		this.thirdYear = thirdYear;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  数量
	 */
	@Column(name ="QUANTITY",nullable=true,precision=11,scale=0)
	public BigDecimal getQuantity(){
		return this.quantity;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  数量
	 */
	public void setQuantity(BigDecimal quantity){
		this.quantity = quantity;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  总价
	 */
	@Column(name ="TOTAL_PRICE",nullable=true,length=16)
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
}
