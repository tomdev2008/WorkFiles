package com.unicom.mms.entity;

// default package

import java.util.Date;
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
 * 功能描述:分组实体类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_GROUPS_ID",sequenceName="SEQ_GROUPS_ID",allocationSize=1)
@Table(name = "tb_groups")
public class TbGroups implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_GROUPS_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 组名
	 */
	@Column(name = "name", updatable = true, nullable = false, insertable = true,length = 150)
	private String name;

	/**
	 * 终端用户
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	private TbUsers users;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public TbUsers getUsers() {
		return users;
	}

	public void setUsers(TbUsers users) {
		this.users = users;
	}

	public TbGroups(Integer id, String name, TbUsers users) {
		super();
		this.id = id;
		this.name = name;
		this.users = users;
	}

	public TbGroups() {
		super();
	}

	@Override
	public String toString() {
		return "TbGroups [id=" + id + ", name=" + name + "]";
	}
}