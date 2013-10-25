/**
 * 异步请求用户数据
 */
var templateCardStore = Ext.create('Ext.data.Store', {
	pageSize : thePublicPageSize,   //页面容量,
	fields:['id','cardTitle','wishWord','collectNum','picUrl','status','cardType.name','smallPic','xPosText','yPosText','widthText','heightText'],
	proxy: {
		type: 'ajax',
		url : ctx+'/templateCard/templateCard/templateCard!listPage.action',
		reader: {
			type: 'json',
			totalProperty : 'pageList.totalCount',
			root: 'pageList.result'
		}
	}
});

templateCardStore.load({			
	params:{
		start:0,
		limit:10
	}
});

/**
 * 异步请求用户数据
 * 模板明星片类型
 */
var cardTypeStore = Ext.create('Ext.data.Store', {
	fields:['id','name'],
	proxy: {
		type: 'ajax',
		url : ctx+'/templateCard/templateCard/cardType!listAll.action',
		reader: {
			type: 'json',
			root: 'typeList'
		}
	}
});
cardTypeStore.load();


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
