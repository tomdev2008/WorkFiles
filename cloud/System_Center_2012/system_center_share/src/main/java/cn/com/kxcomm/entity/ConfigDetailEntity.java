package cn.com.kxcomm.entity;

import java.io.Serializable;

/**
 * 
 * 功能描述:配置详情实体 
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-11
 * @author chenliang 修改日期：2013-9-11
 * @since system_center_share
 */
public class ConfigDetailEntity implements Serializable {

	private Long id;
	private Long priceOverviewId; // 价格总览外键
	private Long operatingSystemId; // 操作系统外键
	private Integer cpuSize; // cpu大小
	private String cpuUnit; // cpu单位
	private String memorySize; // 内存大小
	private String memoryUnit; // 内存大小单位
	private Long publicNetwork; // 公网大小
	private String publicNetworkUnit; // 公网大小单位
	private Long systemDiskSize; // 系统盘大小
	private String systemUnit; // 系统盘大小单位
	private Long dataSize; // 数据盘大小
	private String dataUnit; // 数据盘大小单位

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getPriceOverviewId() {
		return priceOverviewId;
	}

	public void setPriceOverviewId(Long priceOverviewId) {
		this.priceOverviewId = priceOverviewId;
	}

	public Long getOperatingSystemId() {
		return operatingSystemId;
	}

	public void setOperatingSystemId(Long operatingSystemId) {
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

	public String getMemorySize() {
		return memorySize;
	}

	public void setMemorySize(String memorySize) {
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
