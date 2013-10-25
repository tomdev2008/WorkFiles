/**
 * 添加选择的模板明信片
 */
function addTemplateCard(){
	var parqams = Ext.getCmp('soureData');
	var selModel = parqams.getSelectionModel();
	if (selModel.hasSelection()) {
		var selectCount = selModel.getCount();
		if(selectCount==1){
			var rightData = Ext.getCmp('isRight').getStore();
			var length = rightData.data.items.length;
			if(length<10){ //每次只能选择10条数据
				//获取选中行的值
				var selected = selModel.getSelection();
				var id = selected[0].get('id');
//				var num = length+1;
				var cardTitle = selected[0].get('cardTitle');
				var status = selected[0].get('state');
				var cardTypeName = selected[0].get('cardTypeName');
				var wishWord = selected[0].get('wishWord');
				//像grid中动态添加行
				var data=[{
					'id':id,
//					'num':num,
					'cardTitle':cardTitle,
					'state':status,
					'cardTypeName':cardTypeName,
					'wishWord':wishWord
				}];
				var flat=true; //判断该数据是否被选中，不重复选择
				for ( var i = 0; i < length; i++) {
					if(rightData.data.items[i].data.id==id){
						flat=false;
					}
				}
				if(flat){
					rightTemplateData.insert(length,data);
				}else{
					Ext.Msg.alert("温馨提示","该数据已经被选过了，请重新选择!");
					return;
				}
			}else{
				Ext.Msg.alert("温馨提示","每次只能设置10条最新推荐!");
				return;
			}
		}else{
			Ext.Msg.alert("温馨提示","每次只能选择一个模板明信片!");
			return;
		}
	}
	if(selModel.getSelection()==0){
		Ext.Msg.alert("温馨提示","请选择需要设置的模板明信片!");
		return;
	}
}

/**
 * 删除选中的模板明信片
 */
function removeTemplateCard(){
	var parqams = Ext.getCmp('isRight');
	var selModel = parqams.getSelectionModel();
	if (selModel.hasSelection()) {
		var selected = selModel.getSelection();
		var rightStore = parqams.getStore();
		var num;
		Ext.each(selected, function (item) {
			num = rightStore.indexOfId(item.data.id);
			rightTemplateData.removeAt(num);
		})
	}else if(selModel.getSelection()==0){
		Ext.Msg.alert("温馨提示","请选择需要移除的模板明信片!");
		return;
	}
}

/**
 * 保存按钮
 */
function submit(){

	var rightData = Ext.getCmp('isRight').getStore();
	var total = rightData.data.items.length;
	if(total==10){
		var Ids = new Array(); //要设置的模板明星片id
		for(var i=0;i<total;i++){
			Ids.push(rightData.data.items[i].data.id);
		}
		Ext.Ajax.request({
			url: ctx+'/newbillboard/newbillboard/newbillboard!add.action',
			params: { "ids": Ids},
			method: 'post',
			success: function (response, options) {
				var pp  =  Ext.JSON.decode(response.responseText);
				Ext.MessageBox.alert('提示',pp.msg);
				newbillboardStore.load();
				Ext.getCmp('newBillboardWin').hide();
			},
			failure: function (response, options) {
				Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
			}
		});
	}else{
		Ext.MessageBox.alert('提示',"必须要选择10条最新推荐。");
	}
}