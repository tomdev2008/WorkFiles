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
 * @Description: 机构表
 * @author zhangdaihao
 * @date 2013-07-22 16:31:08
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_orgen", schema = "")
@SuppressWarnings("serial")
public class TbOrgenEntity implements java.io.Serializable {
	/**机构主键id*/
	private java.lang.String id;
	/**员工姓名*/
	private java.lang.String name;
	/**联系电话*/
	private java.lang.String phone;
	/**地址*/
	private java.lang.String place;
	/**类型*/
	private java.lang.Integer type;
	/**成立时间*/
	private java.util.Date createTime;
	/**上级机构*/
	private java.lang.Integer parentOrgen;
	/**资产编号*/
	private java.lang.String number;
	/**手机号码*/
	private java.lang.String tellPhone;
	/**税务登记证*/
	private java.lang.String businessLicenseNo;
	/**开户行名称*/
	private java.lang.String bankName;
	/**营业执照*/
	private java.lang.String taxRegistrationCertificate;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  机构主键id
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
	 *@param: java.lang.String  机构主键id
	 */
	public void setId(java.lang.String id){
		this.id = id;
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  联系电话
	 */
	@Column(name ="PHONE",nullable=true,length=50)
	public java.lang.String getPhone(){
		return this.phone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  联系电话
	 */
	public void setPhone(java.lang.String phone){
		this.phone = phone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  地址
	 */
	@Column(name ="PLACE",nullable=true,length=100)
	public java.lang.String getPlace(){
		return this.place;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  地址
	 */
	public void setPlace(java.lang.String place){
		this.place = place;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  类型
	 */
	@Column(name ="TYPE",nullable=true,precision=5,scale=0)
	public java.lang.Integer getType(){
		return this.type;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  类型
	 */
	public void setType(java.lang.Integer type){
		this.type = type;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  成立时间
	 */
	@Column(name ="CREATE_TIME",nullable=true)
	public java.util.Date getCreateTime(){
		return this.createTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  成立时间
	 */
	public void setCreateTime(java.util.Date createTime){
		this.createTime = createTime;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  上级机构
	 */
	@Column(name ="PARENT_ORGEN",nullable=true,precision=10,scale=0)
	public java.lang.Integer getParentOrgen(){
		return this.parentOrgen;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  上级机构
	 */
	public void setParentOrgen(java.lang.Integer parentOrgen){
		this.parentOrgen = parentOrgen;
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
	 *@return: java.lang.String  手机号码
	 */
	@Column(name ="TELL_PHONE",nullable=true,length=50)
	public java.lang.String getTellPhone(){
		return this.tellPhone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  手机号码
	 */
	public void setTellPhone(java.lang.String tellPhone){
		this.tellPhone = tellPhone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  税务登记证
	 */
	@Column(name ="BUSINESS_LICENSE_NO",nullable=true,length=100)
	public java.lang.String getBusinessLicenseNo(){
		return this.businessLicenseNo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  税务登记证
	 */
	public void setBusinessLicenseNo(java.lang.String businessLicenseNo){
		this.businessLicenseNo = businessLicenseNo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  开户行名称
	 */
	@Column(name ="BANK_NAME",nullable=true,length=100)
	public java.lang.String getBankName(){
		return this.bankName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  开户行名称
	 */
	public void setBankName(java.lang.String bankName){
		this.bankName = bankName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  营业执照
	 */
	@Column(name ="TAX_REGISTRATION_CERTIFICATE",nullable=true,length=100)
	public java.lang.String getTaxRegistrationCertificate(){
		return this.taxRegistrationCertificate;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  营业执照
	 */
	public void setTaxRegistrationCertificate(java.lang.String taxRegistrationCertificate){
		this.taxRegistrationCertificate = taxRegistrationCertificate;
	}
}
