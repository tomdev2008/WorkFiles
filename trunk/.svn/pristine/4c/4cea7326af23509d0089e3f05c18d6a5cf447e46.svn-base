package cn.com.kxcomm.selfservice.action.system;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.kxcomm.common.BlankUtil;
import cn.com.kxcomm.entity.TenantsEntity;
import cn.com.kxcomm.selfservice.action.BaseAction;
import cn.com.kxcomm.selfservice.service.CommonService;
import cn.com.kxcomm.selfservice.service.TenantsService;


public class TenantsAction extends BaseAction<TenantsEntity, String> {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static Logger log = Logger.getLogger(TenantsAction.class);

	@Autowired(required = true)
	private TenantsService tenantsService;
	



	private TenantsEntity userEntity;

	private List<TenantsEntity> list;

	private String ids;
	
	private String id;

	/**
	 * 保存/更新操作是否成功标识
	 */
	private boolean saveTag;

	private String success;
	
	private String msg;

	private String field;
	
	/**
	 * 总记录数
	 */
	public long totalCount;
	
	public int start;
	
	public int limit;
	
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

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	
	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
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

//	public String getIds() {
//		return ids;
//	}
//
//	public void setIds(String ids) {
//		this.ids = ids;
//	}

	public TenantsEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(TenantsEntity userEntity) {
		this.userEntity = userEntity;
	}

	public List<TenantsEntity> getList() {
		return list;
	}
	
	public void setList(List<TenantsEntity> list) {
		this.list = list;
	}

