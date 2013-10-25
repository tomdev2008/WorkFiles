Ext.onReady(function() {

	/**
	 * 工具条
	 */
	var topTool = Ext.create("Ext.toolbar.Toolbar",{
		items:[{
			xtype:'button',
			text:"新增分类",
			iconCls:'add',
			listeners:{
				"click":function(){
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
					deleteCardType(griduser);
				}
			}
		}
		]
	});
	/**
	 * 东的列表
	 */
	var griduser=Ext.create('Ext.grid.Panel', {
		autoWidth:true,
		autoHeight:true,
		tbar:topTool,
		loadMask:{msg:"数据正在加载中,请耐心等待......"},
		tbar:topTool,
		renderTo: Ext.getBody(),
		store: cardTypeStore,
		selModel : {
			selType : 'checkboxmodel'
		},
		multiSelect : true,
		columns: [
		          { header: 'ID',  dataIndex: 'id'},
		          { header: '分类名称',  dataIndex: 'name' ,flex:1},
		          { header: '操作', dataIndex: '',renderer:function(value, meta, rec, rowIdx, colIdx, ds){
		        	  return '<a href="#" onclick="modify(\''+rec.get('id')+','+rec.get('name')+'\')">'+"修改"
		        	  +'</a>|<a href="#" onclick="deleteOneCardType(\''+rec.get('id')+'\')">'+"删除"
		        	  +'</a>';
		          }}
		          ],
		          bbar : new Ext.PagingToolbar({   //添加翻页工具条
		        	  store : cardTypeStore,   //将数据源添加到分页的工具条中
		        	  displayInfo : true         //显示展示信息
		          })
	});

//		提交按钮
		var submitButton = new Ext.Button({
			text:"提交",
			listeners:{
				click:function(){
					saveCardTypeInfo(serviceInfoPanel);
				}
			}
		});
//		取消按钮
		var resetButton = new Ext.Button({
			text:"取消",
			listeners:{
				click:function(){
					serviceInfoPanel.form.reset();
					Ext.getCmp('addwin').hide();
				}			
			}
		});
		/**
		 * 新增窗口panel
		 */		
		var serviceInfoPanel = Ext.create('Ext.form.FormPanel', {
			id:'form1',
			width: 450,
			height: 200,
			bodyPadding: 30,
			url:'',
			frame:true,	
			buttonAlign :'center',
			layout: {
				type: 'table',
				columns: 1
			},
			defaults: { width: 100, height: 28},
			items: [
			        {xtype:"textfield",fieldLabel:"id",id:'cardTypeId',width:270,hidden:true,allowBlank: true},
			        {xtype:"textfield",fieldLabel:"饰物分类名称",id:'cardTypeName',width:270,allowBlank: false,maxLength:20},
			        ],
			        buttons:[submitButton,resetButton]
		});

		/**
		 * 下面是东神的窗口相关
		 */
		var addUser=Ext.create('Ext.window.Window', {
			closeAction:'hide',
			id:'addwin',
			title: '饰物分类操作',
			height: 200,
			width: 450,
			constrain:true,	//弹出窗不能超过父窗口的范围
	         modal:true,
			layout: 'fit',
			border: false
		}).add(serviceInfoPanel);
	});