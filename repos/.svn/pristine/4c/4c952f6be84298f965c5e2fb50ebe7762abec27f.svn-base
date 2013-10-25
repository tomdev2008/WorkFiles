Ext.onReady(function() {
	
	/**
	 * 工具条
	 */
	var topTool = Ext.create("Ext.toolbar.Toolbar",{
		items:[{
			xtype:'button',
			text:"新增最热推荐",
			iconCls:'add',
			listeners:{
				"click":function(){
					Ext.getCmp("hotBillboardWin").show();
				}
			}
		}]
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
		renderTo: Ext.getBody(),
		store: hotbillboardStore,
		selModel : {
			selType : 'checkboxmodel'
		},
		multiSelect : true,
		columns: [
		          { header: 'ID',  dataIndex: 'id',hidden:true},
		          { header: 'top1',  dataIndex: 'top1.cardTitle' ,flex:1},
		          { header: 'top2', dataIndex: 'top2.cardTitle', flex:1},
		          { header: 'top3', dataIndex: 'top3.cardTitle', flex:1},
		          { header: 'top4',  dataIndex: 'top4.cardTitle' ,flex:1},
		          { header: 'top5', dataIndex: 'top5.cardTitle', flex:1},
		          { header: 'top6', dataIndex: 'top6.cardTitle', flex:1},
		          { header: 'top7',  dataIndex: 'top7.cardTitle' ,flex:1},
		          { header: 'top8', dataIndex: 'top8.cardTitle', flex:1},
		          { header: 'top9', dataIndex: 'top9.cardTitle', flex:1},
		          { header: 'top10',  dataIndex: 'top10.cardTitle' ,flex:1},
		          ],
		          bbar : new Ext.PagingToolbar({   //添加翻页工具条
		        	  store : hotbillboardStore,   //将数据源添加到分页的工具条中
		        	  displayInfo : true         //显示展示信息
		          }),
		          buttons:[submitButton,resetButton]
	});
	
	
//	提交按钮
	var submitButton = new Ext.Button({
		text:"提交",
		listeners:{
			click:function(){
				submit();
			}
		}
	});
//	取消按钮
	var resetButton = new Ext.Button({
		text:"取消",
		listeners:{
			click:function(){
				Ext.getCmp('hotBillboardWin').hide();
			}			
		}
	});
	
	//添加到左边
	var goleft = new Ext.Button({
		text:"添加",
		listeners:{
			click:function(){
				addTemplateCard();
			}			
		}
	});
	
	//添加到右边
	var goright = new Ext.Button({
		text:"移除",
		listeners:{
			click:function(){
				removeTemplateCard();
			}			
		}
	});
	
	/** 
	 * 新增窗口panel
	 */		
	var serviceInfoPanel = Ext.create('Ext.form.FormPanel', {
		id:'form1',
		width: 1200,
		height: 550,
		bodyPadding: 30,
		url:'',
		frame:true,	
		buttonAlign :'center',
		layout:"column",
		items: [
		        {xtype:"gridpanel",id:'soureData',height: 500,width: 500,
		        		store:leftTemplateData, 
		        		selModel : {
		        			selType : 'checkboxmodel'
		        		},
			            columns:[
									{ header: 'ID',  dataIndex: 'id',hidden:true},
									{ header: '标题',  dataIndex: 'cardTitle' ,flex:0.8},
									{ header: '状态', dataIndex: 'state', flex:0.3,renderer:function(value, meta, rec, rowIdx, colIdx, ds){
											if(0==value){
											  	return "显示";
										  	}else if(1==value){
										  		return "不显示";
										  	}else{
										  		return "无";
										  	}
									}},
									{ header: '类型',  dataIndex: 'cardTypeName' ,flex:0.5},
									{ header: '祝福语', dataIndex: 'wishWord', flex:1.5}
					          ], 
			            stripeRows:true, 
			            title:'数据源',
			            listeners: {
			            	itemdblclick: function(dataview, record, item, index, e) {
			            		addTemplateCard();
			                }
			            }
		        	},{
			            	  xtype:"panel",
			                  layout:"form",
			                  width:50,
			                  items:[
				            	goleft,
				            	goright
				              ]
			            },
			    {xtype:"gridpanel",id:'isRight',height: 500,width: 500,
		        		store:rightTemplateData,
		        		selModel : {
		        			selType : 'checkboxmodel'
		        		},
			            columns:[
			                      { header: 'ID',  dataIndex: 'id',hidden:true}, 
				   		          { header: '标题',  dataIndex: 'cardTitle' ,flex:0.8},
						          { header: '状态', dataIndex: 'state', flex:0.3,renderer:function(value, meta, rec, rowIdx, colIdx, ds){
										if(0==value){
										  	return "显示";
									  	}else if(1==value){
									  		return "不显示";
									  	}else{
									  		return "无";
									  	}
						          }},
						          { header: '类型',  dataIndex: 'cardTypeName' ,flex:0.5},
						          { header: '祝福语', dataIndex: 'wishWord', flex:1.5}
					          ], 
			            stripeRows:true, 
			            title:'管理员'}
		        ],
		        buttons:[submitButton,resetButton]
	});
	
	
	/**
	 * 弹出窗口相关
	 */
	var addhotBillboard=Ext.create('Ext.window.Window', {
		closeAction:'hide',
		id:'hotBillboardWin',
		title: '设置最热推荐',
		height: 550,
		width: 1200,
		constrain:true,	//弹出窗不能超过父窗口的范围
         modal:true,
		layout: 'fit',
		border: false
	}).add(serviceInfoPanel);
	
	
});