	/**
	 * 
	* 方法用途和描述: 登陆
	* @return
	* @author chenliang 新增日期：2013-9-10
	* @since system_center_cms
	 */
	public String tenantsLogin(){
		System.out.println("Login success.....");
		System.out.println("tenantsService:"+this.tenantsService);
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String list() throws Exception {
//		Page page = new Page(this.getHttpRequest());
//		UserQueryVO userQueryVo = null;
//		if (BlankUtil.isBlank(this.getQueryVo())) {
//			userQueryVo = new UserQueryVO();
//		} else {
//			userQueryVo = this.getQueryVo();
//		}		
//		Page resultPage = this.userService.search(userQueryVo,page);
//
//		this.setList(resultPage.getResult());
//		this.setTotalCount(resultPage.getTotalCount());
		
		return SUCCESS;

	}

	public String selectEntity(){
		System.out.println("id:"+id);
//		userEntity = userService.getEntityById(id);
		success = "true";
		msg = "查询成功";
		return SUCCESS;
		
	}
	public String save() {// TODO 在service中合并为一个方法 saveorupdate
		TenantsEntity user = this.getUserEntity();
		if (BlankUtil.isBlank(user.getId())) {// 新增保存
//			user.setCreateTime(DateFormatUtil.getCurrentDate());
//			user.setId(DateFormatUtil.getCurrentTimeStr());
//			System.out.println("before save,user.getId():"+user.getId());
//			this.userService.save(user);
			msg ="ok";
			
		} else {		
			System.out.println("before update user.getId():"+user.getId());
			this.tenantsService.update(user);
			msg="ok";
		}
		success = "true";
		this.setSaveTag(true);
		return SUCCESS;
	}
	
	public String delete(){
		String[] idsArr = ids.split(",");
		System.out.println(ids);
		List<String> userIds = new ArrayList<String>();
		for(String userId : idsArr){
			userIds.add(userId);
		}
//		this.userService.delete(userIds);
		success="true";
		msg="ok";
		return SUCCESS;
	}
	

	private List listMenu = null;
	public List getListMenu() {
		return listMenu;
	}

	public void setListMenu(List listMenu) {
		this.listMenu = listMenu;
	}

	public String selectMenu(){
		String path = getHttpRequest().getContextPath();
		listMenu = new ArrayList();
		System.out.println(1111);
		Hashtable<String,String> h = new Hashtable<String,String>();
		h.put("title","角色管理");
		h.put("collapsed","true");
		h.put("html","<a href=\"javascript:aaa(1,\'角色列表\',\'"+path+"/jsp/user_manager/role_list.jsp')\" >角色列表</a>");
		
		Hashtable<String,String> h1 = new Hashtable<String,String>();
		h1.put("title","精细化营销");
		h1.put("collapsed","true");
		h1.put("html","<a href=\"javascript:aaa(1,\'任务管理\',\'"+path+"/jsp/marketing_manager/task_manager/task_manager_list.jsp\')\" >任务管理</a></br><a href=\"javascript:aaa(2,\'用户策略管理\',\'"+path+"/jsp/marketing_manager/user_policy_manager/user_policy_list.jsp\')\" >用户策略管理</a></br><a href=\"javascript:aaa(3,\'歌曲策略管理\',\'"+path+"/jsp/marketing_manager/ring_policy_manager/ring_policy_list.jsp\')\" >歌曲策略管理</a>");		
		listMenu.add(h);
		listMenu.add(h1);
		return SUCCESS;
	} 



	private List<Hashtable<String,Object>> columModleList;
	public List<Hashtable<String,Object>> getColumModleList() {
		return columModleList;
	}

	public void setColumModleList(List<Hashtable<String,Object>> columModleList) {
		this.columModleList = columModleList;
	}
	private List<Hashtable<String,Object>> fieldNamesList ;
	public List<Hashtable<String, Object>> getFieldNamesList() {
		return fieldNamesList;
	}

	public void setFieldNamesList(List<Hashtable<String, Object>> fieldNamesList) {
		this.fieldNamesList = fieldNamesList;
	}
	private List<Hashtable<String,Object>> dataList ;
	public List<Hashtable<String, Object>> getDataList() {
		return dataList;
	}

	public void setDataList(List<Hashtable<String, Object>> dataList) {
		this.dataList = dataList;
	}

	public String selectTable(){
		Hashtable<String,Object> h = new Hashtable<String,Object>();
		fieldNamesList = new ArrayList<Hashtable<String,Object>>();//字段
		h = new Hashtable<String,Object>();
		h.put("name","日期");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","新增用户_类型1");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","新增用户_类型2");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","新增用户_类型3");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","新增用户_类型4");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","新增用户_合计");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","用户状态_开户");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","用户状态_销户");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","用户状态_暂停");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","用户状态_激活");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","用户状态_合计");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","当前用户_个人用户");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","当前用户_集团用户");
		fieldNamesList.add(h);
		h = new Hashtable<String,Object>();
		h.put("name","当前用户_合计");
		fieldNamesList.add(h);
		
		
		
		
		
		
		columModleList = new ArrayList<Hashtable<String,Object>>();
		for(int i = 0 ; i  < columModleList.size() ; i++){
			Hashtable<String,Object> h1 = columModleList.get(i);
			h1.put("header", h1.get("date"));
			h1.put("dataIndex", h1.get("date"));
		}
		//列模型
		h.put("header", "日期");
		h.put("dataIndex", "日期");
		columModleList.add(h);
		h = new Hashtable<String,Object>();
		h.put("header","新增用户_类型1");
		h.put("dataIndex","新增用户_类型1");
		columModleList.add(h);

		h = new Hashtable<String,Object>();
		h.put("header","新增用户_类型2");
		h.put("dataIndex","新增用户_类型2");
		columModleList.add(h);

		h = new Hashtable<String,Object>();
		h.put("header","新增用户_类型3");
		h.put("dataIndex","新增用户_类型3");
		columModleList.add(h);

		h = new Hashtable<String,Object>();
		h.put("header","新增用户_类型4");
		h.put("dataIndex","新增用户_类型4");
		columModleList.add(h);

		h = new Hashtable<String,Object>();
		h.put("header","新增用户_合计");
		h.put("dataIndex","新增用户_合计");		
		columModleList.add(h);
		h = new Hashtable<String,Object>();
		h.put("header","用户状态_开户");
		h.put("dataIndex","用户状态_开户");
		columModleList.add(h);
		h = new Hashtable<String,Object>();
		h.put("header","用户状态_销户");
		h.put("dataIndex","用户状态_销户");
		columModleList.add(h);		
		h = new Hashtable<String,Object>();
		h.put("header","用户状态_暂停");
		h.put("dataIndex","用户状态_暂停");
		columModleList.add(h);		
		h = new Hashtable<String,Object>();
		h.put("header","用户状态_激活");
		h.put("dataIndex","用户状态_激活");
		columModleList.add(h);		
		h = new Hashtable<String,Object>();
		h.put("header","用户状态_合计");
		h.put("dataIndex","用户状态_合计");
		columModleList.add(h);				
		h = new Hashtable<String,Object>();
		h.put("header","当前用户_个人用户");
		h.put("dataIndex","当前用户_个人用户");
		columModleList.add(h);			
		h = new Hashtable<String,Object>();
		h.put("header","当前用户_集团用户");
		h.put("dataIndex","当前用户_集团用户");
		columModleList.add(h);					
		h = new Hashtable<String,Object>();
		h.put("header","当前用户_合计");
		h.put("dataIndex","当前用户_合计");
		columModleList.add(h);
		



		return SUCCESS;
	}

	public String selectData(){
		System.out.println(1);
		dataList = new ArrayList<Hashtable<String,Object>>();//数据
		Hashtable<String,Object> h = new Hashtable<String,Object>();//列模型
		if(start>0){
			for(int i = 0 ;i  < 11 ; i++){
				if(i<10){
					h = new Hashtable<String,Object>();
					h.put("日期","2009-01-01");
					h.put("新增用户_类型1","11");
					h.put("新增用户_类型2","22");
					h.put("新增用户_类型3","33");
					h.put("新增用户_类型4","44");
					h.put("新增用户_合计","110");
					h.put("用户状态_开户", "10");
					h.put("用户状态_销户", "20");
					h.put("用户状态_激活", "30");
					h.put("用户状态_暂停", "40");
					h.put("用户状态_合计", "100");
					h.put("当前用户_个人用户", "300");
					h.put("当前用户_集团用户", "400");
					h.put("当前用户_合计", "700");
					dataList.add(h);
				}else{
					h = new Hashtable<String,Object>();
					h.put("日期","合计");
					h.put("新增用户_类型1","110");
					h.put("新增用户_类型2","220");
					h.put("新增用户_类型3","330");
					h.put("新增用户_类型4","440");
					h.put("新增用户_合计","1100");
					h.put("用户状态_开户", "100");
					h.put("用户状态_销户", "200");
					h.put("用户状态_激活", "300");
					h.put("用户状态_暂停", "400");
					h.put("用户状态_合计", "1000");
					h.put("当前用户_个人用户", "3000");
					h.put("当前用户_集团用户", "4000");
					h.put("当前用户_合计", "7000");
					dataList.add(h);					
				}
			}		
		}else{
			for(int i = 0 ;i  < 11 ; i++){
				if(i<10){
					h = new Hashtable<String,Object>();
					h.put("日期","2009-01-01");
					h.put("新增用户_类型1","110");
					h.put("新增用户_类型2","220");
					h.put("新增用户_类型3","330");
					h.put("新增用户_类型4","440");
					h.put("新增用户_合计","1100");
					h.put("用户状态_开户", "100");
					h.put("用户状态_销户", "200");
					h.put("用户状态_激活", "300");
					h.put("用户状态_暂停", "400");
					h.put("用户状态_合计", "1000");
					h.put("当前用户_个人用户", "3000");
					h.put("当前用户_集团用户", "4000");
					h.put("当前用户_合计", "7000");
					dataList.add(h); 
				}else{
					h = new Hashtable<String,Object>();
					h.put("日期","合计");
					h.put("新增用户_类型1","1100");
					h.put("新增用户_类型2","2200");
					h.put("新增用户_类型3","3300");
					h.put("新增用户_类型4","4400");
					h.put("新增用户_合计","11000");
					h.put("用户状态_开户", "1000");
					h.put("用户状态_销户", "2000");
					h.put("用户状态_激活", "3000");
					h.put("用户状态_暂停", "4000");
					h.put("用户状态_合计", "10000");
					h.put("当前用户_个人用户", "30000");
					h.put("当前用户_集团用户", "40000");
					h.put("当前用户_合计", "70000");
					dataList.add(h); 					
				}
			}				
		}
		this.totalCount=20;
		return SUCCESS;
	}

	public String exportCsv() throws ServletException, IOException{
		List<Object> list = new ArrayList<Object>();
		for(int  i = 0 ; i < 10 ; i++){
			List<String> list1 = new ArrayList<String>();
			for(int j = 0 ; j < 3 ; j++){
				list1.add(j+"");
			}
			list.add(list1);
		}

		this.getHttpRequest().setAttribute("fileName", "fileName");
		this.getHttpRequest().setAttribute("list",list); 
		RequestDispatcher dis = this.getHttpRequest().getRequestDispatcher("/jsp/common/jsp/downloadCsv.jsp");
		dis.forward(getHttpRequest(), getHttpResponse());
		return NONE;
	}

	@Override
	public CommonService getCommonService() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TenantsEntity getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setModel(TenantsEntity model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setIds(String[] ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String[] getIds() {
		// TODO Auto-generated method stub
		return null;
	}
}
