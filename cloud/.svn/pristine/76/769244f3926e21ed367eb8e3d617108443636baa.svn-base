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
 * @Description: 合同文件类型
 * @author zhangdaihao
 * @date 2013-10-14 18:09:49
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_contract_doc_type", schema = "")
@SuppressWarnings("serial")
public class TbContractDocTypeEntity implements java.io.Serializable {
	/**doctypeId*/
	private java.lang.String id;
	/**分类名称*/
	private java.lang.String typename;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  doctypeId
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="DOCTYPE_ID",nullable=false,length=32)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  doctypeId
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  分类名称
	 */
	@Column(name ="TYPENAME",nullable=true,length=30)
	public java.lang.String getTypename(){
		return this.typename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  分类名称
	 */
	public void setTypename(java.lang.String typename){
		this.typename = typename;
	}
}
