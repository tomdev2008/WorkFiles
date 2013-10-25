package jeecg.test.entity.orders;

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

import jeecg.system.pojo.base.TSUser;

/**   
 * @Title: Entity
 * @Description: 下单
 * @author zhangdaihao
 * @date 2013-05-29 21:22:19
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_orders", schema = "")
@SuppressWarnings("serial")
public class TbOrdersEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**订单号*/
	private java.lang.String orderNumber;
//	/**备注*/
//	private java.lang.String remark;
	/**代理商*/
	private TbAgentsEntity agentsId = new TbAgentsEntity();
	/**渠道*/
	private TbChannelEntity channelId = new TbChannelEntity();
	/**目的国*/
	private TbDestinationCountryEntity countryId = new TbDestinationCountryEntity();
	/**状态*/
	private java.lang.Integer status;
	/**重要*/
	private java.lang.Integer important;
	/**创单时间*/
	private java.util.Date createTime;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
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
	 *@param: java.lang.String  主键
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  订单号
	 */
	@Column(name ="ORDER_NUMBER",nullable=true,length=255)
	public java.lang.String getOrderNumber(){
		return this.orderNumber;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  订单号
	 */
	public void setOrderNumber(java.lang.String orderNumber){
		this.orderNumber = orderNumber;
	}
//	/**
//	 *方法: 取得java.lang.String
//	 *@return: java.lang.String  备注
//	 */
//	@Column(name ="REMARK",nullable=true,length=255)
//	public java.lang.String getRemark(){
//		return this.remark;
//	}
//
//	/**
//	 *方法: 设置java.lang.String
//	 *@param: java.lang.String  备注
//	 */
//	public void setRemark(java.lang.String remark){
//		this.remark = remark;
//	}

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
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  重要
	 */
	@Column(name ="IMPORTANT",nullable=true,precision=10,scale=0)
	public java.lang.Integer getImportant(){
		return this.important;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  重要
	 */
	public void setImportant(java.lang.Integer important){
		this.important = important;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创单时间
	 */
	@Column(name ="CREATE_TIME",nullable=true)
	public java.util.Date getCreateTime(){
		return this.createTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创单时间
	 */
	public void setCreateTime(java.util.Date createTime){
		this.createTime = createTime;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "agents_id")
	public TbAgentsEntity getAgentsId() {
		return agentsId;
	}

	public void setAgentsId(TbAgentsEntity agentsId) {
		this.agentsId = agentsId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "channel_id")
	public TbChannelEntity getChannelId() {
		return channelId;
	}

	public void setChannelId(TbChannelEntity channelId) {
		this.channelId = channelId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "country_id")
	public TbDestinationCountryEntity getCountryId() {
		return countryId;
	}

	public void setCountryId(TbDestinationCountryEntity countryId) {
		this.countryId = countryId;
	}
	
	@Override
	public String toString() {
		return "TbOrdersEntity [id=" + id + ", orderNumber=" + orderNumber
				+ ", agentsId=" + agentsId + ", channelId=" + channelId
				+ ", countryId=" + countryId + ", status=" + status
				+ ", important=" + important + ", createTime=" + createTime
				+ "]";
	}
}
