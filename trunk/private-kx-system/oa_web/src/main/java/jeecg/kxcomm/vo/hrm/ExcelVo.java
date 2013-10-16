/**
 * 
 */
/**
 * @author Lu
 *
 */
package jeecg.kxcomm.vo.hrm;

import java.io.Serializable;

/**
 * 
 * 功能描述:解析excel的vo
 * 
 * @author chenliang 新增日期：2013-7-26
 * @since oa_web
 */
public class ExcelVo implements Serializable {

	private Integer column; // 姓名
	private Integer rows; // 登记号码
	private String value; // 班次时段

	public Integer getColumn() {
		return column;
	}

	public void setColumn(Integer column) {
		this.column = column;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "ExcelVo [column=" + column + ", rows=" + rows + ", value="
				+ value + "]";
	}
	
}
