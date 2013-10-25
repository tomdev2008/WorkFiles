package com.unicom.mms.pushjob.model;

import java.util.Date;
import com.unicom.mms.entity.TbMdnType;

/**
 * 
 * 功能描述:发送结果 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-12
 * @author chenliang 修改日期：2013-9-12
 * @since mms-task
 */
public class PolicModel {

	private Integer id;
	// 策略名称
	private String policName;

	// 彩信文件地址
	private String mmsUrl;

	// 彩信推送内容/短信推送内容
	private String content;

	// 类型：1、短信,2、彩信
	private Integer msgType;

	// 状态(0:启动，1：停止)<br/>在界面上控制，如果正在群发中，检测到停止则停止群发
	private Integer stauts;
	// 群发任务描述
	private String remark;

	// 创建者
	private Long creator;

	// 创建时间
	private Date createTime;

	// 群发总数<br/> 群发任务结束时更新，如果多次群发则累计
	private Integer totalNum;

	// 群发成功数<br/> 群发任务结束时更新，如果多次群发则累计
	private Integer succesNum;

	// 群发失败数(包括重发数)群发任务结束时更新，如果多次群发则累计
	private Integer faildNum;

	// 最后群发任务的发送时间<br/> 群发任务结束时更新
	private Date lastSendTime;

	// 号码类型外键<br/> 该任务对应的推送号码
	private Integer mdnType;

	// 开始发送时间
	private Date startSendTime;

	// 结束发送时间
	private Date endSendTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPolicName() {
		return policName;
	}

	public void setPolicName(String policName) {
		this.policName = policName;
	}

	public String getMmsUrl() {
		return mmsUrl;
	}

	public void setMmsUrl(String mmsUrl) {
		this.mmsUrl = mmsUrl;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getMsgType() {
		return msgType;
	}

	public void setMsgType(Integer msgType) {
		this.msgType = msgType;
	}

	public Integer getStauts() {
		return stauts;
	}

	public void setStauts(Integer stauts) {
		this.stauts = stauts;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Long getCreator() {
		return creator;
	}

	public void setCreator(Long creator) {
		this.creator = creator;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(Integer totalNum) {
		this.totalNum = totalNum;
	}

	public Integer getSuccesNum() {
		return succesNum;
	}

	public void setSuccesNum(Integer succesNum) {
		this.succesNum = succesNum;
	}

	public Integer getFaildNum() {
		return faildNum;
	}

	public void setFaildNum(Integer faildNum) {
		this.faildNum = faildNum;
	}

	public Date getLastSendTime() {
		return lastSendTime;
	}

	public void setLastSendTime(Date lastSendTime) {
		this.lastSendTime = lastSendTime;
	}

	public Integer getMdnType() {
		return mdnType;
	}

	public void setMdnType(Integer mdnType) {
		this.mdnType = mdnType;
	}

	public Date getStartSendTime() {
		return startSendTime;
	}

	public void setStartSendTime(Date startSendTime) {
		this.startSendTime = startSendTime;
	}

	public Date getEndSendTime() {
		return endSendTime;
	}

	public void setEndSendTime(Date endSendTime) {
		this.endSendTime = endSendTime;
	}

}
