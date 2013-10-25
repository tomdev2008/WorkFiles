package jeecg.test.entity.orders;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.jeecgframework.core.common.entity.IdEntity;

/**   
 * @Title: Entity
 * @Description: 用户级别
 * @author zhangdaihao
 * @date 2013-06-15 12:47:21
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_user_level")
public class TbUserLevelEntity extends IdEntity  implements java.io.Serializable {
	/**用户级别*/
	private java.lang.String levelname;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  用户级别
	 */
	@Column(name ="LEVELNAME",nullable=false,length=50)
	public java.lang.String getLevelname(){
		return this.levelname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  用户级别
	 */
	public void setLevelname(java.lang.String levelname){
		this.levelname = levelname;
	}

	@Override
	public String toString() {
		return "TbUserLevelEntity [levelname=" + levelname + "]";
	}
}
