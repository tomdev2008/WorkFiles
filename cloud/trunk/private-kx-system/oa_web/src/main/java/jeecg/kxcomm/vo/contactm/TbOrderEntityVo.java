package jeecg.kxcomm.vo.contactm;

import jeecg.kxcomm.entity.contactm.TbContractEntity;

public class TbOrderEntityVo {
	/**id*/
	private java.lang.String id;
	/**contractId*/
	//private java.lang.String contractId;
	
	private TbContractEntity tbContract = new TbContractEntity();
	
	/**kxOrderNo*/
	private java.lang.String kxOrderNo;
	/**projectName*/
	private java.lang.String projectName;
	/**contractNo*/
	private java.lang.String contractNo;
	/**client*/
	private java.lang.String client;
	/**finalClient*/
	private java.lang.String finalClient;
	/**payment*/
	private java.lang.String payment;
	/**principal*/
	private java.lang.String principal;
	
	private java.lang.String totalPrice;
	
	private java.util.Date createTime;
	
	/**remark*/
	private java.lang.String remark;
	
	/**
	 * 待采购数量
	 */
	private String purchaseNumTo;
	/**
	 * 采购中数量
	 */
	private String purchaseNumIng;
	/**
	 * 已采购数量
	 */
	private String purchaseNumEnd;
	public java.lang.String getId() {
		return id;
	}
	public void setId(java.lang.String id) {
		this.id = id;
	}
	public TbContractEntity getTbContract() {
		return tbContract;
	}
	public void setTbContract(TbContractEntity tbContract) {
		this.tbContract = tbContract;
	}
	public java.lang.String getKxOrderNo() {
		return kxOrderNo;
	}
	public void setKxOrderNo(java.lang.String kxOrderNo) {
		this.kxOrderNo = kxOrderNo;
	}
	public java.lang.String getProjectName() {
		return projectName;
	}
	public void setProjectName(java.lang.String projectName) {
		this.projectName = projectName;
	}
	public java.lang.String getContractNo() {
		return contractNo;
	}
	public void setContractNo(java.lang.String contractNo) {
		this.contractNo = contractNo;
	}
	public java.lang.String getClient() {
		return client;
	}
	public void setClient(java.lang.String client) {
		this.client = client;
	}
	public java.lang.String getFinalClient() {
		return finalClient;
	}
	public void setFinalClient(java.lang.String finalClient) {
		this.finalClient = finalClient;
	}
	public java.lang.String getPayment() {
		return payment;
	}
	public void setPayment(java.lang.String payment) {
		this.payment = payment;
	}
	public java.lang.String getPrincipal() {
		return principal;
	}
	public void setPrincipal(java.lang.String principal) {
		this.principal = principal;
	}
	public java.lang.String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(java.lang.String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public java.util.Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	public java.lang.String getRemark() {
		return remark;
	}
	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}
	public String getPurchaseNumTo() {
		return purchaseNumTo;
	}
	public void setPurchaseNumTo(String purchaseNumTo) {
		this.purchaseNumTo = purchaseNumTo;
	}
	public String getPurchaseNumIng() {
		return purchaseNumIng;
	}
	public void setPurchaseNumIng(String purchaseNumIng) {
		this.purchaseNumIng = purchaseNumIng;
	}
	public String getPurchaseNumEnd() {
		return purchaseNumEnd;
	}
	public void setPurchaseNumEnd(String purchaseNumEnd) {
		this.purchaseNumEnd = purchaseNumEnd;
	}
	
	
}
