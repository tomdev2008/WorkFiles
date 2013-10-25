/**
 * 批量删除功能
 * @param parqams
 */
function deletePhotoFrame(parqams){
	var selModel = parqams.getSelectionModel();
	if (selModel.hasSelection()) {
		Ext.Msg.confirm("警告", "确定要删除选中的相框吗？", function (button) {
			if (button == "yes") {
				var selected = selModel.getSelection();
				var Ids = new Array(); //要删除的id
				Ext.each(selected, function (item) {
					Ids.push(item.data.id);
				})
				Ext.Ajax.request({
					url: ctx+'/photoframe/photoframe/photoframe!deleteByIds.action',
					params: { "ids": Ids},
					method: 'post',
					success: function (response, options) {
						var pp  =  Ext.JSON.decode(response.responseText);
						Ext.MessageBox.alert('提示',pp.msg);
						photoFrameStore.load();
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
		Ext.Msg.alert("温馨提示","请选择需要删除的相框!");
		return;
	}
}

/**
 * 单个删除
 * @param id
 */
function deleteOnePhtotFrame(id){
	var Ids = new Array(); //要删除的id
	Ids.push(id);
	Ext.Msg.confirm("警告", "确定要删除该相框吗？", function (button) {
		if (button == "yes") {
			Ext.Ajax.request({
				url: ctx+'/photoframe/photoframe/photoframe!deleteByIds.action',
				params: { "ids": Ids},
				method: 'post',
				success: function (response, options) {
					var pp  =  Ext.JSON.decode(response.responseText);
					Ext.MessageBox.alert('提示',pp.msg);
					photoFrameStore.load();
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
		url: ctx+'/photoframe/photoframe/photoframe!findByPkid.action',
		params: { "id": id},
		method: 'post',
		success: function (response, options) {
			var pp  =  Ext.JSON.decode(response.responseText);
			Ext.getCmp('photoPkid').setValue(pp.model.id);
			Ext.getCmp('photoName').setValue(pp.model.name);
			Ext.getCmp('minuploadFile').setDisabled(true);
			Ext.getCmp('uploadFile').setDisabled(true);
			Ext.getCmp('statusId').setValue(''+pp.model.stauts);
			Ext.getCmp('frameTypeIds').setValue(pp.model.frameType.id);
			
			if(pp.textFramePos!=null){
				Ext.getCmp('textXPos').setValue(pp.textFramePos.xpos);
				Ext.getCmp('textYPos').setValue(pp.textFramePos.ypos);
				Ext.getCmp('textWidth').setValue(pp.textFramePos.width);
				Ext.getCmp('textHeight').setValue(pp.textFramePos.height);
			}
			if(pp.postMarkFramePos!=null){
				Ext.getCmp('postMarkXPos').setValue(pp.postMarkFramePos.xpos);
				Ext.getCmp('postMarkYPos').setValue(pp.postMarkFramePos.ypos);
				Ext.getCmp('postMarkWidth').setValue(pp.postMarkFramePos.width);
				Ext.getCmp('postMarkHeight').setValue(pp.postMarkFramePos.height);
			}
			if(pp.stampFramePos!=null){
				Ext.getCmp('stampXPos').setValue(pp.stampFramePos.xpos);
				Ext.getCmp('stampYPos').setValue(pp.stampFramePos.ypos);
				Ext.getCmp('stampWidth').setValue(pp.stampFramePos.width);
				Ext.getCmp('stampHeight').setValue(pp.stampFramePos.height);
			}
			Ext.getCmp('addwin').show();
		},
		failure: function (response, options) {
			Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
		}
	});
}