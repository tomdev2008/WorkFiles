package cn.com.kxcomm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 
 * 功能描述:设置价格实体 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-11
 * @author chenliang 修改日期：2013-9-11
 * @since system_center_share
 */
@Entity
@SequenceGenerator(name = "SEQ_SET_CONFIG_ID", sequenceName = "SEQ_SET_CONFIG_ID", allocationSize = 1)
@Table(name = "tb_set_prices")
public class SetPricesEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_SET_CONFIG_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;

	@Column(name = "cpu_growth_rate", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer cpuGrowthRate; // cpu增长率

	@Column(name = "cpu_growth_price", updatable = false, nullable = false, insertable = false, length = 32)
	private Double cpuGrowthPrice; // cpu增长价

	@Column(name = "cpu_growth_unit", updatable = false, nullable = false, insertable = false, length = 150)
	private String cpuGrowthUnit; // cpu增长

	@Column(name = "memory_growth_rate", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer memoryGrowthRate; // 内存增长率

	@Column(name = "memory_growth_price", updatable = false, nullable = false, insertable = false, length = 32)
	private Double memoryGrowthPrice; // 内存增长价

	@Column(name = "memory_growth_unit", updatable = false, nullable = false, insertable = false, length = 150)
	private String memoryGrowthUnit; // 内存增长单位

	@Column(name = "data_growth_rate", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer dataGrowthRate; // 数据盘增长率

	@Column(name = "data_growth_price", updatable = false, nullable = false, insertable = false, length = 32)
	private Double dataGrowthPrice; // 数据盘增长价

	@Column(name = "data_growth_unit", updatable = false, nullable = false, insertable = false, length = 32)
	private String dataGrowthUnit; // 数据盘增长单位

	@Column(name = "network_growth_rate", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer networkGrowthRate; // 公网宽带增长率

	@Column(name = "network_growth_price", updatable = false, nullable = false, insertable = false, length = 32)
	private Double networkGrowthPrice; // 公网宽带增长价

	@Column(name = "network_growth_unit", updatable = false, nullable = false, insertable = false, length = 150)
	private String networkGrowthUnit; // 公网宽带增加单位

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getCpuGrowthRate() {
		return cpuGrowthRate;
	}

	public void setCpuGrowthRate(Integer cpuGrowthRate) {
		this.cpuGrowthRate = cpuGrowthRate;
	}

	public Double getCpuGrowthPrice() {
		return cpuGrowthPrice;
	}

	public void setCpuGrowthPrice(Double cpuGrowthPrice) {
		this.cpuGrowthPrice = cpuGrowthPrice;
	}

	public String getCpuGrowthUnit() {
		return cpuGrowthUnit;
	}

	public void setCpuGrowthUnit(String cpuGrowthUnit) {
		this.cpuGrowthUnit = cpuGrowthUnit;
	}

	public Integer getMemoryGrowthRate() {
		return memoryGrowthRate;
	}

	public void setMemoryGrowthRate(Integer memoryGrowthRate) {
		this.memoryGrowthRate = memoryGrowthRate;
	}

	public Double getMemoryGrowthPrice() {
		return memoryGrowthPrice;
	}

	public void setMemoryGrowthPrice(Double memoryGrowthPrice) {
		this.memoryGrowthPrice = memoryGrowthPrice;
	}

	public String getMemoryGrowthUnit() {
		return memoryGrowthUnit;
	}

	public void setMemoryGrowthUnit(String memoryGrowthUnit) {
		this.memoryGrowthUnit = memoryGrowthUnit;
	}

	public Integer getDataGrowthRate() {
		return dataGrowthRate;
	}

	public void setDataGrowthRate(Integer dataGrowthRate) {
		this.dataGrowthRate = dataGrowthRate;
	}

	public Double getDataGrowthPrice() {
		return dataGrowthPrice;
	}

	public void setDataGrowthPrice(Double dataGrowthPrice) {
		this.dataGrowthPrice = dataGrowthPrice;
	}

	public String getDataGrowthUnit() {
		return dataGrowthUnit;
	}

	public void setDataGrowthUnit(String dataGrowthUnit) {
		this.dataGrowthUnit = dataGrowthUnit;
	}

	public Integer getNetworkGrowthRate() {
		return networkGrowthRate;
	}

	public void setNetworkGrowthRate(Integer networkGrowthRate) {
		this.networkGrowthRate = networkGrowthRate;
	}

	public Double getNetworkGrowthPrice() {
		return networkGrowthPrice;
	}

	public void setNetworkGrowthPrice(Double networkGrowthPrice) {
		this.networkGrowthPrice = networkGrowthPrice;
	}

	public String getNetworkGrowthUnit() {
		return networkGrowthUnit;
	}

	public void setNetworkGrowthUnit(String networkGrowthUnit) {
		this.networkGrowthUnit = networkGrowthUnit;
	}

}
