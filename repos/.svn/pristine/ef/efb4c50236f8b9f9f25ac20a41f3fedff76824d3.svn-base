/**
 * 批量删除功能
 * @param parqams
 */
function deleteUser(parqams){
	var selModel = parqams.getSelectionModel();
	if (selModel.hasSelection()) {
		Ext.Msg.confirm("警告", "确定要删除选中的模板明星片吗？", function (button) {
			if (button == "yes") {
				var selected = selModel.getSelection();
				var Ids = new Array(); //要删除的id
				Ext.each(selected, function (item) {
					Ids.push(item.data.id);
				})
				Ext.Ajax.request({
					url: ctx+'/templateCard/templateCard/templateCard!deleteByIds.action',
					params: { "ids": Ids},
					method: 'post',
					success: function (response, options) {
						var pp  =  Ext.JSON.decode(response.responseText);
						Ext.MessageBox.alert('提示',pp.msg);
						templateCardStore.load();
					},
					failure: function (response, options) {
						Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
					}
				});
			}
			else {
				Ext.Msg.alert("错误", "没有任何行被选中，无法进行删除操作！");
			}
		})
	}if(selModel.getSelection()==0){
		Ext.Msg.alert("温馨提示","请选择需要删除的模板明星片!");
		return;
	}
}

/**
 * 单个删除
 * @param id
 */
function deleteOneTemplate(id){
	var Ids = new Array(); //要删除的id
	Ids.push(id);
	Ext.Msg.confirm("警告", "确定要删除该模板明星片吗？", function (button) {
		if (button == "yes") {
			Ext.Ajax.request({
				url: ctx+'/templateCard/templateCard/templateCard!deleteByIds.action',
				params: { "ids": Ids},
				method: 'post',
				success: function (response, options) {
					var pp  =  Ext.JSON.decode(response.responseText);
					Ext.MessageBox.alert('提示',pp.msg);
					templateCardStore.load();
				},
				failure: function (response, options) {
					Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
				}
			});
		}
	})
}

/**
 * 根据主键id查询
 * @param id
 */
function modify(id){
	Ext.Ajax.request({
		url: ctx+'/templateCard/templateCard/templateCard!findByPkid.action',
		params: { "id": id},
		method: 'post',
		success: function (response, options) {
			var pp  =  Ext.JSON.decode(response.responseText);
			Ext.getCmp('pkid').setValue(pp.model.id);
			Ext.getCmp('cardTitle').setValue(pp.model.cardTitle);
			Ext.getCmp('typeId').setValue(pp.model.cardType.id);
			Ext.getCmp('statusId').setValue(''+pp.model.status);
			Ext.getCmp('xPosText').setValue(pp.model.xPosText);
			Ext.getCmp('yPosText').setValue(pp.model.yPosText);
			Ext.getCmp('widthText').setValue(pp.model.widthText);
			Ext.getCmp('heightText').setValue(pp.model.heightText);
			Ext.getCmp('note').setValue(pp.model.wishWord);
			Ext.getCmp('minuploadfile').setDisabled(true);
			Ext.getCmp('uploadfile').setDisabled(true);
			Ext.getCmp('addwin').show();
		},
		failure: function (response, options) {
			Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
		}
	});
}