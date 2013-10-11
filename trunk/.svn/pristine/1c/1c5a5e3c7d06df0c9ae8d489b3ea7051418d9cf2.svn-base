package cn.com.kxcomm.entity;

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
 * 功能描述:价格总览表 
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-11
 * @author chenliang 修改日期：2013-9-11
 * @since system_center_share
 */
@Entity
@SequenceGenerator(name="SEQ_PRICE_OVERVIEW_ID",sequenceName="SEQ_PRICE_OVERVIEW_ID",allocationSize=1)
@Table(name = "tb_price_overview")
public class PriceOverviewEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_PRICE_OVERVIEW_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;  //主键
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "tb_product_id", nullable = false)
	private ProductEntity tbProductId;  //产品和服务外键
	
	@Column(name = "config_name", updatable = false, nullable = true, insertable = false, length = 150)
	private String configName; //配置名称
	
	@Column(name = "type", updatable = false, nullable = true, insertable = false)
	private Integer type; //配置类型
	
	@Column(name = "pre_month_price", updatable = false, nullable = true, insertable = false,length = 32)
	private Double preMonthPrice; //每月价格
	
	@Column(name = "pre_year_price", updatable = false, nullable = true, insertable = false,length = 32)
	private Double PreYearPrice; //每年价格
	
	@OneToMany(mappedBy = "priceOverviewId")
	@Cascade({ CascadeType.ALL })
	private Set<ConfigDetailEntity> configDetailEntity;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ProductEntity getTbProductId() {
		return tbProductId;
	}

	public void setTbProductId(ProductEntity tbProductId) {
		this.tbProductId = tbProductId;
	}

	public String getConfigName() {
		return configName;
	}

	public void setConfigName(String configName) {
		this.configName = configName;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Double getPreMonthPrice() {
		return preMonthPrice;
	}

	public void setPreMonthPrice(Double preMonthPrice) {
		this.preMonthPrice = preMonthPrice;
	}

	public Double getPreYearPrice() {
		return PreYearPrice;
	}

	public void setPreYearPrice(Double preYearPrice) {
		PreYearPrice = preYearPrice;
	}

	@Override
	public String toString() {
		return "PriceOverview [id=" + id + ", tbProductId=" + tbProductId
				+ ", configName=" + configName + ", type=" + type
				+ ", preMonthPrice=" + preMonthPrice + ", PreYearPrice="
				+ PreYearPrice + "]";
	}

}
