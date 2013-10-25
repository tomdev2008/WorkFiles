var rolIds = null; 

/**
 * 加载用户信息的store
 */
function saveDecorationTypeInfo(){
	var id = Ext.getCmp('addid').getValue();
	var name=Ext.getCmp('name').getValue();
	var params=Ext.getCmp('form1');
	if(params.form.isValid()) {
		if(id==null||id==''){                    //添加
			Ext.Ajax.request({
				url: ctx+'/decoration/decoration/decorationType!saveType.action',
				params: { "decorationType.name": name},
					method: 'post',
					success: function (response, options) {
						decorationTypeStore.load();
						serviceInfoPanel.form.reset();
						Ext.getCmp('addwin').hide();
						Ext.MessageBox.alert('提示','操作成功');
					},
					failure: function (response, options) {
						Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
					}
			});
		}else{                                     //修改
			Ext.Ajax.request({
				url: ctx+'/decoration/decoration/decorationType!updateType.action',
				params: {"decorationType.id": id, "decorationType.name": name},
					method: 'post',
					success: function (response, options) {
						serviceInfoPanel.form.reset();
						decorationTypeStore.load();
						Ext.getCmp('addwin').hide();
						Ext.MessageBox.alert('提示','操作成功');
					},
					failure: function (response, options) {
						Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
					}
			});
		}
	}else{
		return;
	}

}
//填充
function modify(id){
	var zu=id.split(',');//
	Ext.getCmp('addid').setValue(zu[0]);
	Ext.getCmp('name').setValue(zu[1]);
	var addwin = Ext.getCmp('addwin');
	addwin.show();
}	
//删除
function deleteType(parqams){
	var selModel = parqams.getSelectionModel();
	if (selModel.hasSelection()) {
		Ext.Msg.confirm("警告", "确定要删除选中的饰物类型吗？", function (button) {
			if (button == "yes") {
				var selected = selModel.getSelection();
				var Ids = new Array(); //要删除的id
				Ext.each(selected, function (item) {
					Ids.push(item.data.id);
				})
				Ext.Ajax.request({
					url: ctx+'/decoration/decoration/decorationType!delete.action',
					params: { "ids": Ids},
					method: 'post',
					success: function (response, options) {
						var pp  =  Ext.JSON.decode(response.responseText);
						decorationTypeStore.load();
						Ext.MessageBox.alert('提示',pp.msg);
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
		Ext.Msg.alert("温馨提示","请选择需要删除的饰物类型!");
		return;
	}
}

function deleteOneType(id){
	var Ids = new Array(); //要删除的id
	Ids.push(id);
	Ext.Msg.confirm("警告", "确定要删除该饰物类型吗？", function (button) {
		if (button == "yes") {
			Ext.Ajax.request({
				url: ctx+'/decoration/decoration/decorationType!delete.action',
				params: { "ids": Ids},
				method: 'post',
				success: function (response, options) {
					var pp  =  Ext.JSON.decode(response.responseText);
					decorationTypeStore.load();
					Ext.MessageBox.alert('提示',pp.msg);
				},
				failure: function (response, options) {
					Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
				}
			});
		}
	})
}