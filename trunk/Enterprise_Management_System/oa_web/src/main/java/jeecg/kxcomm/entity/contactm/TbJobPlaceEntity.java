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
 * @Description: 省份
 * @author zhangdaihao
 * @date 2013-10-22 17:15:26
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_job_place", schema = "")
@SuppressWarnings("serial")
public class TbJobPlaceEntity implements java.io.Serializable {
	/**id*/
	private java.lang.String id;
	/**jobPlace*/
	private java.lang.String jobPlace;
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,precision=10,scale=0)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  jobPlace
	 */
	@Column(name ="JOB_PLACE",nullable=true,length=33)
	public java.lang.String getJobPlace(){
		return this.jobPlace;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  jobPlace
	 */
	public void setJobPlace(java.lang.String jobPlace){
		this.jobPlace = jobPlace;
	}
}
