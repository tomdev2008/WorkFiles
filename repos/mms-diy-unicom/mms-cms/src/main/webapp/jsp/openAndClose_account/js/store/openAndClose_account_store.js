/**
 * 异步请求用户数据
 */
var pushMdnStore = Ext.create('Ext.data.Store', {
	pageSize : thePublicPageSize,   //页面容量,
	fields:['id','mdnType.typeName','mdn'],
	proxy: {
		type: 'ajax',
		url : ctx+'/pushMdn/pushMdn/pushMdn!list.action',
		reader: {
			type: 'json',
			totalProperty : 'pageList.totalCount',
			root: 'pageList.result'
		}
	}
})

pushMdnStore.load({			
	params:{
		start:0,
		limit:10
	}
});
