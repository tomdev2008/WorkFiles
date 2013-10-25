package com.unicom.mms.entity;

// default package

import java.util.Date;
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
 * 功能描述:我的收藏实体类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_COLLECT_ID",sequenceName="SEQ_COLLECT_ID",allocationSize=1)
@Table(name = "tb_collect")
public class TbCollect implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_COLLECT_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 收藏时间
	 */
	@Column(name = "collect_time", updatable = true, nullable = false, insertable = true)
	private Date collectTime;

	/**
	 * 模板
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "card_id", nullable = false)
	private TbTemplateCard templateCard;

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

	public Date getCollectTime() {
		return collectTime;
	}

	public void setCollectTime(Date collectTime) {
		this.collectTime = collectTime;
	}

	public TbTemplateCard getTemplateCard() {
		return templateCard;
	}

	public void setTemplateCard(TbTemplateCard templateCard) {
		this.templateCard = templateCard;
	}

	public TbUsers getUsers() {
		return users;
	}

	public void setUsers(TbUsers users) {
		this.users = users;
	}

	public TbCollect(Integer id, Date collectTime, TbTemplateCard templateCard,
			TbUsers users) {
		super();
		this.id = id;
		this.collectTime = collectTime;
		this.templateCard = templateCard;
		this.users = users;
	}

	public TbCollect() {
		super();
	}

	@Override
	public String toString() {
		return "TbCollect [id=" + id + ", collectTime=" + collectTime+ "]";
	}

}