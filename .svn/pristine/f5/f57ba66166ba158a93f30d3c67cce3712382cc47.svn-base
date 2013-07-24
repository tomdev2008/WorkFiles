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

/**   
 * @Title: Entity
 * @Description: 部门表
 * @author zhangdaihao
 * @date 2013-07-23 14:48:22
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_depart", schema = "")
@SuppressWarnings("serial")
public class TbDepartEntity implements java.io.Serializable {
	/**部门名称*/
	private java.lang.String permName;
	/**部门主键id*/
	private java.lang.String id;
	/**职责*/
	private java.lang.String duty;
	/**父级部门*/
	private TbDepartEntity parentDepart;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  员工姓名
	 */
	@Column(name ="PERM_NAME",nullable=true,length=100)
	public java.lang.String getPermName(){
		return this.permName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  员工姓名
	 */
	public void setPermName(java.lang.String permName){
		this.permName = permName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  部门主键id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=50)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  部门主键id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  职责
	 */
	@Column(name ="DUTY",nullable=true,length=100)
	public java.lang.String getDuty(){
		return this.duty;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  职责
	 */
	public void setDuty(java.lang.String duty){
		this.duty = duty;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parent_depart")
	public TbDepartEntity getParentDepart() {
		return parentDepart;
	}

	public void setParentDepart(TbDepartEntity parentDepart) {
		this.parentDepart = parentDepart;
	}

}
