package jeecg.test.entity.orders;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 渠道
 * @author zhangdaihao
 * @date 2013-05-29 21:22:19
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_channel", schema = "")
@SuppressWarnings("serial")
public class TbChannelEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**渠道*/
	private java.lang.String name;
	/**英文渠道*/
	private java.lang.String com;
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
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  渠道
	 */
	@Column(name ="NAME",nullable=true,length=255)
	public java.lang.String getName() {
		return name;
	}
	
	public void setName(java.lang.String name) {
		this.name = name;
	}

	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  英文渠道
	 */
	@Column(name ="com",nullable=true,length=255)
	public java.lang.String getCom() {
		return com;
	}

	public void setCom(java.lang.String com) {
		this.com = com;
	}


}
