package cn.com.kxcomm.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * 
 * 功能描述:域用户实体
 * 
 * @author chenliang 新增日期：2013-6-24
 * @since system_center_sdk
 */
@Entity
@SequenceGenerator(name="SEQ_DOMAIN_USER_ID",sequenceName="SEQ_DOMAIN_USER_ID",allocationSize=1)
@Table(name = "tb_domain_user")
public class DomUserEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_DOMAIN_USER_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;
	
	@Column(name = "first_name", updatable = false, nullable = true, insertable = false, length = 150)
	private String firstName; // 姓
	
	@Column(name = "last_name", updatable = false, nullable = true, insertable = false, length = 150)
	private String lastName; // 名
	
	@Column(name = "name", updatable = false, nullable = true, insertable = false, length = 150)
	private String name; // 姓名
	
	@Column(name = "english_name", updatable = false, nullable = true, insertable = false, length = 150)
	private String englishName; // 英文名
	
	@Column(name = "login_name", updatable = false, nullable = false, insertable = false, length = 150)
	private String loginName; // SystemCenter登陆名
	
	@Column(name = "password_name", updatable = false, nullable = false, insertable = false, length = 150)
	private String password; // SystemCenter密码
	
	@Column(name = "not_update_pwd", updatable = false, nullable = false, insertable = false)
	private Short notUpdatePwd; // 用户不能更改密码
	
	@Column(name = "next_update_pwd", updatable = false, nullable = false, insertable = false)
	private Short nextUpdatePwd; // 用户下次登录时须更改密码
	
	@Column(name = "pwd_expired", updatable = false, nullable = false, insertable = false)
	private Short pwdExpired; // 密码永不过期
	
	@Column(name = "account_disabled", updatable = false, nullable = false, insertable = false)
	private Short accountDisabled; // 账户已禁用
	
	@Column(name = "creater", updatable = false, nullable = false, insertable = false)
	private String creater; // 创建者
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "domain_id", nullable = false)
	private DomainEntity domainId; //域id
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "group_id", nullable = false)
	private GroupEntity groupId;//组id
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "virtual_machine_id", nullable = false)
	private VirtualMachineEntity virtualMachineId; //虚拟机id
	
	@OneToMany(mappedBy = "domUserId")
	@Cascade({ CascadeType.ALL })
	private Set<TenantsEntity> tenantsEntity;
	
	public VirtualMachineEntity getVirtualMachineId() {
		return virtualMachineId;
	}

	public void setVirtualMachineId(VirtualMachineEntity virtualMachineId) {
		this.virtualMachineId = virtualMachineId;
	}

	public DomainEntity getDomainId() {
		return domainId;
	}

	public void setDomainId(DomainEntity domainId) {
		this.domainId = domainId;
	}

	public GroupEntity getGroupId() {
		return groupId;
	}

	public void setGroupId(GroupEntity groupId) {
		this.groupId = groupId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEnglishName() {
		return englishName;
	}

	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Short getNotUpdatePwd() {
		return notUpdatePwd;
	}

	public void setNotUpdatePwd(Short notUpdatePwd) {
		this.notUpdatePwd = notUpdatePwd;
	}

	public Short getNextUpdatePwd() {
		return nextUpdatePwd;
	}

	public void setNextUpdatePwd(Short nextUpdatePwd) {
		this.nextUpdatePwd = nextUpdatePwd;
	}

	public Short getPwdExpired() {
		return pwdExpired;
	}

	public void setPwdExpired(Short pwdExpired) {
		this.pwdExpired = pwdExpired;
	}

	public Short getAccountDisabled() {
		return accountDisabled;
	}

	public void setAccountDisabled(Short accountDisabled) {
		this.accountDisabled = accountDisabled;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

}
