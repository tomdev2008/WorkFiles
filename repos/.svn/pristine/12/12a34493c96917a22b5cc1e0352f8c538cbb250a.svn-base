Ext.onReady(function() {
	
	/**
	 * 工具条
	 */
	var topTool = Ext.create("Ext.toolbar.Toolbar",{
		items:[{
			xtype:'button',
			text:"上传号码",
			iconCls:'add',
			listeners:{
				"click":function(){
					Ext.getCmp("pushMdnWin").show();
				}
			}
		}]
	});
	
	/**
	 * 列表
	 */
	var griduser=Ext.create('Ext.grid.Panel', {
		autoWidth:true,
		autoHeight:true,
		tbar:topTool,
		loadMask:{msg:"数据正在加载中,请耐心等待......"},
		renderTo: Ext.getBody(),
		store: pushMdnStore,
		selModel : {
			selType : 'checkboxmodel'
		},
		multiSelect : true,
		columns: [
		          { header: 'ID',  dataIndex: 'id',hidden:true},
		          { header: '类型名称',  dataIndex: 'mdnType.typeName' ,flex:1},
		          { header: '手机号码', dataIndex: 'mdn', flex:1}
		          ],
		          bbar : new Ext.PagingToolbar({   //添加翻页工具条
		        	  store : pushMdnStore,   //将数据源添加到分页的工具条中
		        	  displayInfo : true         //显示展示信息
		          }),
		          buttons:[submitButton,resetButton]
	});
	
	
//	提交按钮
	var submitButton = new Ext.Button({
		text:"提交",
		listeners:{
			click:function(){
				var pkid = Ext.getCmp('pkid').getValue();
				var path = "";
				if(pkid==null || pkid==""){
					path = ctx+'/pushMdn/pushMdn/pushMdn!savePushMdn.action'
				}else{
					path = ctx+'/pushMdn/pushMdn/pushMdn!updateTemplateCard.action'
				}
				if(formUpload.form.isValid()){  
			          formUpload.getForm().submit({      
			        	  url:path,
			              success: function(form, action){  
			            	  Ext.Msg.alert('成功','操作成功.');  
			            	  Ext.getCmp('pushMdnWin').hide();
			            	  formUpload.form.reset();
			            	  pushMdnStore.load();
			              },      
			               failure: function(form, action){     
			            	   Ext.Msg.alert('Error', action.result.msg);      
			               }  
			            })             
		         }
			}
		}
	});
//	取消按钮
	var resetButton = new Ext.Button({
		text:"取消",
		listeners:{
			click:function(){
				Ext.getCmp('pushMdnWin').hide();
			}			
		}
	});
	
	/** 
	 * 新增窗口panel
	 */		
	var formUpload = Ext.create('Ext.form.Panel', {
		id:'form1',
		width: 400,
		height: 300,
		bodyPadding: 30,
		url:'',
		frame:true,	
		buttonAlign :'center',
		layout: {
			type: 'vbox',      
	        align: 'stretch', 
	        padding: 10
		},
		items: [
              {xtype:"textfield",fieldLabel:"主键id",name:'id',id:'pkid',width:270,maxLength:20,hidden:true}, //主键id
              {xtype:"textfield",fieldLabel:"类型",name:'mdnType.typeName',id:'typeName',width:270,allowBlank: false,maxLength:20}, //类型名称
              {xtype: 'filefield',fieldLabel:'号码',name:'upload',id:'uploadfile',allowBlank: false,blankText: '请上传文件'},
              {xtype:"textfield",fieldLabel:"备注",name:'mdnType.remark',id:'remark',width:270,allowBlank: false,maxLength:20} //类型名称
           ],
	        buttons:[submitButton,resetButton]
	});
	
	
	/**
	 * 弹出窗口相关
	 */
	var pushMdnWin=Ext.create('Ext.window.Window', {
		closeAction:'hide',
		id:'pushMdnWin',
		title: '上传推送号码',
		height: 300,
		width: 500,
		constrain:true,	//弹出窗不能超过父窗口的范围
         modal:true,
		layout: 'fit',
		border: false
	}).add(formUpload);
	
	
});