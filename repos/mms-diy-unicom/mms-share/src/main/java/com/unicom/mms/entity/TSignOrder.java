package com.unicom.mms.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@SequenceGenerator(name="SEQ_SIGN_ORDER",sequenceName="SEQ_SIGN_ORDER",allocationSize=1)
@Table(name = "t_sign_order")
public class TSignOrder implements java.io.Serializable {
	
	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_SIGN_ORDER")
	@Column(name = "id", updatable = false, nullable = false, insertable = false)
	private Long id;

	@Column(name = "USER_ID", updatable = true, nullable = false, insertable = true)
	private Long userId;

	@Column(name = "STATUS", updatable = true, nullable = false, insertable = true, length = 1)
	private String status;

	@Column(name = "UPDATE_TIME", updatable = true, nullable = false, insertable = true)
	private Date updateTime;

	@Column(name = "CALL_TYPE", updatable = true, nullable = false, insertable = true, length = 1)
	private String calltype;
	
	@Column(name = "CREATE_TIME", updatable = true, nullable = false, insertable = true)
	private Date createTime;
	
	@Column(name = "RPODUCT_NAME", updatable = true, nullable = false, insertable = true, length = 7)
	private String productName;
	// Constructors
	
	@Column(name = "PRODUCT_ID", updatable = true, nullable = false, insertable = true, length = 21)
	private String productId;

	/** default constructor */
	public TSignOrder() {
	}

	public String getCalltype() {
		return calltype;
	}

	public void setCalltype(String calltype) {
		this.calltype = calltype;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public TSignOrder(Long id, Long userId, String status, Date updateTime, String calltype, Date createTime, String productName, String productId) {
		super();
		this.id = id;
		this.userId = userId;
		this.status = status;
		this.updateTime = updateTime;
		this.calltype = calltype;
		this.createTime = createTime;
		this.productName = productName;
		this.productId = productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductId() {
		return productId;
	}
}