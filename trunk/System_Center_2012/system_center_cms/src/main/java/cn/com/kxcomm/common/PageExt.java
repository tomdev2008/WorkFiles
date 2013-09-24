package cn.com.kxcomm.common;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.json.annotations.JSON;
/**
 * 
* 功能描述:分页（可以分多行编写）
* <p>版权所有：中太数据
* <p>未经本公司许可，不得以任何方式复制或使用本程序任何部分
*
* @author 刘小明 新增日期：2013-1-16
* @author 你的姓名 修改日期：2013-1-16
* @since gx-cms
 */
public class PageExt implements Serializable {

	private static final long serialVersionUID = 2728437513842150372L;
	private long totalCount;
	private Object data;
	private String field;
	private String tableName;
	private String condition;
	private String groupBy;
	private String sort;
	private String dir;
	private List<Object> list;
	public List<Object> getList() {
		return list;
	}

	public void setList(List<Object> list) {
		this.list = list;
	}
	private int start;
	private int limit;
	private int page;
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	private int rows;
	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}
	private String anode;
	@JSON(serialize=false)   
	public String getAnode() {
		return anode;
	}

	public void setAnode(String anode) {
		this.anode = anode;
	}

	public PageExt(HttpServletRequest request){

		if(BlankUtil.isBlank(request.getParameter("page"))){
			this.page = 1;
		}else{
			this.page = Integer.parseInt(request.getParameter("page"));
		}
		if(BlankUtil.isBlank(request.getParameter("rows"))){
			this.rows = 20;
		}else{
			this.rows = Integer.parseInt(request.getParameter("rows"));			
		}

		//this.dir = request.getParameter("dir");
		//this.sort = request.getParameter("sort");
	}

	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getGroupBy() {
		return groupBy;
	}
	public void setGroupBy(String groupBy) {
		this.groupBy = groupBy;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}

}
