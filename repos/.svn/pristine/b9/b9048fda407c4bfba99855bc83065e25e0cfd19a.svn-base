/**
 * 异步请求用户数据
 */
var jobPolicStore = Ext.create('Ext.data.Store', {
	pageSize : thePublicPageSize,   //页面容量,
	fields:['id','policName','msgType','stauts','totalNum','succesNum','faildNum','startSendTime','endSendTime','lastSendTime','remark','creator','createTime'],
	proxy: {
		type: 'ajax',
		url : ctx+'/jobPolic/jobPolic/jobPolic!list.action',
		reader: {
			type: 'json',
			totalProperty : 'pageList.totalCount',
			root: 'pageList.result'
		}
	}
})

jobPolicStore.load({			
	params:{
		start:0,
		limit:10
	}
});

//类型
var mmsTypeStore = Ext.create('Ext.data.Store', {
	storeId:'mmsTypeStore',
	autoLoad: true,
	fields:['id','name'],
	data:{'items':[{'id':'1','name':'短信'},
	               {'id':'2','name':'彩信'}
           ]},
   proxy: {
	   type: 'memory',
	   reader: {
		   type: 'json',
		   root: 'items'
	   }
   }
}); 

//状态
var stautsStore = Ext.create('Ext.data.Store', {
	storeId:'stautsStore',
	autoLoad: true,
	fields:['id','name'],
	data:{'items':[{'id':'0','name':'启动'},
	               {'id':'1','name':'停止'}
           ]},
   proxy: {
	   type: 'memory',
	   reader: {
		   type: 'json',
		   root: 'items'
	   }
   }
}); 

/**
 * 异步请求用户数据
 * 号码类型类型
 */
var pushMdnStore = Ext.create('Ext.data.Store', {
	fields:['id','typeName'],
	proxy: {
		type: 'ajax',
		url : ctx+'/mdnType/mdnType/mdnType!findAll.action',
		reader: {
			type: 'json',
			root: 'list'
		}
	}
});


var startTime=Ext.create('Ext.Panel', {
    layout: {
        type: 'hbox',
    },
    width: 500,
    frame:true,	
    style:'border-width:0 0 0 0;',
 //   frame :false,
 //   renderTo: document.body,
    items: [{xtype: 'datefield',fieldLabel:'开始发送时间',name:'policEntity.startSendDate',id:'startSendDate',allowBlank: false,blankText: '请选择开始发送时间',format: 'Y-m-d',listeners:{
		'select':function(field,value,opts){
		}
	}},//开始发送时间
 {xtype: 'timefield', id:'startTime',fieldLabel: '',width:200,increment: 30,anchor: '80%',format: 'H:i',listeners:{
		'select':function(field,value,opts){
			Ext.getCmp('startT').setValue(Ext.Date.format(value,'H:i'));
		}
 }},
 {xtype:"textfield",name:'policEntity.startTime',id:'startT',width:270,maxLength:20,hidden:true}]
});


var endTime=Ext.create('Ext.Panel', {
    layout: {
        type: 'hbox',
    },
    frame:true,	
    style:'border-width:0 0 0 0;',
 //   renderTo: document.body,
    items: [
			{xtype: 'datefield',
				fieldLabel:'结束发送时间',
				name:'policEntity.endSendDate',
				id:'endSendDate',
				allowBlank: false,
				blankText: '请选择结束发送时间',
				format: 'Y-m-d',listeners:{
					'select':function(field,value,opts){
						var startDate = Ext.getCmp('startSendDate').getValue();
						var endSendDate = Ext.getCmp('endSendDate').getValue();
						if(endSendDate<startDate){
							Ext.MessageBox.alert('提示','结束时间必须大于开始时间.');
							Ext.getCmp('endSendDate').setValue('');
						}
					}
				}},//结束发送时间
			{xtype: 'timefield',id:'endTime',fieldLabel: '',increment: 30,width:200,anchor: '80%',format: 'H:i',listeners:{
				'select':function(field,value,opts){
					if(verification()){
						//设置影藏表单域的值用于传值
						Ext.getCmp('endT').setValue(Ext.Date.format(value,'H:i'));
					}else{
						Ext.MessageBox.alert('提示','结束时间必须大于开始时间.');
						Ext.getCmp('endTime').setValue('');
						Ext.getCmp('endT').setValue('');
					}
				}
			}},
			{xtype:"textfield",name:'policEntity.endTime',id:'endT',width:270,maxLength:20,hidden:true}]
});
pushMdnStore.load();
