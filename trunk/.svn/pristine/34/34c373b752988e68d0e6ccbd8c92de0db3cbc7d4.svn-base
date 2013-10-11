package cn.com.kxcomm.entity;

import java.io.Serializable;

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
 * 功能描述:配置详情实体 
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-11
 * @author chenliang 修改日期：2013-9-11
 * @since system_center_share
 */
@Entity
@SequenceGenerator(name="SEQ_CONFIG_DETAIL_ID",sequenceName="SEQ_CONFIG_DETAIL_ID",allocationSize=1)
@Table(name = "tb_config_detail")
public class ConfigDetailEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_CONFIG_DETAIL_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "price_overview_id", nullable = false)
	private PriceOverviewEntity priceOverviewId; // 价格总览外键
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "operating_system_id", nullable = false)
	private OperatingSystemEntity operatingSystemId; // 操作系统外键
	
	@Column(name = "cpu_size", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer cpuSize; // cpu大小
	
	@Column(name = "cpu_unit", updatable = false, nullable = false, insertable = false, length = 150)
	private String cpuUnit; // cpu单位
	
	@Column(name = "memory_size", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer memorySize; // 内存大小
	
	@Column(name = "memory_unit", updatable = false, nullable = false, insertable = false, length = 150)
	private String memoryUnit; // 内存大小单位
	
	@Column(name = "public_network", updatable = false, nullable = false, insertable = false, length = 32)
	private Long publicNetwork; // 公网大小
	
	@Column(name = "public_network_unit", updatable = false, nullable = false, insertable = false, length = 150)
	private String publicNetworkUnit; // 公网大小单位
	
	@Column(name = "system_disk_size", updatable = false, nullable = false, insertable = false, length = 32)
	private Long systemDiskSize; // 系统盘大小
	
	@Column(name = "system_unit", updatable = false, nullable = false, insertable = false, length = 150)
	private String systemUnit; // 系统盘大小单位
	
	@Column(name = "data_size", updatable = false, nullable = false, insertable = false, length = 32)
	private Long dataSize; // 数据盘大小
	
	@Column(name = "data_unit", updatable = false, nullable = false, insertable = false, length = 150)
	private String dataUnit; // 数据盘大小单位

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public PriceOverviewEntity getPriceOverviewId() {
		return priceOverviewId;
	}

	public void setPriceOverviewId(PriceOverviewEntity priceOverviewId) {
		this.priceOverviewId = priceOverviewId;
	}

	public OperatingSystemEntity getOperatingSystemId() {
		return operatingSystemId;
	}

	public void setOperatingSystemId(OperatingSystemEntity operatingSystemId) {
		this.operatingSystemId = operatingSystemId;
	}

	public Integer getCpuSize() {
		return cpuSize;
	}

	public void setCpuSize(Integer cpuSize) {
		this.cpuSize = cpuSize;
	}

	public String getCpuUnit() {
		return cpuUnit;
	}

	public void setCpuUnit(String cpuUnit) {
		this.cpuUnit = cpuUnit;
	}

	public Integer getMemorySize() {
		return memorySize;
	}

	public void setMemorySize(Integer memorySize) {
		this.memorySize = memorySize;
	}

	public String getMemoryUnit() {
		return memoryUnit;
	}

	public void setMemoryUnit(String memoryUnit) {
		this.memoryUnit = memoryUnit;
	}

	public Long getPublicNetwork() {
		return publicNetwork;
	}

	public void setPublicNetwork(Long publicNetwork) {
		this.publicNetwork = publicNetwork;
	}

	public String getPublicNetworkUnit() {
		return publicNetworkUnit;
	}

	public void setPublicNetworkUnit(String publicNetworkUnit) {
		this.publicNetworkUnit = publicNetworkUnit;
	}

	public Long getDataSize() {
		return dataSize;
	}

	public void setDataSize(Long dataSize) {
		this.dataSize = dataSize;
	}

	public String getDataUnit() {
		return dataUnit;
	}

	public void setDataUnit(String dataUnit) {
		this.dataUnit = dataUnit;
	}

	public Long getSystemDiskSize() {
		return systemDiskSize;
	}

	public void setSystemDiskSize(Long systemDiskSize) {
		this.systemDiskSize = systemDiskSize;
	}

	public String getSystemUnit() {
		return systemUnit;
	}

	public void setSystemUnit(String systemUnit) {
		this.systemUnit = systemUnit;
	}

}
