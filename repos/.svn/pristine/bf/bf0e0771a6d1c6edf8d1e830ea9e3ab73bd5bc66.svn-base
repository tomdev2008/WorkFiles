/**
 * 异步请求用户数据
 */
var decorationTypeStore = Ext.create('Ext.data.Store', {
	pageSize : thePublicPageSize,   //页面容量,
	fields:['id','name'],
	proxy: {
		type: 'ajax',
		url : ctx+'/decoration/decoration/decorationType!findPage.action',
		reader: {
			type: 'json',
			totalProperty : 'pageList.totalCount',
			root: 'pageList.result'
		}
	}
})

decorationTypeStore.load({			
	params:{
		start:0,
		limit:10
	}
});

