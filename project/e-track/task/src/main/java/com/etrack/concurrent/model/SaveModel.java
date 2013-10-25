package com.etrack.concurrent.model;

public class SaveModel {
	private Integer id;
	private String orderNo;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	@Override
	public String toString() {
		return "OrderModel [id=" + id + ", orderNo=" + orderNo + "]";
	}
	
}
