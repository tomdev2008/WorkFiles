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
 * @Description: 固定资产表
 * @author zhangdaihao
 * @date 2013-07-22 16:35:34
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_permanent_assets", schema = "")
@SuppressWarnings("serial")
public class TbPermanentAssetsEntity implements java.io.Serializable {
	/**固定资产主键id*/
	private java.lang.String id;
	/**员工id*/
	private java.lang.String employeeId;
	/**资产编号*/
	private java.lang.String number;
	/**员工姓名*/
	private java.lang.String name;
	/**资产类型*/
	private java.lang.Integer accType;
	/**状态
            1：使用中
            2：损坏
            3：库存*/
	private java.lang.Integer state;
	/**购入时间*/
	private java.util.Date buyTime;
	/**资产价值*/
	private java.lang.Double price;
	/**备注*/
	private java.lang.String remark;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  固定资产主键id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=50)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  固定资产主键id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  员工id
	 */
	@Column(name ="EMPLOYEE_ID",nullable=true,length=50)
	public java.lang.String getEmployeeId(){
		return this.employeeId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  员工id
	 */
	public void setEmployeeId(java.lang.String employeeId){
		this.employeeId = employeeId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  资产编号
	 */
	@Column(name ="NUMBER",nullable=true,length=100)
	public java.lang.String getNumber(){
		return this.number;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  资产编号
	 */
	public void setNumber(java.lang.String number){
		this.number = number;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  员工姓名
	 */
	@Column(name ="NAME",nullable=true,length=100)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  员工姓名
	 */
	public void setName(java.lang.String name){
		this.name = name;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  资产类型
	 */
	@Column(name ="ACC_TYPE",nullable=true,precision=5,scale=0)
	public java.lang.Integer getAccType(){
		return this.accType;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  资产类型
	 */
	public void setAccType(java.lang.Integer accType){
		this.accType = accType;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  状态
            1：使用中
            2：损坏
            3：库存
	 */
	@Column(name ="STATE",nullable=true,precision=5,scale=0)
	public java.lang.Integer getState(){
		return this.state;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  状态
            1：使用中
            2：损坏
            3：库存
	 */
	public void setState(java.lang.Integer state){
		this.state = state;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  购入时间
	 */
	@Column(name ="BUY_TIME",nullable=true)
	public java.util.Date getBuyTime(){
		return this.buyTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  购入时间
	 */
	public void setBuyTime(java.util.Date buyTime){
		this.buyTime = buyTime;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  资产价值
	 */
	@Column(name ="PRICE",nullable=true,precision=22)
	public java.lang.Double getPrice(){
		return this.price;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  资产价值
	 */
	public void setPrice(java.lang.Double price){
		this.price = price;
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
}
