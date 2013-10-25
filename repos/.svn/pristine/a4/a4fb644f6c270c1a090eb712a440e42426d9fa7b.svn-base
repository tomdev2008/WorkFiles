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
 * 功能描述:我的联系人实体类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_CONTACTS_ID",sequenceName="SEQ_CONTACTS_ID",allocationSize=1)
@Table(name = "tb_contacts")
public class TbContacts implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_CONTACTS_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 名字
	 */
	@Column(name = "name", updatable = true, nullable = false, insertable = true,length = 150)
	private String name;
	
	/**
	 * 号码
	 */
	@Column(name = "mdn", updatable = true, nullable = false, insertable = true,length = 20)
	private String mdn;
	
	/**
	 * 生日
	 */
	@Column(name = "birthday", updatable = true, nullable = true, insertable = true)
	private Date birthday;

	/**
	 * 邮箱
	 */
	@Column(name = "email", updatable = true, nullable = true, insertable = true,length = 100)
	private String email;
	

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


	public String getMdn() {
		return mdn;
	}


	public void setMdn(String mdn) {
		this.mdn = mdn;
	}


	public Date getBirthday() {
		return birthday;
	}


	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public TbUsers getUsers() {
		return users;
	}


	public void setUsers(TbUsers users) {
		this.users = users;
	}


	public TbContacts(Integer id, String name, String mdn, Date birthday,
			String email, TbUsers users) {
		super();
		this.id = id;
		this.name = name;
		this.mdn = mdn;
		this.birthday = birthday;
		this.email = email;
		this.users = users;
	}


	public TbContacts() {
		super();
	}


	@Override
	public String toString() {
		return "TbContacts [id=" + id + ", name=" + name + ", mdn=" + mdn
				+ ", birthday=" + birthday + ", email=" + email + "]";
	}

	

}