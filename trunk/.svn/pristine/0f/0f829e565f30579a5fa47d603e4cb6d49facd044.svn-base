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
 * @Description: 客户
 * @author zhangdaihao
 * @date 2013-08-14 16:22:35
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_customer", schema = "")
@SuppressWarnings("serial")
public class TbCustomerEntityEntity implements java.io.Serializable {
	/**主键ID*/
	private java.lang.String id;
	/**地址*/
	private java.lang.String address;
	/**公司名称*/
	private java.lang.String companyName;
	/**描述*/
	private java.lang.String description;
	/**联系人*/
	private java.lang.String contact;
	/**邮箱*/
	private java.lang.String email;
	/**电话*/
	private java.lang.String phone;
	/**收货地址ID*/
	private java.lang.String jobPlaceId;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键ID
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="CUSTOMER_ID",nullable=false,length=32)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键ID
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  地址
	 */
	@Column(name ="ADDRESS",nullable=true,length=100)
	public java.lang.String getAddress(){
		return this.address;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  地址
	 */
	public void setAddress(java.lang.String address){
		this.address = address;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公司名称
	 */
	@Column(name ="COMPANY_NAME",nullable=true,length=100)
	public java.lang.String getCompanyName(){
		return this.companyName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公司名称
	 */
	public void setCompanyName(java.lang.String companyName){
		this.companyName = companyName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  描述
	 */
	@Column(name ="DESCRIPTION",nullable=true,length=100)
	public java.lang.String getDescription(){
		return this.description;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  描述
	 */
	public void setDescription(java.lang.String description){
		this.description = description;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  联系人
	 */
	@Column(name ="CONTACT",nullable=true,length=50)
	public java.lang.String getContact(){
		return this.contact;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  联系人
	 */
	public void setContact(java.lang.String contact){
		this.contact = contact;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  邮箱
	 */
	@Column(name ="EMAIL",nullable=true,length=100)
	public java.lang.String getEmail(){
		return this.email;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  邮箱
	 */
	public void setEmail(java.lang.String email){
		this.email = email;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电话
	 */
	@Column(name ="PHONE",nullable=true,length=20)
	public java.lang.String getPhone(){
		return this.phone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电话
	 */
	public void setPhone(java.lang.String phone){
		this.phone = phone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  收货地址ID
	 */
	@Column(name ="JOB_PLACE_ID",nullable=true,length=32)
	public java.lang.String getJobPlaceId(){
		return this.jobPlaceId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  收货地址ID
	 */
	public void setJobPlaceId(java.lang.String jobPlaceId){
		this.jobPlaceId = jobPlaceId;
	}
}
