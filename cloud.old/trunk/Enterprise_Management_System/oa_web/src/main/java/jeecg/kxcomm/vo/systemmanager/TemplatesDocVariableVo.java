package jeecg.kxcomm.vo.systemmanager;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocVariableEntity;

/**   
 * @Title: Entity
 * @Description: 合同模板文件变量
 * @author zhangdaihao
 * @date 2013-10-14 18:21:12
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_contract_templates_doc_variable", schema = "")
@SuppressWarnings("serial")
public class TemplatesDocVariableVo implements java.io.Serializable {

	private List<TbContractTemplatesDocVariableEntity> tbContractTemplatesDocVariableList=new ArrayList<TbContractTemplatesDocVariableEntity>();
	
	public List<TbContractTemplatesDocVariableEntity> getTbContractTemplatesDocVariableList() {
		return tbContractTemplatesDocVariableList;
	}

	public void setTbContractTemplatesDocVariableList(
			List<TbContractTemplatesDocVariableEntity> tbContractTemplatesDocVariableList) {
		this.tbContractTemplatesDocVariableList = tbContractTemplatesDocVariableList;
	}

	/**templatesDocVariableId*/
	private java.lang.String Id;
	/**合同模板文件*/
	private TbContractTemplatesDocEntity templatesdocId=new TbContractTemplatesDocEntity();
	/**变量名称*/
	private java.lang.String variablename;
	/**描述*/
	private java.lang.String description;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  templatesDocVariableId
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="TEMPLATES_DOC_VARIABLE_ID",nullable=false,length=32)
	public java.lang.String getId(){
		return this.Id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  templatesDocVariableId
	 */
	public void setId(java.lang.String Id){
		this.Id = Id;
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
	 *@return: java.lang.String  描述
	 */
	@Column(name ="DESCRIPTION",nullable=true,length=100)
	public java.lang.String getDescription(){
		return this.description;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  描述
	 */
	public void setDescription(java.lang.String description){
		this.description = description;
	}
}
