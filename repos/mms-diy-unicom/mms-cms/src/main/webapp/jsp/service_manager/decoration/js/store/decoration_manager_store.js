/**
 * 异步请求用户数据
 */
var decorationStore = Ext.create('Ext.data.Store', {
	pageSize : thePublicPageSize,   //页面容量,
	fields:['id','name','picUrl','status','decorationType.name'],
	proxy: {
		type: 'ajax',
		url : ctx+'/decoration/decoration/decoration!findPage.action',
		reader: {
			type: 'json',
			totalProperty : 'pageList.totalCount',
			root: 'pageList.result'
		}
	}
})

decorationStore.load({			
	params:{
		start:0,
		limit:10
	}
});

//是否显示
var statusStore = Ext.create('Ext.data.Store', {
	storeId:'statusStore',
	autoLoad: true,
	fields:['id','name'],
	data:{'items':[{'id':'0','name':'是'},
	               {'id':'1','name':'否'}
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
 * 相框类型
 */
var decorationTypeStore =  Ext.create('Ext.data.Store', {
	fields:['id','name'],
	proxy: {
		type: 'ajax',
		url : ctx+'/decoration/decoration/decorationType!findAll.action',
		reader: {
			type: 'json',
			root: 'list'
		}
	}
});
decorationTypeStore.load();

