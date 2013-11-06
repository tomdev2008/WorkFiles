/**
 * 加载用户信息的store
 */
function queryUserList(){
	rolestore.currentPage = 1;
	rolestore.pageSize = thePublicPageSize;
	rolestore.load({			
		params:{
		start:0,
	    limit:thePublicPageSize,
	    'model.rolename' : Ext.getCmp("serviceName").getValue()
		}
	});
	rolestore.on('beforeload', function (store, options) {
	    Ext.apply(store.proxy.extraParams, {
	    	'model.rolename' : Ext.getCmp("serviceName").getValue()
	    });
	});
}


function deleteRole(parqams){
	var selModel = parqams.getSelectionModel();
	if (selModel.hasSelection()) {
		Ext.Msg.confirm("警告", "你确定要是删除该这些角色?", function (button) {
			if (button == "yes") {
				var selected = selModel.getSelection();
				var Ids = new Array(); //要删除的id
				Ext.each(selected, function (item) {
					Ids.push(item.data.id);
				})
				Ext.Ajax.request({
					url: ctx+'/role/role/role!delete.action',
					params: { "ids": Ids},
					method: 'post',
					success: function (response, options) {
						var pp  =  Ext.JSON.decode(response.responseText);
						Ext.MessageBox.alert('提示',pp.msg);
						rolestore.load();
					},
					failure: function (response, options) {
						Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
					}
				});
			}
			else {

			}
		})
	}if(selModel.getSelection()==0){
		Ext.Msg.alert("温馨提示","请选择需要删除的角色!");
		return;
	}
}
function deleteOneOrders(id){
	var Ids = new Array(); //要删除的id
	Ids.push(id);
	Ext.Msg.confirm("警告", "你确定要是删除该订单吗?", function (button) {
		if(button=="yes"){
			Ext.Ajax.request({
				url: ctx+'/order/order/order!delete.action',
				params: { "ids": Ids},
				method: 'post',
				success: function (response, options) {
					var pp  =  Ext.JSON.decode(response.responseText);
					Ext.MessageBox.alert('提示',pp.msg);
					rolestore.load();
				},
				failure: function (response, options) {
					Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
				}
			});
		}else {

		}
	})
}

/**
 * 审核订单
 * @param id
 */
function checked(id){
	var addwin = Ext.getCmp('addwin');
	Ext.Ajax.request({
		url: ctx+'/order/order/order!checked.action',
		params: {"model.id":id},
		method: 'post',
		success: function (response, options) {
			var obj = Ext.decode(response.responseText);
//			Ext.getCmp("form1").add(panel);
			addwin.show();
		},
		failure: function (response, options) {
			Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
		}
	});
}