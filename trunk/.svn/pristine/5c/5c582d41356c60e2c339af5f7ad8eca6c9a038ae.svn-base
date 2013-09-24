package cn.com.kxcomm.selfservice.action.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.kxcomm.base.action.BaseAction;
import cn.com.kxcomm.entity.RightEntity;
import cn.com.kxcomm.selfservice.service.RightService;
import cn.com.kxcomm.selfservice.vo.MenuEntity;


public class RightAction  extends BaseAction{
	private static final long serialVersionUID = 1L;
	public static Logger log = Logger.getLogger(RightAction.class);
	@Autowired(required = true)
	private RightService rightService;
	private RightEntity rightEntity;
	private List<RightEntity> list;
	private ArrayList<MenuEntity> menuList;
	private String msg;
	private String success;
	private String id;
	private boolean saveTag;
	/**
	 * 总记录数
	 */
	private long totalCount;
	private int start;
	private int limit;
	
	public long getTotalCount() {
		return totalCount;
	}
	public ArrayList<MenuEntity> getMenuList() {
		return menuList;
	}
	public void setMenuList(ArrayList<MenuEntity> menuList) {
		this.menuList = menuList;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
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
	public RightEntity getRightEntity() {
		return rightEntity;
	}
	public void setRightEntity(RightEntity rightEntity) {
		this.rightEntity = rightEntity;
	}
	public List<RightEntity> getList() {
		return list;
	}
	public void setList(List<RightEntity> list) {
		this.list = list;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getSuccess() {
		return success;
	}
	public void setSuccess(String success) {
		this.success = success;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public boolean isSaveTag() {
		return saveTag;
	}
	public void setSaveTag(boolean saveTag) {
		this.saveTag = saveTag;
	}
	public String save() {
		if (rightEntity.getRightId()==null) {
			this.rightService.save(rightEntity);
			log.debug(rightEntity.toString());
			msg = "ok";
		} else {
			this.rightService.update(rightEntity);
			msg = "ok";
			log.debug(rightEntity.toString());
		}
		success = "true";
		this.setSaveTag(true);
		return SUCCESS;
	}
	
	public String selectRight(){
		log.debug("select ringPolicy Entity id:"+id);
		rightEntity = rightService.selectRight(id);
		msg = "ok";
		success = "true";
		return SUCCESS;
	}
	
	public String deleteRight(){
		log.debug("delete ringPolicy Entity id:"+id);
		rightService.deleteRight(id);
		msg = "ok";
		success = "true";
		return SUCCESS;
	}
	
	public String deleteRightByList(){
		rightService.deleteRightByList(id);
		msg = "ok";
		success = "true";
		return SUCCESS;
	}
	
	public String list() throws Exception {
		this.list = rightService.queryAll();
		return SUCCESS;
	}
	private List<Map<String,Object>> rightList ;
	public List<Map<String, Object>> getRightList() {
		return rightList;
	}
	public void setRightList(List<Map<String, Object>> rightList) {
		this.rightList = rightList;
	}
	public String queryMenu(){
		rightList = new ArrayList<Map<String, Object>>();
		this.menuList = rightService.queryMenu();
		for(int i = 0 ; i < menuList.size() ; i++){
			MenuEntity me = menuList.get(i);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("text", getText(me.getMenuName()));
			map.put("cls", "folder");
			List<Hashtable<String,Object>> l = new ArrayList<Hashtable<String,Object>>();
			if(me.getList().size()>0){
				for(int j = 0 ; j < me.getList().size() ; j++){
					RightEntity re = me.getList().get(j);
					Hashtable<String,Object> h = new Hashtable<String,Object>();
					h.put("text", getText(re.getRightName()));
					h.put("leaf", true);
					h.put("id", re.getRightId());
					h.put("checked", false);
					l.add(h);
					map.put("children",l); 
				}
			}
			rightList.add(map);
		}
		return SUCCESS;
	}

	private List<Hashtable<String,String>> listMenu = null;
	public List<Hashtable<String,String>> getListMenu() {
		return listMenu;
	}

	public void setListMenu(List<Hashtable<String,String>> listMenu) {
		this.listMenu = listMenu;
	}
	/**
	 * 
	* 方法用途和描述: 查询导航菜单（可以分多行编写）
	* @return
	* @author libu 新增日期：2010-6-23
	* @author 你的姓名 修改日期：2010-6-23
	* @since zte_crbt_bi
	 */
	public String selectMenu(){
		String path = getHttpRequest().getContextPath();
		listMenu = new ArrayList<Hashtable<String,String>>();
		this.menuList = rightService.queryMenu();
		log.debug(menuList.size()+"\t");
		StringBuffer sb = new StringBuffer();
		for(int i = 0 ; i < menuList.size() ; i++){
			MenuEntity me = menuList.get(i);
			log.debug(me.toString());
			Hashtable<String,String> h = new Hashtable<String,String>();
			h.put("title",me.getMenuName());
			h.put("collapsed","true");
			log.debug(me.getList().size()+"jjskss");
			if(!me.getList().isEmpty()){
//				System.out.println(me.getList().size());
				for(int j = 0 ; j < me.getList().size() ; j++){
					RightEntity re = me.getList().get(j);
					sb.append("<div class=changPage style=\"border:1px solid #50cfff;background-color:#f4f4f4;padding:4px;margin:0px 0px -12px 0px\"><a href=\"javascript:goPage('"+re.getRightId()+"','"+re.getRightName()+"','"+path+re.getUrl()+"')\">"+re.getRightName()+"</a></div></br>");
//					System.out.println(sb.toString());
				}
				h.put("html", sb.toString());
				
				sb.delete(0, sb.toString().length());
			}
			listMenu.add(h);
		}
		return SUCCESS;
	}
}
