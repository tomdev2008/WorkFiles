package jeecg.kxcomm.entity.contactm;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 采购订单
 * @author zhangdaihao
 * @date 2013-09-24 16:46:46
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_purchase", schema = "")
@SuppressWarnings("serial")
public class TbPurchaseEntity implements java.io.Serializable {
	/**id*/
	private java.lang.String id;
	/**orderDetailId*/
	private java.lang.String orderDetailId;
	
	private TbPurchaseContractEntity tbPurchaseContract = new TbPurchaseContractEntity();
	
	private TbOrderDetailEntity tbOrderDetail = new TbOrderDetailEntity();
	/**area*/
	private java.lang.String area;
	
	/**supplier*/
	private java.lang.String supplier;
	/**productName*/
	private java.lang.String productName;
	/**model*/
	private java.lang.String model;
	/**number*/
	private java.lang.String number;
	/**unitPrice*/
	private java.lang.String unitPrice;
	/**totalPrice*/
	private java.lang.String totalPrice;
	/**purchaser*/
	private java.lang.String purchaser;
	/**predictArrivalDate*/
	private java.util.Date predictArrivalDate;
	/**placeOrderDate*/
	private java.util.Date placeOrderDate;
	/**invoiceDate*/
	private java.util.Date invoiceDate;
	/**invoiceRemark*/
	private java.lang.String invoiceRemark;
	/**paymentDate*/
	private java.util.Date paymentDate;
	/**inquireNo*/
	private java.lang.String inquireNo;
	/**typeServiceNo*/
	private java.lang.String typeServiceNo;
	/**remark*/
	private java.lang.String remark;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=85)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  orderDetailId
	 */
//	@Column(name ="ORDER_DETAIL_ID",nullable=true,length=85)
//	public java.lang.String getOrderDetailId(){
//		return this.orderDetailId;
//	}
//
//	/**
//	 *方法: 设置java.lang.String
//	 *@param: java.lang.String  orderDetailId
//	 */
//	public void setOrderDetailId(java.lang.String orderDetailId){
//		this.orderDetailId = orderDetailId;
//	}
	
	@ManyToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name = "order_detail_id")
	public TbOrderDetailEntity  getTbOrderDetail() {
		return this.tbOrderDetail;
	}

	public void setTbOrderDetail(TbOrderDetailEntity tbOrderDetail) {
		this.tbOrderDetail = tbOrderDetail;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "purchase_contract_id")
	public TbPurchaseContractEntity  getTbPurchaseContract() {
		return this.tbPurchaseContract;
	}

	public void setTbPurchaseContract(TbPurchaseContractEntity tbPurchaseContract) {
		this.tbPurchaseContract = tbPurchaseContract;
	}
	
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  area
	 */
	@Column(name ="AREA",nullable=true,length=16)
	public java.lang.String getArea(){
		return this.area;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  area
	 */
	public void setArea(java.lang.String area){
		this.area = area;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  supplier
	 */
	@Column(name ="SUPPLIER",nullable=true,length=16)
	public java.lang.String getSupplier(){
		return this.supplier;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  supplier
	 */
	public void setSupplier(java.lang.String supplier){
		this.supplier = supplier;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  productName
	 */
	@Column(name ="PRODUCT_NAME",nullable=true,length=16)
	public java.lang.String getProductName(){
		return this.productName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  productName
	 */
	public void setProductName(java.lang.String productName){
		this.productName = productName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  model
	 */
	@Column(name ="MODEL",nullable=true,length=16)
	public java.lang.String getModel(){
		return this.model;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  model
	 */
	public void setModel(java.lang.String model){
		this.model = model;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  number
	 */
	@Column(name ="NUMBER",nullable=true,length=16)
	public java.lang.String getNumber(){
		return this.number;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  number
	 */
	public void setNumber(java.lang.String number){
		this.number = number;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  unitPrice
	 */
	@Column(name ="UNIT_PRICE",nullable=true,length=16)
	public java.lang.String getUnitPrice(){
		return this.unitPrice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  unitPrice
	 */
	public void setUnitPrice(java.lang.String unitPrice){
		this.unitPrice = unitPrice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  totalPrice
	 */
	@Column(name ="TOTAL_PRICE",nullable=true,length=16)
	public java.lang.String getTotalPrice(){
		return this.totalPrice;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  totalPrice
	 */
	public void setTotalPrice(java.lang.String totalPrice){
		this.totalPrice = totalPrice;
	}
	
	@Column(name ="PURCHASER",nullable=true,length=16)
	public java.lang.String getPurchaser(){
		return this.purchaser;
	}
	public void setPurchaser(java.lang.String purchaser){
		this.purchaser = purchaser;
	}
	
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  predictArrivalDate
	 */
	@Column(name ="PREDICT_ARRIVAL_DATE",nullable=true)
	public java.util.Date getPredictArrivalDate(){
		return this.predictArrivalDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  predictArrivalDate
	 */
	public void setPredictArrivalDate(java.util.Date predictArrivalDate){
		this.predictArrivalDate = predictArrivalDate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  placeOrderDate
	 */
	@Column(name ="PLACE_ORDER_DATE",nullable=true)
	public java.util.Date getPlaceOrderDate(){
		return this.placeOrderDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  placeOrderDate
	 */
	public void setPlaceOrderDate(java.util.Date placeOrderDate){
		this.placeOrderDate = placeOrderDate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  invoiceDate
	 */
	@Column(name ="INVOICE_DATE",nullable=true)
	public java.util.Date getInvoiceDate(){
		return this.invoiceDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  invoiceDate
	 */
	public void setInvoiceDate(java.util.Date invoiceDate){
		this.invoiceDate = invoiceDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  invoiceRemark
	 */
	@Column(name ="INVOICE_REMARK",nullable=true,length=16)
	public java.lang.String getInvoiceRemark(){
		return this.invoiceRemark;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  invoiceRemark
	 */
	public void setInvoiceRemark(java.lang.String invoiceRemark){
		this.invoiceRemark = invoiceRemark;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  paymentDate
	 */
	@Column(name ="PAYMENT_DATE",nullable=true)
	public java.util.Date getPaymentDate(){
		return this.paymentDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  paymentDate
	 */
	public void setPaymentDate(java.util.Date paymentDate){
		this.paymentDate = paymentDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  inquireNo
	 */
	@Column(name ="INQUIRE_NO",nullable=true,length=16)
	public java.lang.String getInquireNo(){
		return this.inquireNo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  inquireNo
	 */
	public void setInquireNo(java.lang.String inquireNo){
		this.inquireNo = inquireNo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  typeServiceNo
	 */
	@Column(name ="TYPE_SERVICE_NO",nullable=true,length=16)
	public java.lang.String getTypeServiceNo(){
		return this.typeServiceNo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  typeServiceNo
	 */
	public void setTypeServiceNo(java.lang.String typeServiceNo){
		this.typeServiceNo = typeServiceNo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  remark
	 */
	@Column(name ="REMARK",nullable=true,length=33)
	public java.lang.String getRemark(){
		return this.remark;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  remark
	 */
	public void setRemark(java.lang.String remark){
		this.remark = remark;
	}
}
