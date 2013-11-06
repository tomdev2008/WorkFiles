Ext.onReady(function() {	
	//提交按钮
	var submitButton = new Ext.Button({
		text:"审核",
		border: false,
		listeners:{
			click:function(){
				saveServiceInfo(serviceInfoPanel);
			}
		}
	});
	//取消按钮
	var resetButton = new Ext.Button({	
		text:"取消",
		border: false,
		listeners:{
			click:function(){var addwin = Ext.getCmp('addwin');addwin.hide();}			
		}
	});
	
	/**
	 * 订单状态查询框
	 */
	var statecmbox = Ext.create('Ext.form.field.ComboBox', {
		id:'stateCmBox',
	    fieldLabel: '状态',
	    multiSelect: true,
	    displayField: 'ids',
	    width: 300,
	    labelWidth: 30,
	    store: orderStateStore,
	    queryMode: 'local'
	});
	
	/**
	 * 工具条
	 */
	var topTool = Ext.create("Ext.toolbar.Toolbar",{
		items:[
	    {
			xtype:'button',
			text:"删除",
			iconCls:'delete',
			listeners:{
				"click":function(){
					deleteRole(griduser);
				}
			}
		},
		"订单编号：",
		{xtype:"textfield",fieldLabel:"",id:'serviceName',width:200,maxLength:30},
		"-",
		statecmbox,
		"-",
		{
			xtype:'button',
			text:"查询",
			iconCls:'search_16x16',
			listeners:{
				"click":function(){
					queryUserList(griduser);
				}
			}
		},
		"-",
		{
				xtype:'button',
				iconCls:'edit',
				text:"重置查询条件",
				listeners:{
					"click":function(){
						Ext.getCmp("serviceName").setValue("");
						Ext.getCmp("stateCmBox").setValue("");
					}
				}
			}
		]
	});	
	
	var detailPanel = Ext.create('Ext.grid.Panel', {
		id:'detailPanel',
		autoWidth:true,
		autoHeight:true,
		loadMask:{msg:"数据正在加载中,请耐心等待......"},
		store: orderDetailStore,
//	    selModel : {
//	  	  selType : 'checkboxmodel'
//	    },
		multiSelect : true,
		columns: [
		          { header: 'id',  dataIndex: 'id' ,flex:1},
		          { header: '订单号',  dataIndex: 'orderId' ,flex:1},
		          { header: '操作系统', dataIndex: 'operatingSystemId', flex:1},
		          { header: 'CPU大小', dataIndex: 'cpuSize', flex:1},
		          { header: '内存大小', dataIndex: 'memorySize', flex:1},
		          { header: '系统盘大小', dataIndex: 'systemDiskSize', flex:1},
		          { header: '数据盘大小', dataIndex: 'dataDiskSize', flex:1},
		          { header: '公网大小', dataIndex: 'publicNetwork', flex:1},
		          { header: '数量', dataIndex: 'numbers', flex:1},
		          { header: '价格', dataIndex: 'fee', flex:1},
		          { header: '购买时长', dataIndex: 'buyTime', flex:1},
		          { header: '开始使用时间', dataIndex: 'beginUseTime', flex:1},
		          { header: '结束使用时间', dataIndex: 'endUseTime', flex:1},
		          { header: '时间类型', dataIndex: 'buyTimeType', flex:1}
          ]//,
//          bbar : new Ext.PagingToolbar({   //添加翻页工具条
//        	  pageSize : thePublicPageSize,   //页面容量
//        	  store : orderDetailStore,   //将数据源添加到分页的工具条中
//        	  displayInfo : true         //显示展示信息
//          })
	});
	
	var addwindow = Ext.create('Ext.window.Window', {
		id:'addwin',
		closeAction:'hide',
		title: '审核',
		height: 400,
		constrain:true,	//弹出窗不能超过父窗口的范围
        modal:true,
		width: 1024,
		layout: 'fit',
		border: false,
		items:[detailPanel],
		buttons:[submitButton,resetButton]
	});
	

/**
 * 手势的列表
 */
var griduser=Ext.create('Ext.grid.Panel', {
	autoWidth:true,
	autoHeight:true,
	tbar:topTool,
	loadMask:{msg:"数据正在加载中,请耐心等待......"},
	tbar:topTool,
	renderTo: Ext.getBody(),
	store: orderStore,
    selModel : {
  	  selType : 'checkboxmodel'
    },
    multiSelect : true,
	columns: [
              { header: 'ID',  dataIndex: 'id' ,hidden:true},
	          { header: '订单号',  dataIndex: 'orderNum' ,flex:1},
	          { header: '订单类型', dataIndex: 'type', flex:1,renderer:function(value, meta, rec, rowIdx, colIdx, ds){
	        	   var type = rec.get('type');
                   if(1 == type){
                	   return '试用';
                   }else if(2 == type){
                	   return '购买';
                   }else{
                	   return '无类型';
                   }
	          }},
	          { header: '状态', dataIndex: 'state', flex:1,renderer:function(value, meta, rec, rowIdx, colIdx, ds){
	        	   var state = rec.get('state');
                   if(1 == state){
                	   return '未支付';
                   }else if(2 == state){
                	   return '已支付';
                   }else if(3 ==  state){
                	   return '未开通';
                   }else if(4 ==  state){
                	   return '已开通';
                   }else if(5 ==  state){
                	   return '已作废';
                   }else if(6 ==  state){
                	   return '已删除';
                   }else if(7 ==  state){
                	   return '审核中';
                   }else if(8 ==  state){
                	   return '已审核';
                   }else{
                	   return '无状态';
                   }
	          }},
	          { header: '产品名称', dataIndex: 'productName', flex:1},
	          { header: '创建时间', dataIndex: 'createTime', flex:1,renderer:function(value, meta, rec, rowIdx, colIdx, ds){
	        	  var dateTime = rec.get('createTime');
                  return dateTime;
	          }},
	          { header: '操作', dataIndex: '',renderer:function(value, meta, rec, rowIdx, colIdx, ds){
	   				return '<a href="#" onclick="checked(\''+rec.get('id')+'\')">'+"审核"
	   				+'</a>|<a href="#" onclick="deleteOneOrders(\''+rec.get('id')+'\')">'+"删除"
	   				+'</a>|<a href="#" onclick="detailOrders(\''+rec.get('id')+'\')">'+"详情"
	   				+'</a>';
	          }}
	          ],
	          bbar : new Ext.PagingToolbar({   //添加翻页工具条
	        	  pageSize : thePublicPageSize,   //页面容量
	        	  store : orderStore,   //将数据源添加到分页的工具条中
	        	  displayInfo : true         //显示展示信息
	          })
});

})