/**
 * 异步请求角色数据
 */
var orderStore = Ext.create('Ext.data.Store', {
	fields:['id','orderNum','type','state','state','productName','createTime'],
	pageSize : thePublicPageSize,   //页面容量
	proxy: {
		type: 'ajax',
		url : ctx+'/order/order/order!list.action',
		reader: {
			type: 'json',
			totalProperty : 'pageList.totalCount',
			root: 'pageList.result'
		}
	}
});

orderStore.load({			
	params:{
		start:0,
		limit:10
	}
});

var orderDetailStore = Ext.create('Ext.data.Store', {
	fields:['id','orderId','operatingSystemId','cpuSize','memorySize','systemDiskSize','publicNetwork','numbers','fee','buyTime','beginUseTime','endUseTime','dataDiskSize','buyTimeType'],
	pageSize : thePublicPageSize,   //页面容量
	proxy: {
		type: 'ajax',
		url : ctx+'/order/order/order!ordersDetail.action',
		reader: {
			type: 'json',
			totalProperty : 'pageList.totalCount',
			root: 'pageList.result'
		}
	}
})

orderDetailStore.load({			
	params:{
		start:0,
		limit:10
	}
});

//查询时筛选器类型
var orderStateStore = Ext.create('Ext.data.Store', {
    storeId:'filterType',
    autoLoad: true,
    fields:['ids','state'],
    data:{'items':[
                {'ids':'未支付','state':'1'},   
               	{'ids':'已支付','state':'2'},
            	{'ids':'未开通','state':'3'},
               	{'ids':'已开通','state':'4'},
               	{'ids':'已作废','state':'5'},
               	{'ids':'删除','state':'6'},
               	{'ids':'审核中','state':'7'},
               	{'ids':'已审核','state':'8'}
            	]},
    proxy: {
        type: 'memory',
        reader: {
            type: 'json',
            root: 'items'
        }
    }
});