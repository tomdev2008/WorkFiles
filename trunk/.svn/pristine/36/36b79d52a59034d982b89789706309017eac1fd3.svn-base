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
 * @Description: 项目
 * @author zhangdaihao
 * @date 2013-08-14 16:16:59
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_project", schema = "")
@SuppressWarnings("serial")
public class TbProjectEntityEntity implements java.io.Serializable {
	/**主键ID*/
	private java.lang.String id;
	/**创建时间*/
	private java.util.Date createTime;
	/**描述*/
	private java.lang.String description;
	/**项目名称*/
	private java.lang.String projectName;
	/**用户ID*/
	private java.lang.String userId;
	/**客户ID*/
	private java.lang.String customer;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键ID
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="PROJECT_ID",nullable=false,length=32)
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
	 *@return: java.lang.String  项目名称
	 */
	@Column(name ="PROJECT_NAME",nullable=true,length=50)
	public java.lang.String getProjectName(){
		return this.projectName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  项目名称
	 */
	public void setProjectName(java.lang.String projectName){
		this.projectName = projectName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  用户ID
	 */
	@Column(name ="USER_ID",nullable=true,length=32)
	public java.lang.String getUserId(){
		return this.userId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  用户ID
	 */
	public void setUserId(java.lang.String userId){
		this.userId = userId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  客户ID
	 */
	@Column(name ="CUSTOMER",nullable=true,length=32)
	public java.lang.String getCustomer(){
		return this.customer;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  客户ID
	 */
	public void setCustomer(java.lang.String customer){
		this.customer = customer;
	}
}
