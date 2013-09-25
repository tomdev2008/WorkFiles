package jeecg.kxcomm.entity.hrm;

import java.math.BigDecimal;
import java.util.Date;

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

import jeecg.system.pojo.base.TSDepart;

/**   
 * @Title: Entity
 * @Description: 岗位表
 * @author zhangdaihao
 * @date 2013-07-23 14:51:30
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_post", schema = "")
@SuppressWarnings("serial")
public class TbPostEntity implements java.io.Serializable {
	/**岗位id*/
	private java.lang.String id;
	/**部门id*/
	private TSDepart deptId=new TSDepart();
	/**岗位名称*/
	private java.lang.String postName;
	/**岗位职责*/
	private java.lang.String postDuty;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  岗位id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=32)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  岗位id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "dept_id")
	public TSDepart getDeptId() {
		return deptId;
	}

	public void setDeptId(TSDepart deptId) {
		this.deptId = deptId;
	}

	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  岗位名称
	 */
	@Column(name ="POST_NAME",nullable=true,length=20)
	public java.lang.String getPostName(){
		return this.postName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  岗位名称
	 */
	public void setPostName(java.lang.String postName){
		this.postName = postName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  岗位职责
	 */
	@Column(name ="POST_DUTY",nullable=true,length=50)
	public java.lang.String getPostDuty(){
		return this.postDuty;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  岗位职责
	 */
	public void setPostDuty(java.lang.String postDuty){
		this.postDuty = postDuty;
	}
}
