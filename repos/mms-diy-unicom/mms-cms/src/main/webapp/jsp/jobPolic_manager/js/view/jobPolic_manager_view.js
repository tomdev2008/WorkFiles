Ext.onReady(function() {
	
	/**
	 * 工具条
	 */
	var topTool = Ext.create("Ext.toolbar.Toolbar",{
		items:[{
			xtype:'button',
			text:"新增任务",
			iconCls:'add',
			listeners:{
				"click":function(){
					Ext.getCmp("jobPolicWin").show();
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
		store: jobPolicStore,
		selModel : {
			selType : 'checkboxmodel'
		},
		multiSelect : true,
		columns: [
		          { header: 'ID',  dataIndex: 'id',hidden:true},
		          { header: '策略名称',  dataIndex: 'policName' ,flex:1},
		          { header: '类型', dataIndex: 'msgType', flex:0.5,renderer:function(value, meta, rec, rowIdx, colIdx, ds){
		        	   var state = rec.get('msgType');
	                   if(1 == state){
	                	   return '短信';
	                   }else if(2 == state){
	                	   return '彩信';
	                   }
		          }},
		          { header: '状态', dataIndex: 'stauts', flex:0.5,renderer:function(value, meta, rec, rowIdx, colIdx, ds){
		        	   var state = rec.get('stauts');
	                   if(0 == state){
	                	   return '启动';
	                   }else if(1 == state){
	                	   return '停止';
	                   }
		          }},
		          { header: '群发总数', dataIndex: 'totalNum', flex:0.5},
		          { header: '成功数', dataIndex: 'succesNum', flex:0.5},
		          { header: '失败数',  dataIndex: 'faildNum' ,flex:0.5},
		          { header: '开始发送时间',  dataIndex: 'startSendTime' ,flex:1},
		          { header: '结束发送时间',  dataIndex: 'endSendTime' ,flex:1},
		          { header: '最后发送时间',  dataIndex: 'lastSendTime' ,flex:1},
		          { header: '描述', dataIndex: 'remark', flex:1},
		          { header: '创建者', dataIndex: 'creator', flex:1,hidden:true},
		          { header: '创建时间',  dataIndex: 'createTime' ,flex:1},
		          { header: '操作', dataIndex: '',renderer:function(value, meta, rec, rowIdx, colIdx, ds){
		        	  var stauts = rec.get('stauts');
		        	  var edit="";
		        	  if(0==stauts){
		        		  edit = '<a href="#" onclick="stop(\''+rec.get('id')+'\')">停止</a>|';
		        	  }else if(1==stauts){
		        		  edit = '<a href="#" onclick="start(\''+rec.get('id')+'\')">启动</a>|';
		        	  }
		        	  return edit+'<a href="#" onclick="modify(\''+rec.get('id')+'\')">修改</a>|<a href="#" onclick="deleteOneJobPolic(\''+rec.get('id')+'\')">删除</a>';
		          }}
		          ],
		          bbar : new Ext.PagingToolbar({   //添加翻页工具条
		        	  store : jobPolicStore,   //将数据源添加到分页的工具条中
		        	  displayInfo : true         //显示展示信息
		          })
	});
	
	
//	提交按钮
	var submitButton = new Ext.Button({
		text:"提交",
		listeners:{
			click:function(){
//				var date = Ext.getCmp('startSendDate').getValue();
//				var time = Ext.getCmp('startTime').getValue();
//				alert("date:"+Ext.Date.format(date,'Y-m-d')+",time:"+Ext.Date.format(time,'H:i'));
				submit();
			}
		}
	});
//	取消按钮
	var resetButton = new Ext.Button({
		text:"取消",
		listeners:{
			click:function(){
				serviceInfoPanel.form.reset();
				Ext.getCmp('jobPolicWin').hide();
			}			
		}
	});
	
	/**
	 * 类型下拉框
	 */
	var mmsTypeCombox=Ext.create('Ext.form.ComboBox', {
		fieldLabel: '类型',
		store: mmsTypeStore,	
		queryMode: 'local',
		editable:false,
		width:270,
		displayField: 'name',
		allowBlank: false,
		id:'mmsTypeId',
		name:'model.msgType',
		valueField: 'id',
		listeners:{
			 select:function(){
				 rolIds=Ext.getCmp('mmsTypeId').getValue();
				 if(1==rolIds){ //短信
					 Ext.getCmp('mmsFile').setVisible(false); //设置为影藏
					 Ext.getCmp('mmsFile').allowBlank = true;
				 }else if(2==rolIds){ //彩信
					 Ext.getCmp('mmsFile').setVisible(true); //设置为显示
					 Ext.getCmp('mmsFile').allowBlank = false;
				 }
			 } 
		}
	});
	mmsTypeCombox.setValue("1");
	
	/**
	 * 推送号码下拉框
	 */
  	var pushMdnComboBox = Ext.create('Ext.form.ComboBox', { //推送号码
  		fieldLabel: '推送号码',
  		store: pushMdnStore,	
  		queryMode: 'local',
  		editable:false,
  		displayField: 'typeName',
  		allowBlank: false,
  		width:200,
  		id:'pushMdn',
  		name:'model.mdnType.id',
  		valueField: 'id',
  		listeners:{
  			 select:function(){
  				 rolIds=Ext.getCmp('pushMdn').getValue();
  			 } 
  		}
	})
      		
	/** 
	 * 新增窗口panel
	 */		
	var serviceInfoPanel = Ext.create('Ext.form.Panel', {
		id:'form1',
		width: 550,
		height: 550,
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
              {xtype:"textfield",fieldLabel:"主键id",name:'model.id',id:'pkid',width:270,maxLength:20,hidden:true}, //主键id
              {xtype:"textfield",fieldLabel:"策略名称",name:'model.policName',id:'policName',width:270,allowBlank: false,maxLength:20}, //策略名称
              mmsTypeCombox, //类型
              startTime,
              endTime,
//             {	
//            	  layout: {type:'hbox',padding: 10}, 
//        	  	  items:[
//        	  	         {xtype: 'datefield',fieldLabel:'开始发送时间',name:'policEntity.startSendDate',id:'startSendDate',allowBlank: false,blankText: '请选择开始发送时间',format: 'Y-m-d',listeners:{
//								'select':function(field,value,opts){
//								}
//							}},//开始发送时间
//            	         {xtype: 'timefield', id:'startTime',fieldLabel: '',increment: 30,anchor: '80%',format: 'H:i',listeners:{
//								'select':function(field,value,opts){
//									Ext.getCmp('startT').setValue(Ext.Date.format(value,'H:i'));
//								}
//						 }},
//            	         {xtype:"textfield",name:'policEntity.startTime',id:'startT',width:270,maxLength:20,hidden:true}]//用于传入参数
//            	  
//              },
//              {	
//        		  layout: {type:'hbox',padding: 10},   
//        	  	  items:[
//							{xtype: 'datefield',
//								fieldLabel:'结束发送时间',
//								name:'policEntity.endSendDate',
//								id:'endSendDate',
//								allowBlank: false,
//								blankText: '请选择结束发送时间',
//								format: 'Y-m-d',listeners:{
//									'select':function(field,value,opts){
//										var startDate = Ext.getCmp('startSendDate').getValue();
//										var endSendDate = Ext.getCmp('endSendDate').getValue();
//										if(endSendDate<startDate){
//											Ext.MessageBox.alert('提示','结束时间必须大于开始时间.');
//											Ext.getCmp('endSendDate').setValue('');
//										}
//									}
//								}},//结束发送时间
//							{xtype: 'timefield',id:'endTime',fieldLabel: '',increment: 30,anchor: '80%',format: 'H:i',listeners:{
//								'select':function(field,value,opts){
//									if(verification()){
//										//设置影藏表单域的值用于传值
//										Ext.getCmp('endT').setValue(Ext.Date.format(value,'H:i'));
//									}else{
//										Ext.MessageBox.alert('提示','结束时间必须大于开始时间.');
//										Ext.getCmp('endTime').setValue('');
//										Ext.getCmp('endT').setValue('');
//									}
//								}
//							}},
//							{xtype:"textfield",name:'policEntity.endTime',id:'endT',width:270,maxLength:20,hidden:true}] //用于传入参数
//            	  
//              },
              {xtype: 'filefield',fieldLabel:'彩信文件',name:'upload',id:'mmsFile',allowBlank: true,blankText: '请上传文件',hidden:true},//彩信文件 
              {xtype:"textareafield", grow:true,fieldLabel:"内容",name:'model.content',id:'mmsContent',width:270,allowBlank: false,maxLength:20}, //内容
              pushMdnComboBox, //推送号码
              {xtype:"textareafield",grow:true,fieldLabel:"描述",name:'model.remark',id:'remark',width:270,maxLength:20}
           ],
	        buttons:[submitButton,resetButton]
	});
  	
	
	/**
	 * 弹出窗口相关
	 */
	var jobPolicWin=Ext.create('Ext.window.Window', {
		closeAction:'hide',
		id:'jobPolicWin',
		title: '设置任务策略',
		height: 550,
		width: 550,
		constrain:true,	//弹出窗不能超过父窗口的范围
         modal:true,
		layout: 'fit',
		border: false
	}).add(serviceInfoPanel);
	
	
});