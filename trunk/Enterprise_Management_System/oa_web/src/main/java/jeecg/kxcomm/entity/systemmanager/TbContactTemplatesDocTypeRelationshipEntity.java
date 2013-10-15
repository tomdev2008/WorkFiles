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
 * @Description: 合同模版文件与文件类型多对多关联表
 * @author zhangdaihao
 * @date 2013-10-14 18:29:26
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_contact_templates_doc_type_relationship", schema = "")
@SuppressWarnings("serial")
public class TbContactTemplatesDocTypeRelationshipEntity implements java.io.Serializable {
	/**templatesdoctype*/
	private java.lang.String id;
	/**合同模板文件*/
	private TbContractTemplatesDocEntity templatesdocId =new TbContractTemplatesDocEntity();
	/**合同文件类型*/
	private TbContractDocTypeEntity doctypeId = new TbContractDocTypeEntity();
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  templatesdoctype
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="TEMPLATESDOCTYPE",nullable=false,length=32)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  templatesdoctype
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  templatesdocId
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name ="TEMPLATESDOC_ID")
	public TbContractTemplatesDocEntity getTemplatesdocId() {
		return templatesdocId;
	}

	public void setTemplatesdocId(TbContractTemplatesDocEntity templatesdocId) {
		this.templatesdocId = templatesdocId;
	}


	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  doctypeId
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name ="DOCTYPE_ID")
	public TbContractDocTypeEntity getDoctypeId() {
		return doctypeId;
	}

	public void setDoctypeId(TbContractDocTypeEntity doctypeId) {
		this.doctypeId = doctypeId;
	}
}
