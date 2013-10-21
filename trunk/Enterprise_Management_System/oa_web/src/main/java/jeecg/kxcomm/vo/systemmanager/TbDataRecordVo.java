package jeecg.kxcomm.vo.systemmanager;

import java.math.BigDecimal;
import java.util.Date;


/**   
 * @Title: Entity
 * @Description: 数据源详情
 * @author zhangdaihao
 * @date 2013-10-15 15:40:09
 * @version V1.0   
 *
 */
public class TbDataRecordVo implements java.io.Serializable {
	/**ID*/
	private java.lang.String id;
	
	private java.lang.String sourceId;
	
	private java.lang.String productTypeId;
	/**产品订货号*/
	private java.lang.String productorderno;
	/**产品描述*/
	private java.lang.String productdesc;
	/**数量*/
	private java.lang.Integer quantity;
	/**目录单价*/
	private java.lang.String unitprice;
	/**目录合价*/
	private java.lang.String heJia;
	/**折扣率*/
	private java.lang.String discountrate;
	/**折扣后价格*/
	private java.lang.String discountPrice;
	/**运保及其他费率*/
	private java.lang.String otherrates;
	/**折扣后现场价*/
	private java.lang.String xianChangJia;
	/**安装服务费*/
	private java.lang.String installservicecharge;
	/**第一年保修复*/
	private java.lang.String firstyear;
	/**第二年保修费*/
	private java.lang.String secondyear;
	/**第三年保修费*/
	private java.lang.String thirdyear;
	/**总价*/
	private java.lang.String totalPrice;
	/**备注*/
	private java.lang.String remark;
	
	
	public java.lang.String getId() {
		return id;
	}
	public void setId(java.lang.String id) {
		this.id = id;
	}
	public java.lang.String getSourceId() {
		return sourceId;
	}
	public void setSourceId(java.lang.String sourceId) {
		this.sourceId = sourceId;
	}
	public java.lang.String getProductTypeId() {
		return productTypeId;
	}
	public void setProductTypeId(java.lang.String productTypeId) {
		this.productTypeId = productTypeId;
	}
	public java.lang.String getProductorderno() {
		return productorderno;
	}
	public void setProductorderno(java.lang.String productorderno) {
		this.productorderno = productorderno;
	}
	public java.lang.String getProductdesc() {
		return productdesc;
	}
	public void setProductdesc(java.lang.String productdesc) {
		this.productdesc = productdesc;
	}
	public java.lang.Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(java.lang.Integer quantity) {
		this.quantity = quantity;
	}
	public java.lang.String getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(java.lang.String unitprice) {
		this.unitprice = unitprice;
	}
	public java.lang.String getHeJia() {
		return heJia;
	}
	public void setHeJia(java.lang.String heJia) {
		this.heJia = heJia;
	}
	public java.lang.String getDiscountrate() {
		return discountrate;
	}
	public void setDiscountrate(java.lang.String discountrate) {
		this.discountrate = discountrate;
	}
	public java.lang.String getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(java.lang.String discountPrice) {
		this.discountPrice = discountPrice;
	}
	public java.lang.String getOtherrates() {
		return otherrates;
	}
	public void setOtherrates(java.lang.String otherrates) {
		this.otherrates = otherrates;
	}
	public java.lang.String getXianChangJia() {
		return xianChangJia;
	}
	public void setXianChangJia(java.lang.String xianChangJia) {
		this.xianChangJia = xianChangJia;
	}
	public java.lang.String getInstallservicecharge() {
		return installservicecharge;
	}
	public void setInstallservicecharge(java.lang.String installservicecharge) {
		this.installservicecharge = installservicecharge;
	}
	public java.lang.String getFirstyear() {
		return firstyear;
	}
	public void setFirstyear(java.lang.String firstyear) {
		this.firstyear = firstyear;
	}
	public java.lang.String getSecondyear() {
		return secondyear;
	}
	public void setSecondyear(java.lang.String secondyear) {
		this.secondyear = secondyear;
	}
	public java.lang.String getThirdyear() {
		return thirdyear;
	}
	public void setThirdyear(java.lang.String thirdyear) {
		this.thirdyear = thirdyear;
	}
	public java.lang.String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(java.lang.String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public java.lang.String getRemark() {
		return remark;
	}
	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}
}
	
	