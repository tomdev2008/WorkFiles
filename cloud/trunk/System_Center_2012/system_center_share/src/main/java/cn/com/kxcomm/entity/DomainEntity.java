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
 * 功能描述:域实体
 * 
 * @author chenliang 新增日期：2013-6-24
 * @since system_center_sdk
 */
@Entity
@SequenceGenerator(name="SEQ_DOMAIN_ID",sequenceName="SEQ_DOMAIN_ID",allocationSize=1)
@Table(name = "tb_domain")
public class DomainEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_DOMAIN_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;
	
	@Column(name = "domain_name", updatable = true, nullable = false, insertable = true, length = 150)
	private String domainName; //域名
	
	@OneToMany(mappedBy = "domainId")
	@Cascade({ CascadeType.ALL })
	private Set<DomUserEntity> domUserEntity;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDomainName() {
		return domainName;
	}
	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}

}
