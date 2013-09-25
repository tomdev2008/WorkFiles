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

/**   
 * @Title: Entity
 * @Description: 数据源详情
 * @author zhangdaihao
 * @date 2013-08-19 10:30:15
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_data_record", schema = "")
@SuppressWarnings("serial")
public class TbDataRecordEntity implements java.io.Serializable {
	/**ID*/
	private java.lang.String id;
	/**ID*/
	private TbDataSourceEntity sourceId=new TbDataSourceEntity();
	/**安装服务费*/
	private java.lang.String installservicecharge;
	/**折扣率*/
	private java.lang.String discountrate;
	/**第一年*/
	private java.lang.String firstYear;
	/**第二年*/
	private java.lang.String secondYear;
	/**第三年*/
	private java.lang.String thirdYear;
	/**其他*/
	private java.lang.String otherrates;
	/**产品描述*/
	private java.lang.String productdesc;
	/**数量*/
	private BigDecimal quantity;
	/**备注*/
	private java.lang.String remark;
	/**目录单价*/
	private java.lang.String unitprice;
	/**类型*/
	private java.lang.String productTypeId;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ID
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="RECORD_ID",nullable=false,length=32)
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
	 *@return: java.lang.String  安装服务费
	 */
	@Column(name ="INSTALLSERVICECHARGE",nullable=true,length=50)
	public java.lang.String getInstallservicecharge(){
		return this.installservicecharge;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ID
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "SOURCE_ID")
	public TbDataSourceEntity getSourceId() {
		return sourceId;
	}

	public void setSourceId(TbDataSourceEntity sourceId) {
		this.sourceId = sourceId;
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
	 *@return: java.lang.String  折扣率
	 */
	@Column(name ="DISCOUNTRATE",nullable=true,length=20)
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
	 *@return: java.lang.String  第一年
	 */
	@Column(name ="FIRST_YEAR",nullable=true,length=50)
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
	@Column(name ="SECOND_YEAR",nullable=true,length=50)
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
	@Column(name ="THIRD_YEAR",nullable=true,length=50)
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  其他
	 */
	@Column(name ="OTHERRATES",nullable=true,length=50)
	public java.lang.String getOtherrates(){
		return this.otherrates;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  其他
	 */
	public void setOtherrates(java.lang.String otherrates){
		this.otherrates = otherrates;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  产品描述
	 */
	@Column(name ="PRODUCTDESC",nullable=true,length=100)
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
	 *@return: java.lang.String  备注
	 */
	@Column(name ="REMARK",nullable=true,length=100)
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
	 *@return: java.lang.String  目录单价
	 */
	@Column(name ="UNITPRICE",nullable=true,length=50)
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
	 *@return: java.lang.String  类型
	 */
	@Column(name ="PRODUCT_TYPE_ID",nullable=true,length=32)
	public java.lang.String getProductTypeId(){
		return this.productTypeId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  类型
	 */
	public void setProductTypeId(java.lang.String productTypeId){
		this.productTypeId = productTypeId;
	}
}
