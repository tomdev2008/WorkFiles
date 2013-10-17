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
 * @Description: 数据源分类
 * @author zhangdaihao
 * @date 2013-10-15 10:11:50
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_data_source_type", schema = "")
@SuppressWarnings("serial")
public class TbDataSourceTypeEntity implements java.io.Serializable {
	/**ID*/
	private java.lang.String id;
	/**sourcetypename*/
	private java.lang.String sourcetypename;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ID
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="TYPE_ID",nullable=false,length=85)
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
	 *@return: java.lang.String  sourcetypename
	 */
	@Column(name ="SOURCETYPENAME",nullable=true,length=16)
	public java.lang.String getSourcetypename(){
		return this.sourcetypename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  sourcetypename
	 */
	public void setSourcetypename(java.lang.String sourcetypename){
		this.sourcetypename = sourcetypename;
	}
}
