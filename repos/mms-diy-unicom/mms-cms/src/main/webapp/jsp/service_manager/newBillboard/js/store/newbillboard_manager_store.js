/**
 * 异步请求用户数据
 */
var newbillboardStore = Ext.create('Ext.data.Store', {
	pageSize : thePublicPageSize,   //页面容量,
	fields:['id','top1.cardTitle','top2.cardTitle','top3.cardTitle','top4.cardTitle','top5.cardTitle','top6.cardTitle','top7.cardTitle','top8.cardTitle','top9.cardTitle','top10.cardTitle'],
	proxy: {
		type: 'ajax',
		url : ctx+'/newbillboard/newbillboard/newbillboard!findPage.action',
		reader: {
			type: 'json',
			totalProperty : 'pageList.totalCount',
			root: 'pageList.result'
		}
	}
})

newbillboardStore.load({			
	params:{
		start:0,
		limit:10
	}
});

/**
 * 弹出层模板明信片列表
 */
var leftTemplateData = Ext.create('Ext.data.Store', {
	pageSize : thePublicPageSize,   //页面容量,
	fields:['id','cardTitle','state','cardTypeName','wishWord'],
	proxy: {
		type: 'ajax',
		url : ctx+'/templateCard/templateCard/templateCard!listAll.action',
		reader: {
			type: 'json',
//			totalProperty : 'pageList.totalCount',
			root: 'cardList'
		}
	}
})

leftTemplateData.load();

/**
 * 
 */
var rightTemplateData = Ext.create('Ext.data.Store', {
	pageSize : thePublicPageSize,   //页面容量,
	fields:['id','cardTitle','state','cardTypeName','wishWord']//, 'num',
})

rightTemplateData.load();
