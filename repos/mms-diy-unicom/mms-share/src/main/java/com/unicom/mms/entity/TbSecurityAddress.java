package com.unicom.mms.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 
 * 安全访问的IP地址
 * 通过设置哪些IP可以访问，哪些IP不可以访问
 * @author zhangjh 新增日期：2013-10-15
 * @since mms-share
 */
@Entity
@SequenceGenerator(name="SEQ_SECURITY_ADDRESS_ID",sequenceName="SEQ_SECURITY_ADDRESS_ID",allocationSize=1)
@Table(name = "tb_security_address")
public class TbSecurityAddress implements java.io.Serializable{
	private static final long serialVersionUID = 1283345048161920694L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_SECURITY_ADDRESS_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;
	
	/**
	 * 控制的IP地址
	 */
	@Column(name = "ip_adress", updatable = true, nullable = true, insertable = true, length = 150)
	private String ipAdress;
	
	/**
	 * 是否允许访问，Y/N
	 */
	@Column(name = "allow", updatable = true, nullable = true, insertable = true, length = 10)
	private String allow;
	/**
	 * 描述
	 */
	@Column(name = "describe", updatable = true, nullable = false, insertable = true, length = 100)
	private String describe;
	/**
	 * 创建时间
	 */
	@Column(name = "create_time", updatable = true, nullable = true, insertable = true)
	private Date createTime;
	
	/**
	 * 针对平台
	 */
	@Column(name = "platform", updatable = true, nullable = true, insertable = true, length = 100)
	private String platform;
	
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getIpAdress() {
		return ipAdress;
	}
	public void setIpAdress(String ipAdress) {
		this.ipAdress = ipAdress;
	}
	public String getAllow() {
		return allow;
	}
	public void setAllow(String allow) {
		this.allow = allow;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
