/**
 * 异步请求用户数据
 */
var bgMusicStore = Ext.create('Ext.data.Store', {
	pageSize : thePublicPageSize,   //页面容量,
	fields:['id','name','fileUrl','stauts'],
	proxy: {
		type: 'ajax',
		url : ctx+'/bgmusic/bgmusic/bgmusic!list.action',
		reader: {
			type: 'json',
			totalProperty : 'pageList.totalCount',
			root: 'pageList.result'
		}
	}
})

bgMusicStore.load({			
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

