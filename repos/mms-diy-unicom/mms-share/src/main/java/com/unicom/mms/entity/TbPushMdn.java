package com.unicom.mms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 
 * 功能描述:推送号码实体类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_PUSH_MDN_ID",sequenceName="SEQ_PUSH_MDN_ID",allocationSize=1)
@Table(name = "tb_push_mdn")
public class TbPushMdn implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_PUSH_MDN_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 手机号码<br/>
	 * (同个群发任务中，不能重复手机号码，否则会导致给用户推送多条信息，上传的时候做好检验)
	 */
	@Column(name = "mdn", updatable = true, nullable = false, insertable = true, length = 150)
	private String mdn;
	
	/**
	 * 号码类型外键
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "mdn_type_id", nullable = false)
	private TbMdnType mdnType;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMdn() {
		return mdn;
	}

	public void setMdn(String mdn) {
		this.mdn = mdn;
	}

	public TbMdnType getMdnType() {
		return mdnType;
	}

	public void setMdnType(TbMdnType mdnType) {
		this.mdnType = mdnType;
	}
	
	public TbPushMdn(Integer id, String mdn, TbMdnType mdnType) {
		super();
		this.id = id;
		this.mdn = mdn;
		this.mdnType = mdnType;
	}

	public TbPushMdn() {
	}

	
}
