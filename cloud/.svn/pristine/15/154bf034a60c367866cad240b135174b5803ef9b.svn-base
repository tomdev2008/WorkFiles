package jeecg.kxcomm.entity.systemmanager;

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

/**   
 * @Title: Entity
 * @Description: 数据源详情
 * @author zhangdaihao
 * @date 2013-10-15 15:40:09
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_data_record", schema = "")
@SuppressWarnings("serial")
public class TbDataRecordEntityEntity implements java.io.Serializable {
	/**ID*/
	private java.lang.String id;
	
	private TbDataSourceEntityEntity tbDataSource = new TbDataSourceEntityEntity();
	
	private TbProductTypeEntity tbProductType = new TbProductTypeEntity();
	/**产品订货号*/
	private java.lang.String productorderno;
	/**产品描述*/
	private java.lang.String productdesc;
	/**数量*/
	private java.lang.Integer quantity;
	/**目录单价*/
	private java.lang.String unitprice;
	/**折扣率*/
	private java.lang.String discountrate;
	/**运保及其他费率*/
	private java.lang.String otherrates;
	/**安装服务费*/
	private java.lang.String installservicecharge;
	/**第一年保修复*/
	private java.lang.String firstyear;
	/**第二年保修费*/
	private java.lang.String secondyear;
	/**第三年保修费*/
	private java.lang.String thirdyear;
	/**备注*/
	private java.lang.String remark;
	/**汇率*/
	private java.lang.String exchangeRate;
	
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ID
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="RECORD_ID",nullable=false,length=85)
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
	 *@return: java.lang.String  ID
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "SOURCE_ID")
	public TbDataSourceEntityEntity getTbDataSource(){
		return this.tbDataSource;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ID
	 */
	public void setTbDataSource(TbDataSourceEntityEntity tbDataSource){
		this.tbDataSource = tbDataSource;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ID
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "PRODUCTTYPE_ID")
	public TbProductTypeEntity getTbProductType(){
		return this.tbProductType;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ID
	 */
	public void setTbProductType(TbProductTypeEntity tbProductType){
		this.tbProductType = tbProductType;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  产品订货号
	 */
	@Column(name ="PRODUCTORDERNO",nullable=true,length=16)
	public java.lang.String getProductorderno(){
		return this.productorderno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  产品订货号
	 */
	public void setProductorderno(java.lang.String productorderno){
		this.productorderno = productorderno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  产品描述
	 */
	@Column(name ="PRODUCTDESC",nullable=true,length=33)
	public java.lang.String getProductdesc(){
		return this.productdesc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  产品描述
	 */
	public void setProductdesc(java.lang.String productdesc){
		this.productdesc = productdesc;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  数量
	 */
	@Column(name ="QUANTITY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getQuantity(){
		return this.quantity;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  数量
	 */
	public void setQuantity(java.lang.Integer quantity){
		this.quantity = quantity;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  目录单价
	 */
	@Column(name ="UNITPRICE",nullable=true,length=16)
	public java.lang.String getUnitprice(){
		return this.unitprice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  目录单价
	 */
	public void setUnitprice(java.lang.String unitprice){
		this.unitprice = unitprice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  折扣率
	 */
	@Column(name ="DISCOUNTRATE",nullable=true,length=16)
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
	 *@return: java.lang.String  运保及其他费率
	 */
	@Column(name ="OTHERRATES",nullable=true,length=16)
	public java.lang.String getOtherrates(){
		return this.otherrates;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  运保及其他费率
	 */
	public void setOtherrates(java.lang.String otherrates){
		this.otherrates = otherrates;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  安装服务费
	 */
	@Column(name ="INSTALLSERVICECHARGE",nullable=true,length=16)
	public java.lang.String getInstallservicecharge(){
		return this.installservicecharge;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  安装服务费
	 */
	public void setInstallservicecharge(java.lang.String installservicecharge){
		this.installservicecharge = installservicecharge;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  第一年保修复
	 */
	@Column(name ="FIRSTYEAR",nullable=true,length=16)
	public java.lang.String getFirstyear(){
		return this.firstyear;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  第一年保修复
	 */
	public void setFirstyear(java.lang.String firstyear){
		this.firstyear = firstyear;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  第二年保修费
	 */
	@Column(name ="SECONDYEAR",nullable=true,length=16)
	public java.lang.String getSecondyear(){
		return this.secondyear;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  第二年保修费
	 */
	public void setSecondyear(java.lang.String secondyear){
		this.secondyear = secondyear;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  第三年保修费
	 */
	@Column(name ="THIRDYEAR",nullable=true,length=16)
	public java.lang.String getThirdyear(){
		return this.thirdyear;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  第三年保修费
	 */
	public void setThirdyear(java.lang.String thirdyear){
		this.thirdyear = thirdyear;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */
	@Column(name ="REMARK",nullable=true,length=33)
	public java.lang.String getRemark(){
		return this.remark;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  备注
	 */
	public void setRemark(java.lang.String remark){
		this.remark = remark;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  汇率
	 */
	@Column(name ="EXCHANGE_RATE",nullable=true,length=50)
	public java.lang.String getExchangeRate(){
		return this.exchangeRate;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  汇率
	 */
	public void setExchangeRate(java.lang.String exchangeRate){
		this.exchangeRate = exchangeRate;
	}
}
