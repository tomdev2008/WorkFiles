Ext.onReady(function() {
	
	
	/**
	 * 相框类型下拉框
	 */
	var cardTypeCombox=Ext.create('Ext.form.ComboBox', {
		fieldLabel: '相框类型',
		store: frameTypeStore,	
		queryMode: 'local',
		editable:false,
		width:270,
		displayField: 'name',
		allowBlank: false,
		id:'frameTypeIds',
		name:'model.frameType.id',
		valueField: 'id',
		listeners:{
			 select:function(){
				 rolIds=Ext.getCmp('frameTypeIds').getValue();
			 } 
		}
	});
	
	/**
	 * 工具条
	 */
	var topTool = Ext.create("Ext.toolbar.Toolbar",{
		items:[{
			xtype:'button',
			text:"新增相框",
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
					deletePhotoFrame(griduser);
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
		store: photoFrameStore,
		selModel : {
			selType : 'checkboxmodel'
		},
		multiSelect : true,
		columns: [
		          { header: 'ID',  dataIndex: 'id',hidden:true},
		          { header: '相框名称',  dataIndex: 'name' ,flex:1},
		          { header: '地址', dataIndex: 'smallFrame', flex:1},
		          { header: '类型', dataIndex: 'frameType.name', flex:1},
		          { header: '是否在web展示', dataIndex: 'status', flex:1,renderer:function(value, meta, rec, rowIdx, colIdx, ds){
		        	   var state = rec.get('stauts');
	                   if(0 == state){
	                	   return '是';
	                   }else if(1 == state){
	                	   return '否';
	                   }
		          }
		          },
		          { header: '操作', dataIndex: '',renderer:function(value, meta, rec, rowIdx, colIdx, ds){
		        	  return '<a href="#" onclick="modify(\''+rec.get('id')+'\')">修改</a>|<a href="#" onclick="deleteOnePhtotFrame(\''+rec.get('id')+'\')">删除</a>';
		          }}
		          ],
	      bbar : new Ext.PagingToolbar({   //添加翻页工具条
        	  store : photoFrameStore,   //将数据源添加到分页的工具条中
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
				
				var pkid = Ext.getCmp('photoPkid').getValue();
				var path = "";
				if(pkid==null || pkid==""){
					path = ctx+'/photoframe/photoframe/photoframe!savePhotoFrame.action'
				}else{
					path = ctx+'/photoframe/photoframe/photoframe!updatePhotoFrame.action'
				}
				
				 if(formUpload.form.isValid()){  
			          formUpload.getForm().submit({      
			        	  url:path,
			              success: function(form, action){  
			            	  Ext.Msg.alert('成功','操作成功.');  
			            	  Ext.getCmp('addwin').hide();
			            	  formUpload.form.reset();
			            	  photoFrameStore.load();
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
		width: 680,
        bodyPadding: 5,
		buttonAlign :'center',
		fieldDefaults: {
            labelAlign: 'center',
            labelWidth: 90,
            anchor: '90%'
        },
        layout: {
        	type: 'table',
            columns: 2
        },
		items: [
		        {xtype:"textfield",fieldLabel:"主键pkid",name:'model.id',id:'photoPkid',width:270,maxLength:20,hidden:true,rowspan: 2},
		        {xtype:"textfield",fieldLabel:"相框名称",name:'model.name',id:'photoName',width:270,allowBlank: false,maxLength:20},
		        cardTypeCombox,
		        statusCombox, 
		        {xtype: 'filefield',fieldLabel:'小图片',name:'minUpload',id:'minuploadFile',allowBlank: false,blankText: '请上传文件'},
		        {xtype: 'filefield',fieldLabel:'文 件',name:'upload',id:'uploadFile',allowBlank: false,blankText: '请上传文件'},
		      
		        {xtype:"textfield",fieldLabel:"文字X坐标",name:'textFramePos.xpos',id:'textXPos',width:270,allowBlank: false,maxLength:20,value:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        {xtype:"textfield",fieldLabel:"文字Y坐标",name:'textFramePos.ypos',id:'textYPos',width:270,allowBlank: false,maxLength:20,value:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        {xtype:"textfield",fieldLabel:"文字框宽度",name:'textFramePos.width',id:'textWidth',width:270,allowBlank: false,maxLength:20,value:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        {xtype:"textfield",fieldLabel:"文字框高度",name:'textFramePos.height',id:'textHeight',width:270,allowBlank: false,maxLength:20,value:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        
		        {xtype:"textfield",fieldLabel:"邮戳X坐标",name:'postMarkFramePos.xpos',id:'postMarkXPos',width:270,allowBlank: false,maxLength:20,value:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        {xtype:"textfield",fieldLabel:"邮戳Y坐标",name:'postMarkFramePos.ypos',id:'postMarkYPos',width:270,allowBlank: false,maxLength:20,value:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        {xtype:"textfield",fieldLabel:"邮戳框宽度",name:'postMarkFramePos.width',id:'postMarkWidth',width:270,allowBlank: false,maxLength:20,value:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        {xtype:"textfield",fieldLabel:"邮戳框高度",name:'postMarkFramePos.height',id:'postMarkHeight',width:270,allowBlank: false,maxLength:20,value:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        
		        {xtype:"textfield",fieldLabel:"邮票X坐标",name:'stampFramePos.xpos',id:'stampXPos',width:270,allowBlank: false,maxLength:20,value:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        {xtype:"textfield",fieldLabel:"邮票Y坐标",name:'stampFramePos.ypos',id:'stampYPos',width:270,allowBlank: false,maxLength:20,value:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        {xtype:"textfield",fieldLabel:"邮票框宽度",name:'stampFramePos.width',id:'stampWidth',width:270,allowBlank: false,maxLength:20,value:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        {xtype:"textfield",fieldLabel:"邮票框高度",name:'stampFramePos.height',id:'stampHeight',width:270,allowBlank: false,maxLength:20,value:20,regex:/^\d+$/,regexText:'只能输入整数或小数'}
		        ],
		        buttons:[submitButton,resetButton]
	
	});  
	  
	/** 
	 * 上传窗口
	 */
	var winUpload=Ext.create('Ext.window.Window', {
		closeAction:'hide',//关闭窗口只是隐藏窗口，而不是销毁
		id:'addwin',
		title: '上传相框',
		height: 400,
		width: 680,
		constrain:true,	//弹出窗不能超过父窗口的范围
         modal:true,
		layout: 'fit',
		border: false
	}).add(formUpload);
})
	
