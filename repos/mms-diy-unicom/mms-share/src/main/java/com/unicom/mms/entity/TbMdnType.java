package com.unicom.mms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 
 * 功能描述:号码类型
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_MDN_TYPE_ID",sequenceName="SEQ_MDN_TYPE_ID",allocationSize=1)
@Table(name = "tb_mdn_type")
public class TbMdnType implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_MDN_TYPE_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 类型名称<br/>
	 */
	@Column(name = "type_name", updatable = true, nullable = true, insertable = true, length = 150)
	private String typeName;
	
	/**
	 * 备注<br/>
	 */
	@Column(name = "remark", updatable = true, nullable = true, insertable = true, length = 150)
	private String remark;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public TbMdnType(Integer id, String typeName, String remark) {
		super();
		this.id = id;
		this.typeName = typeName;
		this.remark = remark;
	}

	public TbMdnType() {
	}
	
	
}
