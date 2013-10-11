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
 * 功能描述:镜像实体类
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-11
 * @author chenliang 修改日期：2013-9-11
 * @since system_center_share
 */
@Entity
@SequenceGenerator(name="SEQ_ISO_ID",sequenceName="SEQ_ISO_ID",allocationSize=1)
@Table(name = "tb_iso")
public class ISOEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_ISO_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;
	
	@Column(name = "iso_name", updatable = true, nullable = false, insertable = true, length = 150)
	private String isoName; // 名称
	
	@Column(name = "iso_size", updatable = true, nullable = false, insertable = true, length = 32)
	private Long isoSize; // 大小
	
	@Column(name = "size_unit", updatable = true, nullable = false, insertable = true, length = 32)
	private Integer sizeUnit; // 单位
	
	@Column(name = "iso_url", updatable = true, nullable = false, insertable = true, length = 150)
	private String isoUrl; // 地址
	
	@Column(name = "iso_version", updatable = true, nullable = false, insertable = true, length = 150)
	private String isoVersion; // 版本
	
	@OneToMany(mappedBy = "tbIsoId")
	@Cascade({ CascadeType.ALL })
	private Set<VirtualMachineEntity> virtualMachineEntity;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getIsoSize() {
		return isoSize;
	}
	public String getIsoName() {
		return isoName;
	}
	public void setIsoName(String isoName) {
		this.isoName = isoName;
	}
	public void setIsoSize(Long isoSize) {
		this.isoSize = isoSize;
	}
	public Integer getSizeUnit() {
		return sizeUnit;
	}
	public void setSizeUnit(Integer sizeUnit) {
		this.sizeUnit = sizeUnit;
	}
	public String getIsoUrl() {
		return isoUrl;
	}
	public void setIsoUrl(String isoUrl) {
		this.isoUrl = isoUrl;
	}
	public String getIsoVersion() {
		return isoVersion;
	}
	public void setIsoVersion(String isoVersion) {
		this.isoVersion = isoVersion;
	}


}
