package jeecg.system.pojo.base;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import jeecg.test.entity.orders.TbAgentsEntity;
import jeecg.test.entity.orders.TbRemarkEntity;
import jeecg.test.entity.orders.TbUserLevelEntity;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * 系统用户表
 * 
 * @author jeecg
 */
@Entity
@Table(name = "t_s_user")
@PrimaryKeyJoinColumn(name = "id")
public class TSUser extends TSBaseUser implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String signatureFile;// 签名文件
	private String mobilePhone;// 手机
	private String officePhone;// 办公电话
	private String email;// 邮箱
	private TbUserLevelEntity userLevel = new TbUserLevelEntity();// 用户级别
	private TbAgentsEntity agents = new TbAgentsEntity();
	
	
	@Column(name = "signatureFile", length = 100)
	public String getSignatureFile() {
		return this.signatureFile;
	}

	public void setSignatureFile(String signatureFile) {
		this.signatureFile = signatureFile;
	}

	@Column(name = "mobilePhone", length = 30)
	public String getMobilePhone() {
		return this.mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	@Column(name = "officePhone", length = 20)
	public String getOfficePhone() {
		return this.officePhone;
	}

	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "levelid")
	public TbUserLevelEntity getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(TbUserLevelEntity userLevel) {
		this.userLevel = userLevel;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "agentsid")
	public TbAgentsEntity getAgents() {
		return agents;
	}

	public void setAgents(TbAgentsEntity agents) {
		this.agents = agents;
	}
	
	
	private Set<TbRemarkEntity> remarkMembers;


	@OneToMany(mappedBy="userId")
	@Cascade({CascadeType.DELETE})
	public Set<TbRemarkEntity> getRemarkMembers() {
		return remarkMembers;
	}

	public void setRemarkMembers(Set<TbRemarkEntity> remarkMembers) {
		this.remarkMembers = remarkMembers;
	}
	
}