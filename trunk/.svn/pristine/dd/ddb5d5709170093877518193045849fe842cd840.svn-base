package jeecg.kxcomm.entity.systemmanager;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 合同文件
 * @author zhangdaihao
 * @date 2013-10-14 18:34:57
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_contract_doc", schema = "")
@SuppressWarnings("serial")
public class TbContractDocEntity implements java.io.Serializable {
	/**docId*/
	private java.lang.String Id;
	/**合同模板文件*/
	private TbContractTemplatesDocEntity templatesdocId=new TbContractTemplatesDocEntity();
	/**创建时间*/
	private java.util.Date createtime;
	/**导出路径*/
	private java.lang.String exportpath;
	/**文件名称*/
	private java.lang.String filename;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  docId
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="DOC_ID",nullable=false,length=32)
	public java.lang.String getId(){
		return this.Id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  docId
	 */
	public void setId(java.lang.String Id){
		this.Id = Id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  templatesdocId
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@Column(name ="TEMPLATESDOC_ID",nullable=true,length=32)
	public TbContractTemplatesDocEntity getTemplatesdocId() {
		return templatesdocId;
	}

	public void setTemplatesdocId(TbContractTemplatesDocEntity templatesdocId) {
		this.templatesdocId = templatesdocId;
	}
	
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建时间
	 */
	@Column(name ="CREATETIME",nullable=true)
	public java.util.Date getCreatetime(){
		return this.createtime;
	}



	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创建时间
	 */
	public void setCreatetime(java.util.Date createtime){
		this.createtime = createtime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  exportpath
	 */
	@Column(name ="EXPORTPATH",nullable=true,length=100)
	public java.lang.String getExportpath(){
		return this.exportpath;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  exportpath
	 */
	public void setExportpath(java.lang.String exportpath){
		this.exportpath = exportpath;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  filename
	 */
	@Column(name ="FILENAME",nullable=true,length=100)
	public java.lang.String getFilename(){
		return this.filename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  filename
	 */
	public void setFilename(java.lang.String filename){
		this.filename = filename;
	}
}
