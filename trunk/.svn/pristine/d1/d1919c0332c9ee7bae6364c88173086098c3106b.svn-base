package jeecg.kxcomm.entity.systemmanager;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 区域\地势管理
 * @author zhangdaihao
 * @date 2013-10-17 11:16:33
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_city", schema = "")
@SuppressWarnings("serial")
public class TbCityEntity implements java.io.Serializable {
	/**地市名称*/
	private java.lang.String id;
	/**name*/
	private java.lang.String name;
	/**parentId*/
	private java.lang.String parentId;
	/**地势类型：1=区域、2=省份*/
	private java.lang.String cityType;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  地市名称
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
	 *@param: java.lang.String  地市名称
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  name
	 */
	@Column(name ="NAME",nullable=true,length=50)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  name
	 */
	public void setName(java.lang.String name){
		this.name = name;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  parentId
	 */
	@Column(name ="PARENT_ID",nullable=true,length=32)
	public java.lang.String getParentId(){
		return this.parentId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  parentId
	 */
	public void setParentId(java.lang.String parentId){
		this.parentId = parentId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  地势类型：1=区域、2=省份
	 */
	@Column(name ="CITY_TYPE",nullable=true,length=20)
	public java.lang.String getCityType(){
		return this.cityType;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  地势类型：1=区域、2=省份
	 */
	public void setCityType(java.lang.String cityType){
		this.cityType = cityType;
	}
}
