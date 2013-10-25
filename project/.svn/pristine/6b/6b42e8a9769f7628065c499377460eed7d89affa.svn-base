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
@Table(name = "tb_destination_country", schema = "")
@SuppressWarnings("serial")
public class TbDestinationCountryEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**目的国*/
	private java.lang.String destinationCountry;
	
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
	 *@return: java.lang.String  目的国
	 */
	@Column(name ="DESTINATION_COUNTRY",nullable=true,length=255)
	public java.lang.String getDestinationCountry() {
		return destinationCountry;
	}

	public void setDestinationCountry(java.lang.String destinationCountry) {
		this.destinationCountry = destinationCountry;
	}

}
