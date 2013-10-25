package com.unicom.mms.entity;

// default package

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * 
 * 功能描述: 终端用户实体
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_USERS_ID",sequenceName="SEQ_USERS_ID",allocationSize=1)
@Table(name = "tb_users")
public class TbUsers implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_USERS_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;

	/**
	 * 用户号码
	 */
	@Column(name = "mdn", updatable = true, nullable = false, insertable = true, length = 32)
	private String mdn;

	/**
	 * 密码
	 */
	@Column(name = "pwd", updatable = true, nullable = false, insertable = true, length = 100)
	private String pwd;

	/**
	 * 注册时间
	 */
	@Column(name = "register_time", updatable = true, nullable = false, insertable = true)
	private Date registerTime;

	/**
	 * 注销时间
	 */
	@Column(name = "unregister_time", updatable = true, nullable = false, insertable = true)
	private Date unregisterTime;

	/**
	 * 状态：0显示，1不显示
	 */
	@Column(name = "status", updatable = true, nullable = false, insertable = true, length = 32)
	private Integer status;

	
	@OneToMany(mappedBy = "users")
	@Cascade({CascadeType.ALL })
	private Set<TbCollect> collect;
	
	@OneToMany(mappedBy = "users")
	@Cascade({CascadeType.ALL })
	private Set<TbGroups> groups;
	
	@OneToMany(mappedBy = "users")
	@Cascade({CascadeType.ALL })
	private Set<TbContacts> contacts;
	
	@OneToMany(mappedBy = "users")
	@Cascade({CascadeType.ALL })
	private Set<TbUserOrder> userOrder;
	
	@OneToMany(mappedBy = "users")
	@Cascade({CascadeType.ALL })
	private Set<TbUserPhoto> userPhoto;
	
	// Constructors
	/** default constructor */
	public TbUsers() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMdn() {
		return mdn;
	}

	public void setMdn(String mdn) {
		this.mdn = mdn;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public Date getUnregisterTime() {
		return unregisterTime;
	}

	public void setUnregisterTime(Date unregisterTime) {
		this.unregisterTime = unregisterTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public TbUsers(Long id, String mdn, String pwd, Date registerTime,
			Date unregisterTime, Integer status) {
		super();
		this.id = id;
		this.mdn = mdn;
		this.pwd = pwd;
		this.registerTime = registerTime;
		this.unregisterTime = unregisterTime;
		this.status = status;
	}

	@Override
	public String toString() {
		return "TbUsers [id=" + id + ", mdn=" + mdn + ", pwd=" + pwd
				+ ", registerTime=" + registerTime + ", unregisterTime="
				+ unregisterTime + ", status=" + status + "]";
	}

}