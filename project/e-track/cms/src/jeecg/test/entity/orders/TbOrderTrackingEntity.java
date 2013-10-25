package jeecg.test.entity.orders;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 订单跟踪信息
 * @author zhangdaihao
 * @date 2013-06-02 17:18:11
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_order_tracking", schema = "")
public class TbOrderTrackingEntity implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	/**主键*/
	private java.lang.String id;
	/**订单id*/
	private TbOrdersEntity orderId;
	/**跟踪信息*/
	private java.lang.String information;
	/**开始时间*/
	private java.util.Date time;
	/**结束时间*/
	private java.util.Date ftime;
	
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
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "order_id")
	public TbOrdersEntity getOrderId() {
		return orderId;
	}

	public void setOrderId(TbOrdersEntity orderId) {
		this.orderId = orderId;
	}

	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  跟踪信息
	 */
	@Column(name ="INFORMATION",nullable=true,length=255)
	public java.lang.String getInformation(){
		return this.information;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  跟踪信息
	 */
	public void setInformation(java.lang.String information){
		this.information = information;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  开始时间
	 */
	@Column(name ="TIME",nullable=true)
	public java.util.Date getTime(){
		return this.time;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  开始时间
	 */
	public void setTime(java.util.Date time){
		this.time = time;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  结束时间
	 */
	@Column(name ="FTIME",nullable=true)
	public java.util.Date getFtime(){
		return this.ftime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  结束时间
	 */
	public void setFtime(java.util.Date ftime){
		this.ftime = ftime;
	}
}
