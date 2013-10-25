Ext.onReady(function() {
	
	/**
	 * 模板类型下拉框
	 */
	var cardTypeCombox=Ext.create('Ext.form.ComboBox', {
		fieldLabel: '模板类型',
		store: cardTypeStore,	
		queryMode: 'local',
		editable:false,
		width:270,
		displayField: 'name',
		allowBlank: false,
		id:'typeId',
		name:'model.cardType.id',
		valueField: 'id',
		listeners:{
			 select:function(){
				 rolIds=Ext.getCmp('typeId').getValue();
			 } 
		}
	});
	//要让它默认选到第几个 把0 改成相应数字就好,超出会报错  
	//cardTypeCombox.setValue( cardTypeCombox.store.getAt(0).get('key') );
	
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
		name:'model.status',
		valueField: 'id',
		listeners:{
			 select:function(){
				 rolIds=Ext.getCmp('statusId').getValue();
			 } 
		}
	});
	//要让它默认选到第几个 把0 改成相应数字就好,超出会报错  
	statusCombox.setValue( statusCombox.store.getAt(0).get('key') );
	
	/**
	 * 工具条
	 */
	var topTool = Ext.create("Ext.toolbar.Toolbar",{
		items:[{
			xtype:'button',
			text:"新增明信片模版",
			iconCls:'add',
			listeners:{
				"click":function(){
					Ext.getCmp('uploadfile').setDisabled(false);
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
					deleteUser(griduser);
				}
			}
		}
		]
	});
	var topTool1 = Ext.create("Ext.toolbar.Toolbar",{
		items:[{
			xtype:'button',
			text:"设为推荐",
			iconCls:'add',
			listeners:{
				"click":function(){
					Ext.MessageBox.alert("提示","成功！");
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
		tbar:topTool,
		renderTo: Ext.getBody(),
		store: templateCardStore,
		selModel : {
			selType : 'checkboxmodel'
		},
		multiSelect : true,
		/**
		 * 'id','cardTitle','wishWord','collectNum','picUrl','status','cardType.name'
		 */
		columns: [
		          { header: 'ID',  dataIndex: 'id',hidden:true},
		          { header: '标题',  dataIndex: 'cardTitle' ,flex:1},
		          { header: '祝福语', dataIndex: 'wishWord', flex:1},
		          { header: '收藏数', dataIndex: 'collectNum', flex:1},
		          { header: '图片地址', dataIndex: 'smallPic', flex:1},
		          { header: '是否显示', dataIndex: 'status', flex:1,hidden:true},
		          { header: '模板类型', dataIndex: 'cardType.name', flex:1},
		          { header: '操作', dataIndex: '',renderer:function(value, meta, rec, rowIdx, colIdx, ds){
		        	  return '<a href="#" onclick="modify(\''+rec.get('id')+'\')">修改</a>|<a href="#" onclick="deleteOneTemplate(\''+rec.get('id')+'\')">删除</a>';
		          }}
		          ],
		          bbar : new Ext.PagingToolbar({   //添加翻页工具条
		        	  store : templateCardStore,   //将数据源添加到分页的工具条中
		        	  displayInfo : true         //显示展示信息
		          })
	});
	
	
//	提交按钮
	var submitButton = new Ext.Button({
		text:"提交",
		listeners:{
			click:function(){
					
				var pkid = Ext.getCmp('pkid').getValue();
				var path = "";
				if(pkid==null || pkid==""){
					path = ctx+'/templateCard/templateCard/templateCard!saveTemplateCard.action'
				}else{
					path = ctx+'/templateCard/templateCard/templateCard!updateTemplateCard.action'
				}
				if(formUpload.form.isValid()){  
			          formUpload.getForm().submit({      
			        	  url:path,
			              success: function(form, action){  
			            	  Ext.Msg.alert('成功','操作成功.');  
			            	  Ext.getCmp('addwin').hide();
			            	  formUpload.form.reset();
			            	  templateCardStore.load();
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
				formUpload.form.reset();
				Ext.getCmp('addwin').hide();
			}			
		}
	});
	
	/**
	 *上传窗口相关
	 */		
	var formUpload = Ext.create('Ext.form.FormPanel', {
		id:'form1',
		frame: true,
//		applyTo:'addwin',
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
		        {xtype:"textfield",fieldLabel:"主键id",name:'model.id',id:'pkid',width:270,maxLength:20,hidden:true},
		        {xtype:"textfield",fieldLabel:"标题",name:'model.cardTitle',id:'cardTitle',width:270,allowBlank: false,maxLength:20},
		        cardTypeCombox,
		        statusCombox, 
		        {xtype: 'filefield',fieldLabel:'文 件',name:'upload',id:'uploadfile',allowBlank: false,blankText: '请上传文件'},
		        {xtype: 'filefield',fieldLabel:'小图片',name:'minUpload',id:'minuploadfile',allowBlank: false,blankText: '请上传文件'},
		        {xtype:"textfield",fieldLabel:"文字X坐标",name:'model.xPosText',id:'xPosText',width:270,allowBlank: false,maxLength:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        {xtype:"textfield",fieldLabel:"文字Y坐标",name:'model.yPosText',id:'yPosText',width:270,allowBlank: false,maxLength:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        {xtype:"textfield",fieldLabel:"文字框宽度",name:'model.widthText',id:'widthText',width:270,allowBlank: false,maxLength:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
		        {xtype:"textfield",fieldLabel:"文字框高度",name:'model.heightText',id:'heightText',width:270,allowBlank: false,maxLength:20,regex:/^\d+$/,regexText:'只能输入整数或小数'},
 			    {xtype:"textareafield",fieldLabel:"祝福语",name:'model.wishWord',id:'note',allowBlank: false}
		        ],
		        buttons:[submitButton,resetButton]
	});
	  
	/**
	 *  上传窗口
	 */
	var winUpload=Ext.create('Ext.window.Window', {
		closeAction:'hide',//关闭窗口只是隐藏窗口，而不是销毁
		id:'addwin',
		title: '设置模板明信片',
		height: 400,
		width: 350,
		constrain:true,	//弹出窗不能超过父窗口的范围
         modal:true,
		layout: 'fit',
		border: false
	}).add(formUpload);
})
	
