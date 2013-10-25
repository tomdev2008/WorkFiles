/**
 * 批量删除功能
 * @param parqams
 */
function deleteBgmusic(parqams){
	var selModel = parqams.getSelectionModel();
	if (selModel.hasSelection()) {
		Ext.Msg.confirm("警告", "确定要删除选中的背景音乐吗？", function (button) {
			if (button == "yes") {
				var selected = selModel.getSelection();
				var Ids = new Array(); //要删除的id
				Ext.each(selected, function (item) {
					Ids.push(item.data.id);
				})
				Ext.Ajax.request({
					url: ctx+'/bgmusic/bgmusic/bgmusic!deleteByIds.action',
					params: { "ids": Ids},
					method: 'post',
					success: function (response, options) {
						var pp  =  Ext.JSON.decode(response.responseText);
						Ext.MessageBox.alert('提示',pp.msg);
						bgMusicStore.load();
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
		Ext.Msg.alert("温馨提示","请选择需要删除的背景音乐!");
		return;
	}
}

/**
 * 单个删除
 * @param id
 */
function deleteOneBgMusic(id){
	var Ids = new Array(); //要删除的id
	Ids.push(id);
	Ext.Msg.confirm("警告", "确定要删除该背景音乐吗？", function (button) {
		if (button == "yes") {
			Ext.Ajax.request({
				url: ctx+'/bgmusic/bgmusic/bgmusic!deleteByIds.action',
				params: { "ids": Ids},
				method: 'post',
				success: function (response, options) {
					var pp  =  Ext.JSON.decode(response.responseText);
					Ext.MessageBox.alert('提示',pp.msg);
					bgMusicStore.load();
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
		url: ctx+'/bgmusic/bgmusic/bgmusic!findByPkid.action',
		params: { "id": id},
		method: 'post',
		success: function (response, options) {
			var pp  =  Ext.JSON.decode(response.responseText);
			Ext.getCmp('bgmusicPkid').setValue(pp.model.id);
			Ext.getCmp('bgmusicName').setValue(pp.model.name);
			Ext.getCmp('uploadFile').setDisabled(true);
			Ext.getCmp('statusId').setValue(''+pp.model.stauts);
			Ext.getCmp('addwin').show();
		},
		failure: function (response, options) {
			Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
		}
	});
}