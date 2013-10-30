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

import jeecg.kxcomm.entity.systemmanager.TbCityEntity;

/**   
 * @Title: Entity
 * @Description: 岗位和地市的关系管理
 * @author zhangdaihao
 * @date 2013-10-17 15:43:54
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_post_city_relationship", schema = "")
@SuppressWarnings("serial")
public class TbPostCityRelationshipEntity implements java.io.Serializable {
	/**id*/
	private java.lang.String id;
	/**cityId*/
	private TbCityEntity cityId = new TbCityEntity();
	/**postId*/
	private TbPostEntity postId = new TbPostEntity();
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  id
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
	 *@param: java.lang.String  id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  cityId
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "CITY_ID")
	public TbCityEntity getCityId(){
		return this.cityId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  cityId
	 */
	public void setCityId(TbCityEntity cityId){
		this.cityId = cityId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  postId
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "POST_ID")
	public TbPostEntity getPostId(){
		return this.postId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  postId
	 */
	public void setPostId(TbPostEntity postId){
		this.postId = postId;
	}
}
