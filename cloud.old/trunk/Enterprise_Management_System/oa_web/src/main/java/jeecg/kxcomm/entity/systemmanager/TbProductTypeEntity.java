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
 * @Description: 产品类型
 * @author zhangdaihao
 * @date 2013-10-15 19:00:53
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_product_type", schema = "")
@SuppressWarnings("serial")
public class TbProductTypeEntity implements java.io.Serializable {
	/**ID*/
	private java.lang.String id;
	
	private TbProductCategoryEntity tbProductCategory = new TbProductCategoryEntity();
	/**producttypename*/
	private java.lang.String producttypename;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ID
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="PRODUCTTYPE_ID",nullable=false,length=85)
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
	@JoinColumn(name = "CATEGORY_ID")
	public TbProductCategoryEntity getTbProductCategory(){
		return this.tbProductCategory;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ID
	 */
	public void setTbProductCategory(TbProductCategoryEntity tbProductCategory){
		this.tbProductCategory = tbProductCategory;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  producttypename
	 */
	@Column(name ="PRODUCTTYPENAME",nullable=true,length=16)
	public java.lang.String getProducttypename(){
		return this.producttypename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  producttypename
	 */
	public void setProducttypename(java.lang.String producttypename){
		this.producttypename = producttypename;
	}
}
