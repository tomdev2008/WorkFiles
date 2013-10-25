/**
 * 异步请求用户数据
 */
var postMarkStore = Ext.create('Ext.data.Store', {
	pageSize : thePublicPageSize,   //页面容量,
	fields:['id','name','picUrl','stauts'],
	proxy: {
		type: 'ajax',
		url : ctx+'/postmark/postmark/postmark!findPage.action',
		reader: {
			type: 'json',
			totalProperty : 'pageList.totalCount',
			root: 'pageList.result'
		}
	}
})

postMarkStore.load({			
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
