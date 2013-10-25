package com.unicom.mms.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 
 * 功能描述:任务策略实体类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_POLIC_ID",sequenceName="SEQ_POLIC_ID",allocationSize=1)
@Table(name = "tb_polic")
public class TbPolic implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_POLIC_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 策略名称
	 */
	@Column(name = "polic_name", updatable = true, nullable = false, insertable = true, length = 150)
	private String policName;

	/**
	 * 彩信文件地址
	 */
	@Column(name = "mms_url", updatable = true, nullable = true, insertable = true, length = 255)
	private String mmsUrl;

	/**
	 * 彩信推送内容/短信推送内容
	 */
	@Column(name = "content", updatable = true, nullable = false, insertable = true, length = 255)
	private String content;
	
	/**
	 * 类型：1、短信,2、彩信
	 */
	@Column(name = "msg_type", updatable = true, nullable = false, insertable = true, length = 32)
	private Integer msgType;
	
	/**
	 * 状态(0:启动，1：停止)<br/>
	 * 在界面上控制，如果正在群发中，检测到停止则停止群发
	 */
	@Column(name = "is_stauts", updatable = true, nullable = false, insertable = true, length = 32)
	private  Integer stauts;
	
	/**
	 * 状态(0:未执行，1：执信中，2：执行完)<br/>
	 * 在界面上控制，如果正在群发中，检测到停止则停止群发
	 */
	@Column(name = "run_stauts", updatable = true, nullable = false, insertable = true, length = 32)
	private  Integer runStauts;

	/**
	 * 时间表达式<br/>
	 * 与quartz的时间表达式一致，从web自由组装每天、每周、还是周一、周三等各种情况都可以实现<br/>
	 */
//	@Column(name = "time_corn", updatable = true, nullable = false, insertable = true, length = 255)
//	private String timeCorn;
	
	/**
	 * 群发任务描述
	 */
	@Column(name = "remark", updatable = true, nullable = true, insertable = true, length = 255)
	private String remark;
	
	/**
	 * 创建者
	 */
	@Column(name = "creator", updatable = true, nullable = false, insertable = true, length = 32)
	private Long creator;
	
	/**
	 * 创建时间
	 */
	@Column(name = "create_time", updatable = true, nullable = false, insertable = true)
	private Date createTime;
	
	/**
	 * 群发总数<br/>
	 * 群发任务结束时更新，如果多次群发则累计
	 */
	@Column(name = "total_num", updatable = true, nullable = false, insertable = true, length = 32)
	private Integer totalNum;
	
	/**
	 * 群发成功数<br/>
	 * 群发任务结束时更新，如果多次群发则累计
	 */
	@Column(name = "succes_num", updatable = true, nullable = false, insertable = true, length = 32)
	private Integer succesNum;
	
	/**
	 * 群发失败数(包括重发数)
	 * 群发任务结束时更新，如果多次群发则累计
	 */
	@Column(name = "faild_num", updatable = true, nullable = false, insertable = true, length = 32)
	private Integer faildNum;
	
	/**
	 * 最后群发任务的发送时间<br/>
	 *  群发任务结束时更新
	 */
	@Column(name = "last_send_time", updatable = true, nullable = true, insertable = true)
	private Date lastSendTime;
	
	/**
	 * 号码类型外键<br/>
	 * 该任务对应的推送号码
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "mdn_type_id", nullable = false)
	private TbMdnType mdnType;
	
	/**
	 * 开始发送时间
	 */
	@Column(name = "start_send_time", updatable = true, nullable = false, insertable = true)
	private Date startSendTime;
	
	/**
	 * 结束发送时间
	 */
	@Column(name = "end_send_time", updatable = true, nullable = false, insertable = true)
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

	public TbMdnType getMdnType() {
		return mdnType;
	}

	public void setMdnType(TbMdnType mdnType) {
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

	public Integer getRunStauts() {
		return runStauts;
	}

	public void setRunStauts(Integer runStauts) {
		this.runStauts = runStauts;
	}
	
}
