package com.unicom.mms.entity;

// default package

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
 * 功能描述：服务记录实体类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_SERVICES_ID",sequenceName="SEQ_SERVICES_ID",allocationSize=1)
@Table(name = "tb_services")
public class TbServices implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_SERVICES_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 内容
	 */
	@Column(name = "service_name", updatable = true, nullable = false, insertable = true, length = 200)
	private String service_name;

	/**
	 * 参数
	 */
	@Column(name = "param", updatable = true, nullable = false, insertable = true, length = 200)
	private String param;

	/**
	 * 结果
	 */
	@Column(name = "result", updatable = true, nullable = false, insertable = true, length = 150)
	private String result;

	/**
	 *
	 */
	@Column(name = "oper_user", updatable = true, nullable = false, insertable = true, length = 150)
	private String operUser;

	/**
	 *
	 */
	@Column(name = "oper_time", updatable = true, nullable = false, insertable = true)
	private Date operTime;
	
	/**
	 * 渠道
	 */
	@Column(name = "op_channel", updatable = true, nullable = false, insertable = true,length=100)
	private String opChannel;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getService_name() {
		return service_name;
	}

	public void setService_name(String service_name) {
		this.service_name = service_name;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getOperUser() {
		return operUser;
	}

	public void setOperUser(String operUser) {
		this.operUser = operUser;
	}

	public Date getOperTime() {
		return operTime;
	}

	public void setOperTime(Date operTime) {
		this.operTime = operTime;
	}

	public String getOpChannel() {
		return opChannel;
	}

	public void setOpChannel(String opChannel) {
		this.opChannel = opChannel;
	}

	public TbServices() {
		super();
	}

	@Override
	public String toString() {
		return "TbServices [id=" + id + ", service_name=" + service_name
				+ ", param=" + param + ", result=" + result + ", operUser="
				+ operUser + ", operTime=" + operTime + ", opChannel="
				+ opChannel + "]";
	}

	public TbServices(Integer id, String service_name, String param,
			String result, String operUser, Date operTime, String opChannel) {
		super();
		this.id = id;
		this.service_name = service_name;
		this.param = param;
		this.result = result;
		this.operUser = operUser;
		this.operTime = operTime;
		this.opChannel = opChannel;
	}
	
}