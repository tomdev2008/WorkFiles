package jeecg.kxcomm.vo.contactm;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import jeecg.kxcomm.entity.systemmanager.TbContractDocEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractDocVariableEntity;

/**   
 * @Title: Entity
 * @Description: 合同文件变量
 * @author zhangdaihao
 * @date 2013-10-26 12:55:06
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_contract_doc_variable", schema = "")
@SuppressWarnings("serial")
public class ContractDocVariableVo implements java.io.Serializable {
	private List<TbContractDocVariableEntity> tbContractDocVariableList=new ArrayList<TbContractDocVariableEntity>();
	
	public List<TbContractDocVariableEntity> getTbContractDocVariableList() {
		return tbContractDocVariableList;
	}

	public void setTbContractDocVariableList(
			List<TbContractDocVariableEntity> tbContractDocVariableList) {
		this.tbContractDocVariableList = tbContractDocVariableList;
	}

	/**docvariable*/
	private java.lang.String id;
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
	@Column(name ="DOCVARIABLE",nullable=false,length=32)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  docvariable
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  docId
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name ="DOC_ID",nullable=true)
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
