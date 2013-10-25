package jeecg.test.vo;

import java.io.Serializable;
import java.util.Date;

public class OrdersVo implements Serializable {

	private String id;
	/** 订单号 */
	private String orderNumber;
	/** 代理商 */
	private String agentsName;
	/** 渠道 */
	private String channelName;
	/** 目的国 */
	private String countryName;
	/** 状态 */
	private String status;
	/** 重要 */
	private String important;
	/** 创单时间 */
	private Date createTime;
	/** 用户号码*/
	private String phone;
	/** 备注 **/
	private String remark;
	/** 用户账号 */
	private String userName;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getAgentsName() {
		return agentsName;
	}

	public void setAgentsName(String agentsName) {
		this.agentsName = agentsName;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getImportant() {
		return important;
	}

	public void setImportant(String important) {
		this.important = important;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
