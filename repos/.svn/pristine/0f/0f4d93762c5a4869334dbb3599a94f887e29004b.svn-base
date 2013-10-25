package com.unicom.mms.entity;

// default package

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
 * 功能描述:用户订购实体类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_USER_ORDER_ID",sequenceName="SEQ_USER_ORDER_ID",allocationSize=1)
@Table(name = "tb_user_order")
public class TbUserOrder implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_USER_ORDER_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 终端用户
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	private TbUsers users;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TbUsers getUsers() {
		return users;
	}

	public void setUsers(TbUsers users) {
		this.users = users;
	}

	public TbUserOrder(Integer id, TbUsers users) {
		super();
		this.id = id;
		this.users = users;
	}

	public TbUserOrder() {
		super();
	}

	@Override
	public String toString() {
		return "TbUserOrder [id=" + id +"]";
	}

}