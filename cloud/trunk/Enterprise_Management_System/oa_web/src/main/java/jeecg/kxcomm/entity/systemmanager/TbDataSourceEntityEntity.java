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
 * @Description: 数据源
 * @author zhangdaihao
 * @date 2013-10-15 13:40:51
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_data_source", schema = "")
@SuppressWarnings("serial")
public class TbDataSourceEntityEntity implements java.io.Serializable {
	/**ID*/
	private java.lang.String id;
	/**ID*/
	private TbDataSourceTypeEntity tbDataSourceType = new TbDataSourceTypeEntity();
	/**状态*/
	private java.lang.Integer status;
	/**描述*/
	private java.lang.String description;
	/**创建时间*/
	private java.util.Date createtime;
	/**sourcename*/
	private java.lang.String sourcename;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ID
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="SOURCE_ID",nullable=false,length=85)
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
	@JoinColumn(name = "TYPE_ID")
	public TbDataSourceTypeEntity getTbDataSourceType(){
		return this.tbDataSourceType;
	}

	
	public void setTbDataSourceType(TbDataSourceTypeEntity tbDataSourceType){
		this.tbDataSourceType = tbDataSourceType;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  状态
	 */
	@Column(name ="STATUS",nullable=true,precision=10,scale=0)
	public java.lang.Integer getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  状态
	 */
	public void setStatus(java.lang.Integer status){
		this.status = status;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  描述
	 */
	@Column(name ="DESCRIPTION",nullable=true,length=33)
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
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建时间
	 */
	@Column(name ="CREATETIME",nullable=true)
	public java.util.Date getCreatetime(){
		return this.createtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创建时间
	 */
	public void setCreatetime(java.util.Date createtime){
		this.createtime = createtime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  sourcename
	 */
	@Column(name ="SOURCENAME",nullable=true,length=16)
	public java.lang.String getSourcename(){
		return this.sourcename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  sourcename
	 */
	public void setSourcename(java.lang.String sourcename){
		this.sourcename = sourcename;
	}
}
