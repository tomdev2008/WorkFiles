/**
 * 异步请求用户数据
 */
var cardTypeStore = Ext.create('Ext.data.Store', {
	pageSize : thePublicPageSize,   //页面容量,
	fields:['id','name'],
	proxy: {
		type: 'ajax',
		url : ctx+'/templateCard/templateCard/cardType!list.action',
		reader: {
			type: 'json',
			totalProperty : 'pageList.totalCount',
			root: 'pageList.result'
		}
	}
})

cardTypeStore.load({			
	params:{
		start:0,
		limit:10
	}
});

