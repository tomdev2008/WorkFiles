package cn.com.kxcomm.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 
 * 功能描述:订单表
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-11
 * @author chenliang 修改日期：2013-9-11
 * @since system_center_share
 */
public class OrdersEntity implements Serializable {
	
	
	private Long id;
	private Long tbTenantsId;
	private String orderNum;
	private String createTime;
    private int state;
    private int type;
    private String productName;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getTbTenantsId() {
		return tbTenantsId;
	}
	public void setTbTenantsId(Long tbTenantsId) {
		this.tbTenantsId = tbTenantsId;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	@Override
	public String toString() {
		return "OrdersEntity [id=" + id + ", tbTenantsId=" + tbTenantsId
				+ ", orderNum=" + orderNum + ", createTime=" + createTime
				+ ", state=" + state + ", type=" + type + ", productName="
				+ productName + "]";
	}
    
    
}
