package com.unicom.mms.entity;

// default package
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
 * 功能描述:分组联系人关系实体类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_GROUP_CONTACTS_ID",sequenceName="SEQ_GROUP_CONTACTS_ID",allocationSize=1)
@Table(name = "tb_group_contacts")
public class TbGroupContacts implements java.io.Serializable {

	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_GROUP_CONTACTS_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;
	/**
	 * 分组
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "groups_id", nullable = false)
	private TbGroups groups;

	/**
	 * 联系人
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "contacts_id", nullable = false)
	private TbContacts contacts;

	public TbGroups getGroups() {
		return groups;
	}

	public void setGroups(TbGroups groups) {
		this.groups = groups;
	}

	public TbContacts getContacts() {
		return contacts;
	}

	public void setContacts(TbContacts contacts) {
		this.contacts = contacts;
	}


	public TbGroupContacts() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TbGroupContacts(Integer id, TbGroups groups, TbContacts contacts) {
		super();
		this.id = id;
		this.groups = groups;
		this.contacts = contacts;
	}

}