/**
 * 异步请求用户数据
 */
var photoFrameStore = Ext.create('Ext.data.Store', {
	pageSize : thePublicPageSize,   //页面容量,
	fields:['id','name','minUpload','frameType.name','stauts'],
	proxy: {
		type: 'ajax',
		url : ctx+'/photoframe/photoframe/photoframe!findPage.action',
		reader: {
			type: 'json',
			totalProperty : 'pageList.totalCount',
			root: 'pageList.result'
		}
	}
})

photoFrameStore.load({			
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
var frameTypeStore =  Ext.create('Ext.data.Store', {
	fields:['id','name'],
	proxy: {
		type: 'ajax',
		url : ctx+'/photoframe/photoframe/frameType!findAll.action',
		reader: {
			type: 'json',
			root: 'list'
		}
	}
});
frameTypeStore.load();