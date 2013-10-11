package cn.com.kxcomm.selfservice.action.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.kxcomm.selfservice.action.BaseAction;
import cn.com.kxcomm.selfservice.entity.TbRight;
import cn.com.kxcomm.selfservice.service.CommonService;
import cn.com.kxcomm.selfservice.service.RightService;
import cn.com.kxcomm.selfservice.vo.MenuEntity;
import cn.com.kxcomm.selfservice.vo.RightEntity;


public class RightAction  extends BaseAction<TbRight,Integer>{
	
	private static final long serialVersionUID = 1L;
	public static Logger log = Logger.getLogger(RightAction.class);
	
	@Autowired(required = true)
	private RightService rightService;
	
	private List<Map<String,Object>> rightList ; //菜单列表
	
	private List<MenuEntity> menuList ; 
	
	public List<MenuEntity> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<MenuEntity> menuList) {
		this.menuList = menuList;
	}

	public List<Map<String, Object>> getRightList() {
		return rightList;
	}
	
	public void setRightList(List<Map<String, Object>> rightList) {
		this.rightList = rightList;
	}
	
	/**
	 * 
	* 方法用�1�7�和描述: 查询 菜单
	* @return
	* @author chenliang 新增日期：2013-1-14
	* @since mms-cms-unicom
	 */
	public String queryMenu(){
		rightList = new ArrayList<Map<String, Object>>();
		menuList = rightService.queryMenu();
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
		return successInfo(null);
	}
	
	/**
	 * 
	* 方法用�1�7�和描述:根据主键查询
	* @return
	* @author chenliang 新增日期：2013-1-14
	* @since mms-cms-unicom
	 */
	public String findById(){
		log.info("model:"+getModel().toString());
		model = rightService.getByPk(getModel().getId());
		return successInfo(null);
	}
	
	@Override
	public CommonService getCommonService() {
		return rightService;
	}
	@Override
	public TbRight getModel() {
		if(null==this.model){
			this.model = new TbRight();
		}
		return this.model;
	}
	@Override
	public void setModel(TbRight model) {
		this.model = this.model;
	}
	@Override
	public Integer[] getIds() {
		return this.ids;
	}
	@Override
	public void setIds(Integer[] ids) {
		this.ids = ids;
	}
}
