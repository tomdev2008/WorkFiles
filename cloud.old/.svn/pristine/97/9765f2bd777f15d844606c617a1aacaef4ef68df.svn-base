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
 * @Description: 产品库存
 * @author zhangdaihao
 * @date 2013-10-22 11:08:57
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_inventory", schema = "")
@SuppressWarnings("serial")
public class TbInventoryEntity implements java.io.Serializable {
	/**库存序号*/
	private java.lang.String id;
	/**产品类别*/
	private java.lang.String category;
	/**产品名称*/
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
	/**合同号*/
	private java.lang.String contractno;
	/**康讯订单号*/
	private java.lang.String kxorderno;
	/**所在地点*/
	private java.lang.String place;
	/**盘存时间*/
	private java.util.Date inventorydate;
	/**领用人*/
	private java.lang.String users;
	/**领用时间*/
	private java.util.Date usedate;
	/**领用数量*/
	private java.lang.String usenum;
	/**备注*/
	private java.lang.String remark;
	/**状态*/
	private java.lang.String status;
	/**出库时间*/
	private java.util.Date outdate;
	/**出库编号*/
	private java.lang.String outno;
	/**出库用途*/
	private java.lang.String outdescribe;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  库存序号
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
	 *@param: java.lang.String  库存序号
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  产品类别
	 */
	@Column(name ="CATEGORY",nullable=true,length=255)
	public java.lang.String getCategory(){
		return this.category;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  产品类别
	 */
	public void setCategory(java.lang.String category){
		this.category = category;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  产品名称
	 */
	@Column(name ="NAME",nullable=true,length=255)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  产品名称
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
	 *@return: java.lang.String  合同号
	 */
	@Column(name ="CONTRACTNO",nullable=true,length=255)
	public java.lang.String getContractno(){
		return this.contractno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  合同号
	 */
	public void setContractno(java.lang.String contractno){
		this.contractno = contractno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  康讯订单号
	 */
	@Column(name ="KXORDERNO",nullable=true,length=255)
	public java.lang.String getKxorderno(){
		return this.kxorderno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  康讯订单号
	 */
	public void setKxorderno(java.lang.String kxorderno){
		this.kxorderno = kxorderno;
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
	 *@return: java.lang.String  领用数量
	 */
	@Column(name ="USENUM",nullable=true,length=255)
	public java.lang.String getUsenum(){
		return this.usenum;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  领用数量
	 */
	public void setUsenum(java.lang.String usenum){
		this.usenum = usenum;
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
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态
	 */
	@Column(name ="STATUS",nullable=true,length=255)
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
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  出库时间
	 */
	@Column(name ="OUTDATE",nullable=true)
	public java.util.Date getOutdate(){
		return this.outdate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  出库时间
	 */
	public void setOutdate(java.util.Date outdate){
		this.outdate = outdate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  出库编号
	 */
	@Column(name ="OUTNO",nullable=true,length=255)
	public java.lang.String getOutno(){
		return this.outno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  出库编号
	 */
	public void setOutno(java.lang.String outno){
		this.outno = outno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  出库用途
	 */
	@Column(name ="OUTDESCRIBE",nullable=true,length=255)
	public java.lang.String getOutdescribe(){
		return this.outdescribe;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  出库用途
	 */
	public void setOutdescribe(java.lang.String outdescribe){
		this.outdescribe = outdescribe;
	}
}
