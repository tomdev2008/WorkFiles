package jeecg.kxcomm.entity.systemmanager;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 合同文件变量
 * @author zhangdaihao
 * @date 2013-10-14 18:38:45
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_contract_doc_variable", schema = "")
@SuppressWarnings("serial")
public class TbContractDocVariableEntity implements java.io.Serializable {
	/**docvariable*/
	private java.lang.String Id;
	/**docId*/
	private TbContractDocEntity docId=new TbContractDocEntity();
	/**变量名称*/
	private java.lang.String variablename;
	/**内容*/
	private java.lang.String content;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  docvariable
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="DOCVARIABLE",nullable=false,length=32)
	public java.lang.String getId(){
		return this.Id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  docvariable
	 */
	public void setId(java.lang.String Id){
		this.Id = Id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  docId
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@Column(name ="DOC_ID",nullable=true,length=32)
	public TbContractDocEntity getDocId() {
		return docId;
	}

	public void setDocId(TbContractDocEntity docId) {
		this.docId = docId;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  变量名称
	 */
	@Column(name ="VARIABLENAME",nullable=true,length=50)
	public java.lang.String getVariablename(){
		return this.variablename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  变量名称
	 */
	public void setVariablename(java.lang.String variablename){
		this.variablename = variablename;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  内容
	 */
	@Column(name ="CONTENT",nullable=true,length=100)
	public java.lang.String getContent(){
		return this.content;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  内容
	 */
	public void setContent(java.lang.String content){
		this.content = content;
	}
}
