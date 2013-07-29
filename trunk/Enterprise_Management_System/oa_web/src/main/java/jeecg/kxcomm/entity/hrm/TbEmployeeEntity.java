package jeecg.kxcomm.entity.hrm;

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
 * @Description: 员工表
 * @author zhangdaihao
 * @date 2013-07-23 14:49:04
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_employee", schema = "")
@SuppressWarnings("serial")
public class TbEmployeeEntity implements java.io.Serializable {
	/**员工主键id*/
	private java.lang.String id;
	/**机构主键id*/
	private TbOrgenEntity orgenId=new TbOrgenEntity();
	/**岗位主键id*/
	private TbPostEntity postId=new TbPostEntity();
	/**身份证*/
	private java.lang.String identityCard;
	/**出生年月*/
	private java.util.Date birthday;
	/**家庭地址*/
	private java.lang.String address;
	/**联系电话*/
	private java.lang.String orgenPhone;
	/**籍贯*/
	private java.lang.String nativePlace;
	/**户口所在地*/
	private java.lang.String domicilePlace;
	/**毕业时间*/
	private java.util.Date graduationDate;
	/**毕业学校*/
	private java.lang.String graduateSchool;
	/**专业*/
	private java.lang.String major;
	/**学历*/
	private java.lang.String educationBackground;
	/**婚否*/
	private java.lang.String marry;
	/**名族*/
	private java.lang.String nation;
	/**性别*/
	private java.lang.String sex;
	/**政治面貌*/
	private java.lang.String politicsStatus;
	/**入职时间*/
	private java.util.Date datesEmployed;
	/**司龄*/
	private java.lang.String workingTime;
	/**邮箱*/
	private java.lang.String eMail;
	/**直系亲属*/
	private java.lang.String immediateFamily;
	/**状态*/
	private java.lang.String status;
	/**银行卡开户行*/
	private java.lang.String openingBank;
	/**银行卡号*/
	private BigDecimal cardNo;
	/**户口性质*/
	private java.lang.String householdProperties;
	/**职称*/
	private java.lang.String jobTitle;
	/**职称级别*/
	private java.lang.String titleLevel;
	/**岗位变动*/
	private java.lang.String changeJobs;
	/**社保保险缴费起始月*/
	private java.util.Date socialSecurityTime;
	/**工号*/
	private java.lang.String jobNo;
	/**员工姓名*/
	private java.lang.String empName;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  员工主键id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=32)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  员工主键id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "orgen_id")
	public TbOrgenEntity getOrgenId() {
		return orgenId;
	}

	public void setOrgenId(TbOrgenEntity orgenId) {
		this.orgenId = orgenId;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "post_id")
	public TbPostEntity getPostId() {
		return postId;
	}

	public void setPostId(TbPostEntity postId) {
		this.postId = postId;
	}
	@Column(name ="E_MAIL",nullable=true,length=50)
	public java.lang.String geteMail() {
		return eMail;
	}

	public void seteMail(java.lang.String eMail) {
		this.eMail = eMail;
	}

	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  身份证
	 */
	@Column(name ="IDENTITY_CARD",nullable=true,length=18)
	public java.lang.String getIdentityCard(){
		return this.identityCard;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  身份证
	 */
	public void setIdentityCard(java.lang.String identityCard){
		this.identityCard = identityCard;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  出生年月
	 */
	@Column(name ="BIRTHDAY",nullable=true)
	public java.util.Date getBirthday(){
		return this.birthday;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  出生年月
	 */
	public void setBirthday(java.util.Date birthday){
		this.birthday = birthday;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  家庭地址
	 */
	@Column(name ="ADDRESS",nullable=true,length=100)
	public java.lang.String getAddress(){
		return this.address;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  家庭地址
	 */
	public void setAddress(java.lang.String address){
		this.address = address;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  联系电话
	 */
	@Column(name ="ORGEN_PHONE",nullable=true,length=50)
	public java.lang.String getOrgenPhone(){
		return this.orgenPhone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  联系电话
	 */
	public void setOrgenPhone(java.lang.String orgenPhone){
		this.orgenPhone = orgenPhone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  籍贯
	 */
	@Column(name ="NATIVE_PLACE",nullable=true,length=10)
	public java.lang.String getNativePlace(){
		return this.nativePlace;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  籍贯
	 */
	public void setNativePlace(java.lang.String nativePlace){
		this.nativePlace = nativePlace;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  户口所在地
	 */
	@Column(name ="DOMICILE_PLACE",nullable=true,length=50)
	public java.lang.String getDomicilePlace(){
		return this.domicilePlace;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  户口所在地
	 */
	public void setDomicilePlace(java.lang.String domicilePlace){
		this.domicilePlace = domicilePlace;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  毕业时间
	 */
	@Column(name ="GRADUATION_DATE",nullable=true)
	public java.util.Date getGraduationDate(){
		return this.graduationDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  毕业时间
	 */
	public void setGraduationDate(java.util.Date graduationDate){
		this.graduationDate = graduationDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  毕业学校
	 */
	@Column(name ="GRADUATE_SCHOOL",nullable=true,length=50)
	public java.lang.String getGraduateSchool(){
		return this.graduateSchool;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  毕业学校
	 */
	public void setGraduateSchool(java.lang.String graduateSchool){
		this.graduateSchool = graduateSchool;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  专业
	 */
	@Column(name ="MAJOR",nullable=true,length=20)
	public java.lang.String getMajor(){
		return this.major;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  专业
	 */
	public void setMajor(java.lang.String major){
		this.major = major;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  学历
	 */
	@Column(name ="EDUCATION_BACKGROUND",nullable=true,length=20)
	public java.lang.String getEducationBackground(){
		return this.educationBackground;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  学历
	 */
	public void setEducationBackground(java.lang.String educationBackground){
		this.educationBackground = educationBackground;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  婚否
	 */
	@Column(name ="MARRY",nullable=true,length=20)
	public java.lang.String getMarry(){
		return this.marry;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  婚否
	 */
	public void setMarry(java.lang.String marry){
		this.marry = marry;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  名族
	 */
	@Column(name ="NATION",nullable=true,length=20)
	public java.lang.String getNation(){
		return this.nation;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  名族
	 */
	public void setNation(java.lang.String nation){
		this.nation = nation;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  性别
	 */
	@Column(name ="SEX",nullable=true,length=2)
	public java.lang.String getSex(){
		return this.sex;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  性别
	 */
	public void setSex(java.lang.String sex){
		this.sex = sex;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  政治面貌
	 */
	@Column(name ="POLITICS_STATUS",nullable=true,length=20)
	public java.lang.String getPoliticsStatus(){
		return this.politicsStatus;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  政治面貌
	 */
	public void setPoliticsStatus(java.lang.String politicsStatus){
		this.politicsStatus = politicsStatus;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  入职时间
	 */
	@Column(name ="DATES_EMPLOYED",nullable=true)
	public java.util.Date getDatesEmployed(){
		return this.datesEmployed;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  入职时间
	 */
	public void setDatesEmployed(java.util.Date datesEmployed){
		this.datesEmployed = datesEmployed;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  司龄
	 */
	@Column(name ="WORKING_TIME",nullable=true,length=50)
	public java.lang.String getWorkingTime() {
		return workingTime;
	}

	public void setWorkingTime(java.lang.String workingTime) {
		this.workingTime = workingTime;
	}


	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  直系亲属
	 */
	@Column(name ="IMMEDIATE_FAMILY",nullable=true,length=50)
	public java.lang.String getImmediateFamily(){
		return this.immediateFamily;
	}


	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  直系亲属
	 */
	public void setImmediateFamily(java.lang.String immediateFamily){
		this.immediateFamily = immediateFamily;
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
	 *@return: java.lang.String  银行卡开户行
	 */
	@Column(name ="OPENING_BANK",nullable=true,length=50)
	public java.lang.String getOpeningBank(){
		return this.openingBank;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  银行卡开户行
	 */
	public void setOpeningBank(java.lang.String openingBank){
		this.openingBank = openingBank;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  银行卡号
	 */
	@Column(name ="CARD_NO",nullable=true,precision=20,scale=0)
	public BigDecimal getCardNo(){
		return this.cardNo;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  银行卡号
	 */
	public void setCardNo(BigDecimal cardNo){
		this.cardNo = cardNo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  户口性质
	 */
	@Column(name ="HOUSEHOLD_PROPERTIES",nullable=true,length=2)
	public java.lang.String getHouseholdProperties(){
		return this.householdProperties;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  户口性质
	 */
	public void setHouseholdProperties(java.lang.String householdProperties){
		this.householdProperties = householdProperties;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  职称
	 */
	@Column(name ="JOB_TITLE",nullable=true,length=20)
	public java.lang.String getJobTitle(){
		return this.jobTitle;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  职称
	 */
	public void setJobTitle(java.lang.String jobTitle){
		this.jobTitle = jobTitle;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  职称级别
	 */
	@Column(name ="TITLE_LEVEL",nullable=true,length=20)
	public java.lang.String getTitleLevel(){
		return this.titleLevel;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  职称级别
	 */
	public void setTitleLevel(java.lang.String titleLevel){
		this.titleLevel = titleLevel;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  岗位变动
	 */
	@Column(name ="CHANGE_JOBS",nullable=true,length=20)
	public java.lang.String getChangeJobs(){
		return this.changeJobs;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  岗位变动
	 */
	public void setChangeJobs(java.lang.String changeJobs){
		this.changeJobs = changeJobs;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  社保保险缴费起始月
	 */
	@Column(name ="SOCIAL_SECURITY_TIME",nullable=true)
	public java.util.Date getSocialSecurityTime(){
		return this.socialSecurityTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  社保保险缴费起始月
	 */
	public void setSocialSecurityTime(java.util.Date socialSecurityTime){
		this.socialSecurityTime = socialSecurityTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  工号
	 */
	@Column(name ="JOB_NO",nullable=true,length=20)
	public java.lang.String getJobNo(){
		return this.jobNo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  工号
	 */
	public void setJobNo(java.lang.String jobNo){
		this.jobNo = jobNo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  empName
	 */
	@Column(name ="EMP_NAME",nullable=true,length=50)
	public java.lang.String getEmpName(){
		return this.empName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  empName
	 */
	public void setEmpName(java.lang.String empName){
		this.empName = empName;
	}
}
