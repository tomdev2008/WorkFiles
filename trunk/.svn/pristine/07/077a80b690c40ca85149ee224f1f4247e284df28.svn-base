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
 * 功能描述:操作系统实体类
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-11
 * @author chenliang 修改日期：2013-9-11
 * @since system_center_share
 */
@Entity
@SequenceGenerator(name="SEQ_OPERATING_SYSTEM_ID",sequenceName="SEQ_OPERATING_SYSTEM_ID",allocationSize=1)
@Table(name = "tb_operating_system")
public class OperatingSystemEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_OPERATING_SYSTEM_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;
	
	@Column(name = "system_name", updatable = false, nullable = false, insertable = false, length = 150)
	private String systemName; // 操作系统名称
	
	@Column(name = "median_type", updatable = false, nullable = false, insertable = false, length = 150)
	private String medianType; // 系统类型
	
	@Column(name = "version", updatable = false, nullable = false, insertable = false, length = 150)
	private String version; // 版本
	
	@OneToMany(mappedBy = "operatingSystemId")
	@Cascade({ CascadeType.ALL })
	private Set<OrderDetailEntity> orderDetailEntity;
	
	@OneToMany(mappedBy = "operatingSystemId")
	@Cascade({ CascadeType.ALL })
	private Set<ConfigDetailEntity> configDetailEntity;
	
	@OneToMany(mappedBy = "operatingSystem")
	@Cascade({ CascadeType.ALL })
	private Set<VirtualMachineEntity> virtualMachineEntity;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSystemName() {
		return systemName;
	}
	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	public String getMedianType() {
		return medianType;
	}
	public void setMedianType(String medianType) {
		this.medianType = medianType;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}


}
