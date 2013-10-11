package cn.com.kxcomm.entity;

import java.io.Serializable;
import java.sql.Timestamp;

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
 * 功能描述:租户实体
 * 
 * @author chenliang 新增日期：2013-6-24
 * @since system_center_sdk
 */
@Entity
@SequenceGenerator(name="SEQ_TENANTS_ID",sequenceName="SEQ_TENANTS_ID",allocationSize=1)
@Table(name = "tb_tenants")
public class TenantsEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_TENANTS_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;
	
	@Column(name = "user_name", updatable = false, nullable = false, insertable = false, length = 150)
	private String userName; // 用户名
	
	@Column(name = "email", updatable = false, nullable = false, insertable = false, length = 150)
	private String email; // 邮件
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "dom_user_id", nullable = false)
	private DomUserEntity domUserId; // 域用户id
	
	@Column(name = "account", updatable = false, nullable = false, insertable = false, length = 150)
	private String account; // web登陆账号
	
	@Column(name = "password", updatable = false, nullable = false, insertable = false, length = 150)
	private String password; // web登陆密码
	
	@Column(name = "register_time", updatable = false, nullable = false, insertable = false)
	private Timestamp registerTime; // 注册时间
	
	@Column(name = "un_register_time", updatable = false, nullable = false, insertable = false)
	private Timestamp unRegisterTime; // 注销时间
	
	@Column(name = "login_name", updatable = false, nullable = false, insertable = false , length = 150)
	private String loginName;

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public DomUserEntity getDomUserId() {
		return domUserId;
	}

	public void setDomUserId(DomUserEntity domUserId) {
		this.domUserId = domUserId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Timestamp getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}

	public Timestamp getUnRegisterTime() {
		return unRegisterTime;
	}

	public void setUnRegisterTime(Timestamp unRegisterTime) {
		this.unRegisterTime = unRegisterTime;
	}

}
