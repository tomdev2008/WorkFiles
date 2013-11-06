package cn.com.kxcomm.selfservice.entity;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.SequenceGenerator;

import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 
* 功能描述: 用户实体
* @author chenliang 新增日期：2013-1-31
* @since mms-cms-unicom
 */
@Entity
//@SequenceGenerator(name="SEQ_CMS_USER_ID",sequenceName="SEQ_CMS_USER_ID",allocationSize=1)
@Table(name = "tb_cms_user")
public class TbCmsUser implements java.io.Serializable {

	// Fields
	@Override
	public String toString() {
		return "TbUser [id=" + id + ", userName="
				+ userName + ", accouont=" + accouont + ", email=" + email
				+ ", note=" + note + ", password=" + password
				+ ", phoneNumber=" + phoneNumber + "]";
	}

	private Long id;
	private TbRole tbRole;
	private String userName;
	private String accouont;
	private String email;
	private String note;
	private String password;
	private String phoneNumber;

	@Id
	//@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_CMS_USER_ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	@GenericGenerator(name = "gen", strategy = "uuid")
	@Column(name = "id",  nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id", nullable = false)
	public TbRole getTbRole() {
		return this.tbRole;
	}

	public void setTbRole(TbRole tbRole) {
		this.tbRole = tbRole;
	}

	@Column(name = "user_name", nullable = false, length = 20)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "accouont", nullable = false, length = 20)
	public String getAccouont() {
		return this.accouont;
	}

	public void setAccouont(String accouont) {
		this.accouont = accouont;
	}

	@Column(name = "email", nullable = false, length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "note", length = 200)
	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Column(name = "password", nullable = false, length = 40)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "phone_number", nullable = false, length = 30)
	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	/** default constructor */;
	public TbCmsUser() {
	}

	/** minimal constructor */
	public TbCmsUser(TbRole tbRole, String userName, String accouont,
			String email, String password, String phoneNumber) {
		this.tbRole = tbRole;
		this.userName = userName;
		this.accouont = accouont;
		this.email = email;
		this.password = password;
		this.phoneNumber = phoneNumber;
	}

	/** full constructor */
	public TbCmsUser(TbRole tbRole, String userName, String accouont,
			String email, String note, String password, String phoneNumber) {
		this.tbRole = tbRole;
		this.userName = userName;
		this.accouont = accouont;
		this.email = email;
		this.note = note;
		this.password = password;
		this.phoneNumber = phoneNumber;
	}

}