package jeecg.kxcomm.entity.hrm;

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
 * @Description: 固定资产
 * @author zhangdaihao
 * @date 2013-10-22 11:05:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_permanent_assets", schema = "")
@SuppressWarnings("serial")
public class TbPermanentAssetsEntity implements java.io.Serializable {
	/**固定资产序号*/
	private java.lang.String id;
	/**固定资产类别*/
	private java.lang.String category;
	/**固定资产名称*/
	private java.lang.String name;
	/**规格型号*/
	private java.lang.String model;
	/**配置*/
	private java.lang.String configuration;
	/**数量*/
	private java.lang.String num;
	/**单位*/
	private java.lang.String unit;
	/**购置日期*/
	private java.util.Date buydate;
	/**购置金额*/
	private java.lang.String buymoney;
	/**所在地点*/
	private java.lang.String place;
	/**盘存时间*/
	private java.util.Date inventorydate;
	/**领用人*/
	private java.lang.String users;
	/**领用时间*/
	private java.util.Date usedate;
	/**备注*/
	private java.lang.String remark;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  固定资产序号
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
	 *@param: java.lang.String  固定资产序号
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  固定资产类别
	 */
	@Column(name ="CATEGORY",nullable=true,length=255)
	public java.lang.String getCategory(){
		return this.category;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  固定资产类别
	 */
	public void setCategory(java.lang.String category){
		this.category = category;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  固定资产名称
	 */
	@Column(name ="NAME",nullable=true,length=255)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  固定资产名称
	 */
	public void setName(java.lang.String name){
		this.name = name;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  规格型号
	 */
	@Column(name ="MODEL",nullable=true,length=255)
	public java.lang.String getModel(){
		return this.model;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  规格型号
	 */
	public void setModel(java.lang.String model){
		this.model = model;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  配置
	 */
	@Column(name ="CONFIGURATION",nullable=true,length=255)
	public java.lang.String getConfiguration(){
		return this.configuration;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  配置
	 */
	public void setConfiguration(java.lang.String configuration){
		this.configuration = configuration;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  数量
	 */
	@Column(name ="NUM",nullable=true,length=20)
	public java.lang.String getNum(){
		return this.num;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  数量
	 */
	public void setNum(java.lang.String num){
		this.num = num;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  单位
	 */
	@Column(name ="UNIT",nullable=true,length=20)
	public java.lang.String getUnit(){
		return this.unit;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  单位
	 */
	public void setUnit(java.lang.String unit){
		this.unit = unit;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  购置日期
	 */
	@Column(name ="BUYDATE",nullable=true)
	public java.util.Date getBuydate(){
		return this.buydate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  购置日期
	 */
	public void setBuydate(java.util.Date buydate){
		this.buydate = buydate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  购置金额
	 */
	@Column(name ="BUYMONEY",nullable=true,length=255)
	public java.lang.String getBuymoney(){
		return this.buymoney;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  购置金额
	 */
	public void setBuymoney(java.lang.String buymoney){
		this.buymoney = buymoney;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  所在地点
	 */
	@Column(name ="PLACE",nullable=true,length=255)
	public java.lang.String getPlace(){
		return this.place;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  所在地点
	 */
	public void setPlace(java.lang.String place){
		this.place = place;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  盘存时间
	 */
	@Column(name ="INVENTORYDATE",nullable=true)
	public java.util.Date getInventorydate(){
		return this.inventorydate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  盘存时间
	 */
	public void setInventorydate(java.util.Date inventorydate){
		this.inventorydate = inventorydate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  领用人
	 */
	@Column(name ="USERS",nullable=true,length=255)
	public java.lang.String getUsers(){
		return this.users;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  领用人
	 */
	public void setUsers(java.lang.String users){
		this.users = users;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  领用时间
	 */
	@Column(name ="USEDATE",nullable=true)
	public java.util.Date getUsedate(){
		return this.usedate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  领用时间
	 */
	public void setUsedate(java.util.Date usedate){
		this.usedate = usedate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */
	@Column(name ="REMARK",nullable=true,length=255)
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
}
