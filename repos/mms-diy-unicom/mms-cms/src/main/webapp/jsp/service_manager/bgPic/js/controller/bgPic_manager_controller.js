/**
 * 批量删除功能
 * @param parqams
 */
function deleteBgPic(parqams){
	var selModel = parqams.getSelectionModel();
	if (selModel.hasSelection()) {
		Ext.Msg.confirm("警告", "确定要删除选中的背景图片吗？", function (button) {
			if (button == "yes") {
				var selected = selModel.getSelection();
				var Ids = new Array(); //要删除的id
				Ext.each(selected, function (item) {
					Ids.push(item.data.id);
				})
				Ext.Ajax.request({
					url: ctx+'/bgPic/bgPic/bgPic!deleteByIds.action',
					params: { "ids": Ids},
					method: 'post',
					success: function (response, options) {
						var pp  =  Ext.JSON.decode(response.responseText);
						Ext.MessageBox.alert('提示',pp.msg);
						bgPicStore.load();
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
		Ext.Msg.alert("温馨提示","请选择需要删除的背景图片!");
		return;
	}
}

/**
 * 单个删除
 * @param id
 */
function deleteOneBgPic(id){
	var Ids = new Array(); //要删除的id
	Ids.push(id);
	Ext.Msg.confirm("警告", "确定要删除该背景图片吗？", function (button) {
		if (button == "yes") {
			Ext.Ajax.request({
				url: ctx+'/bgPic/bgPic/bgPic!deleteByIds.action',
				params: { "ids": Ids},
				method: 'post',
				success: function (response, options) {
					var pp  =  Ext.JSON.decode(response.responseText);
					Ext.MessageBox.alert('提示',pp.msg);
					bgPicStore.load();
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
		url: ctx+'/bgPic/bgPic/bgPic!findByPkid.action',
		params: { "id": id},
		method: 'post',
		success: function (response, options) {
			var pp  =  Ext.JSON.decode(response.responseText);
			Ext.getCmp('bgPicPkid').setValue(pp.model.id);
			Ext.getCmp('bgPicName').setValue(pp.model.name);
			Ext.getCmp('minuploadFile').setDisabled(true);
			Ext.getCmp('uploadFile').setDisabled(true);
			Ext.getCmp('statusId').setValue(''+pp.model.status);
			Ext.getCmp('addwin').show();
		},
		failure: function (response, options) {
			Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
		}
	});
}