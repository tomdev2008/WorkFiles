package jeecg.kxcomm.entity.systemmanager;

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
 * @Description: 产品类别
 * @author zhangdaihao
 * @date 2013-10-15 19:04:27
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_product_category", schema = "")
@SuppressWarnings("serial")
public class TbProductCategoryEntity implements java.io.Serializable {
	/**ID*/
	private java.lang.String id;
	/**标记是否乘以数量(0或者空：乘以数量，1：不乘以数量)*/
	private java.lang.Integer isrepeat;
	/**productcategoryname*/
	private java.lang.String productcategoryname;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ID
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="CATEGORY_ID",nullable=false,length=85)
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
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  标记是否乘以数量(0或者空：乘以数量，1：不乘以数量)
	 */
	@Column(name ="ISREPEAT",nullable=true,precision=10,scale=0)
	public java.lang.Integer getIsrepeat(){
		return this.isrepeat;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  标记是否乘以数量(0或者空：乘以数量，1：不乘以数量)
	 */
	public void setIsrepeat(java.lang.Integer isrepeat){
		this.isrepeat = isrepeat;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  productcategoryname
	 */
	@Column(name ="PRODUCTCATEGORYNAME",nullable=true,length=16)
	public java.lang.String getProductcategoryname(){
		return this.productcategoryname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  productcategoryname
	 */
	public void setProductcategoryname(java.lang.String productcategoryname){
		this.productcategoryname = productcategoryname;
	}
}
