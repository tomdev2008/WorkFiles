package cn.com.kxcomm.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * 
 * 功能描述:组实体
 * 
 * @author chenliang 新增日期：2013-6-24
 * @since system_center_sdk
 */
@Entity
@SequenceGenerator(name="SEQ_GROUP_ID",sequenceName="SEQ_GROUP_ID",allocationSize=1)
@Table(name = "tb_group")
public class GroupEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_GROUP_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;
	
	@Column(name = "group_name", updatable = true, nullable = false, insertable = true, length = 150)
	private String groupName; //组名
	
	@Column(name = "group_domain", updatable = true, nullable = false, insertable = true, length = 150)
	private String groupDomain; //组域 1、全局域，2、本地域，3、通用
	
	@Column(name = "group_type", updatable = true, nullable = false, insertable = true, length = 150)
	private String groupType; // 组类型  1、安全组，2、通讯组
	
	@OneToMany(mappedBy = "groupId")
	@Cascade({ CascadeType.ALL })
	private Set<DomUserEntity> domUserEntity;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupDomain() {
		return groupDomain;
	}
	public void setGroupDomain(String groupDomain) {
		this.groupDomain = groupDomain;
	}
	public String getGroupType() {
		return groupType;
	}
	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	
}
