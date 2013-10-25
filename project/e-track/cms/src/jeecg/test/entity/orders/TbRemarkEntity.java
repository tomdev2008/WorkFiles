package jeecg.test.entity.orders;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import jeecg.system.pojo.base.TSUser;

import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 用户备注
 * @author zhangdaihao
 * @date 2013-05-29 21:22:19
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_remark", schema = "")
@SuppressWarnings("serial")
public class TbRemarkEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**代理商*/
	private java.lang.String remark;
	/**用户id*/
	private TSUser userId = new TSUser();
	
	private TbOrdersEntity ordersId = new TbOrdersEntity();
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=255)
	public java.lang.String getId() {
		return id;
	}
	
	public void setId(java.lang.String id) {
		this.id = id;
	}

	@Column(name ="remark",nullable=true,precision=10,scale=0)
	public java.lang.String getRemark() {
		return remark;
	}

	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "orders_id")
	public TbOrdersEntity getOrdersId() {
		return ordersId;
	}

	public void setOrdersId(TbOrdersEntity ordersId) {
		this.ordersId = ordersId;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public TSUser getUserId() {
		return userId;
	}
	
	public void setUserId(TSUser userId) {
		this.userId = userId;
	}
}
