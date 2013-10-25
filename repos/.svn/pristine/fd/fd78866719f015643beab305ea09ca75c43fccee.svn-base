Ext.onReady(function() {
	/**
	 * 工具条
	 */
	var topTool = Ext.create("Ext.toolbar.Toolbar",{
		items:[{
			xtype:'button',
			text:"新增背景音乐",
			iconCls:'add',
			listeners:{
				"click":function(){
					Ext.getCmp('uploadFile').setDisabled(false);
					Ext.getCmp('addwin').show();
				}
			}
		},"-",
		{
			xtype:'button',
			text:"删除",
			iconCls:'delete',
			listeners:{
				"click":function(){
					deleteBgmusic(griduser);
				}
			}
		}
		]
	});

	/**
	 * 列表
	 */
	var griduser=Ext.create('Ext.grid.Panel', {
		autoWidth:true,
		autoHeight:true,
		tbar:topTool,
		loadMask:{msg:"数据正在加载中,请耐心等待......"},
		tbar:topTool,
		renderTo: Ext.getBody(),
		store: bgMusicStore,
		selModel : {
			selType : 'checkboxmodel'
		},
		multiSelect : true,
		columns: [
		          { header: 'ID',  dataIndex: 'id',hidden:true},
		          { header: '音乐名称',  dataIndex: 'name' ,flex:1},
		          { header: '是否在web展示', dataIndex: 'stauts', flex:1,renderer:function(value, meta, rec, rowIdx, colIdx, ds){
		        	   var state = rec.get('stauts');
	                   if(0 == state){
	                	   return '是';
	                   }else if(1 == state){
	                	   return '否';
	                   }
		          }},
		          { header: '地址', dataIndex: 'fileUrl', flex:1},
		          { header: '操作', dataIndex: '',renderer:function(value, meta, rec, rowIdx, colIdx, ds){
		        	  return '<a href="#" onclick="modify(\''+rec.get('id')+'\')">修改</a>|<a href="#" onclick="deleteOneBgMusic(\''+rec.get('id')+'\')">删除</a>';
		          }}
		          ],
		          bbar : new Ext.PagingToolbar({   //添加翻页工具条
		        	  store : bgMusicStore,   //将数据源添加到分页的工具条中
		       	  displayInfo : true         //显示展示信息
		          })
	});
	/**
	 * 提交按钮
	 */
	var submitButton = new Ext.Button({
		text:"提交",
		listeners:{
			click:function(){
				
				var pkid = Ext.getCmp('bgmusicPkid').getValue();
				var path = "";
				if(pkid==null || pkid==""){
					path = ctx+'/bgmusic/bgmusic/bgmusic!saveBgmusic.action'
				}else{
					path = ctx+'/bgmusic/bgmusic/bgmusic!updateBgmusic.action'
				}
				
				 if(formUpload.form.isValid()){  
			          formUpload.getForm().submit({      
			        	  url:path,
			              success: function(form, action){  
			            	  Ext.getCmp('addwin').hide();
			            	  formUpload.form.reset();
			            	  bgMusicStore.load();
			            	  Ext.Msg.alert('成功','操作成功.');  
			              },      
			               failure: function(form, action){     
			            	   Ext.Msg.alert('Error', action.result.msg);      
			               }  
			            })             
		         }
			}
		}
	});
	/**
	 * 取消按钮
	 */
	var resetButton = new Ext.Button({
		text:"取消",
		listeners:{
			click:function(){
				formUpload.form.reset();
				Ext.getCmp('addwin').hide();
			}			
		}
	});
	/**
	 * 是否显示
	 */
	var statusCombox=Ext.create('Ext.form.ComboBox', {
		fieldLabel: '是否显示',
		store: statusStore,	
		queryMode: 'local',
		editable:false,
		width:270,
		displayField: 'name',
		allowBlank: false,
		id:'statusId',
		name:'model.stauts',
		valueField: 'id',
		listeners:{
			 select:function(){
				 rolIds=Ext.getCmp('statusId').getValue();
			 } 
		}
	});
	
	/** 
	 * 上传窗口相关
	 */
	var formUpload = new Ext.form.FormPanel({
		id:'form1',
		frame: true,
		method : 'post',
		fileUpload: true,
		enctype:'multipart/form-data',
		waitMsg:'正在上传...',
		width: 340,
        bodyPadding: 5,
		buttonAlign :'center',
		fieldDefaults: {
            labelAlign: 'center',
            labelWidth: 90,
            anchor: '90%'
        },
		items: [
		        {xtype:"textfield",fieldLabel:"主键pkid",name:'model.id',id:'bgmusicPkid',width:270,maxLength:20,hidden:true},
		        {xtype:"textfield",fieldLabel:"背景音乐名称",name:'model.name',id:'bgmusicName',width:270,allowBlank: false,maxLength:20},
		        statusCombox, 
		        {xtype: 'filefield',fieldLabel:'文 件',name:'upload',id:'uploadFile',allowBlank: false,blankText: '请上传文件'}
		        ],
		        buttons:[submitButton,resetButton]
	
	});  
	  
	/** 
	 * 上传窗口
	 */
	var winUpload=Ext.create('Ext.window.Window', {
		closeAction:'hide',//关闭窗口只是隐藏窗口，而不是销毁
		id:'addwin',
		title: '上传背景音乐',
		height: 250,
		width: 350,
		constrain:true,	//弹出窗不能超过父窗口的范围
         modal:true,
		layout: 'fit',
		border: false
	}).add(formUpload);
})
	
