/**
 * 批量删除功能
 * @param parqams
 */
function deleteDecoration(parqams){
	var selModel = parqams.getSelectionModel();
	if (selModel.hasSelection()) {
		Ext.Msg.confirm("警告", "确定要删除选中的饰物吗？", function (button) {
			if (button == "yes") {
				var selected = selModel.getSelection();
				var Ids = new Array(); //要删除的id
				Ext.each(selected, function (item) {
					Ids.push(item.data.id);
				})
				Ext.Ajax.request({
					url: ctx+'/decoration/decoration/decoration!deleteByIds.action',
					params: { "ids": Ids},
					method: 'post',
					success: function (response, options) {
						var pp  =  Ext.JSON.decode(response.responseText);
						Ext.MessageBox.alert('提示',pp.msg);
						decorationStore.load();
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
		Ext.Msg.alert("温馨提示","请选择需要删除的饰物!");
		return;
	}
}

/**
 * 单个删除
 * @param id
 */
function deleteOneDecoration(id){
	var Ids = new Array(); //要删除的id
	Ids.push(id);
	Ext.Msg.confirm("警告", "确定要删除该饰物吗？", function (button) {
		if (button == "yes") {
			Ext.Ajax.request({
				url: ctx+'/decoration/decoration/decoration!deleteByIds.action',
				params: { "ids": Ids},
				method: 'post',
				success: function (response, options) {
					var pp  =  Ext.JSON.decode(response.responseText);
					Ext.MessageBox.alert('提示',pp.msg);
					decorationStore.load();
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
		url: ctx+'/decoration/decoration/decoration!findByPkid.action',
		params: { "id": id},
		method: 'post',
		success: function (response, options) {
			var pp  =  Ext.JSON.decode(response.responseText);
			Ext.getCmp('decorationPkid').setValue(pp.model.id);
			Ext.getCmp('decorationName').setValue(pp.model.name);
			Ext.getCmp('uploadFile').setDisabled(true);
			Ext.getCmp('statusId').setValue(''+pp.model.status);
			Ext.getCmp('decorationTypeId').setValue(pp.model.decorationType.id);
			Ext.getCmp('addwin').show();
		},
		failure: function (response, options) {
			Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
		}
	});
}