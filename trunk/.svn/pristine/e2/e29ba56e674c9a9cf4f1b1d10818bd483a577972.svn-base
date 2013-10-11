package cn.com.kxcomm.entity;

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
 * 功能描述:服务与产品表
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-11
 * @author chenliang 修改日期：2013-9-11
 * @since system_center_share
 */
@Entity
@SequenceGenerator(name="SEQ_PRODUCT_ID",sequenceName="SEQ_PRODUCT_ID",allocationSize=1)
@Table(name = "tb_product")
public class ProductEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_PRODUCT_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;
	
	@Column(name = "name", updatable = false, nullable = true, insertable = false, length = 150)
	private String name;
	
	@Column(name = "detail", updatable = false, nullable = true, insertable = false, length = 150)
	private String detail;
	
	@Column(name = "type", updatable = false, nullable = true, insertable = false, length = 150)
	private Integer type;
	
	@OneToMany(mappedBy = "tbProductId")
	@Cascade({ CascadeType.ALL })
	private Set<PriceOverviewEntity> priceOverviewEntity;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "ProductEntity [id=" + id + ", name=" + name + ", detail=" + detail
				+ ", type=" + type + "]";
	}

}
