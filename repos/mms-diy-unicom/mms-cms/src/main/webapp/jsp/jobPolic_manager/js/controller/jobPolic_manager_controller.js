/**
 * 保存按钮
 */
function submit(){
	var pkid = Ext.getCmp('pkid').getValue();
	var path = "";
	if(pkid==null || pkid==""){
		path = ctx+'/jobPolic/jobPolic/jobPolic!saveJobPolic.action'
	}else{
		path = ctx+'/jobPolic/jobPolic/jobPolic!updateJobPolic.action'
	}
	var formPanel = Ext.getCmp('form1');
	if(formPanel.form.isValid()){  
		if(verification()){
			formPanel.getForm().submit({      
	        	  url:path,
	              success: function(form, action){  
	            	  Ext.Msg.alert('成功','操作成功.');  
	            	  Ext.getCmp('jobPolicWin').hide();
	            	  formPanel.form.reset();
	            	  jobPolicStore.load();
	              },      
	               failure: function(form, action){     
	            	   Ext.Msg.alert('Error', action.result.msg);      
	               }  
	            })
		}else{
			 Ext.Msg.alert('Error', '操作失败，结束时间必须大于开始时间.');
		}
     }else{
  	   Ext.Msg.alert('Error', '操作失败，验证不通过.');
     }
}

/**
 * 停止任务
 */
function stop(id){
	Ext.Ajax.request({
		url: ctx+'/jobPolic/jobPolic/jobPolic!stop.action',
		params: { "id": id},
		method: 'post',
		success: function (response, options) {
			var pp  =  Ext.JSON.decode(response.responseText);
			jobPolicStore.load();
			Ext.MessageBox.alert('提示','停止成功！');
		},
		failure: function (response, options) {
			Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
		}
	});
}

/**
 * 启动任务
 */
function start(id){
	Ext.Ajax.request({
		url: ctx+'/jobPolic/jobPolic/jobPolic!start.action',
		params: { "id": id},
		method: 'post',
		success: function (response, options) {
			var pp  =  Ext.JSON.decode(response.responseText);
			jobPolicStore.load();
			Ext.MessageBox.alert('提示','启动成功！');
		},
		failure: function (response, options) {
			Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
		}
	});
}

/**
 * 修改策略
 */
function modify(id){
	Ext.Ajax.request({
		url: ctx+'/jobPolic/jobPolic/jobPolic!findByPkid.action',
		params: { "id": id},
		method: 'post',
		success: function (response, options) {
			var pp  =  Ext.JSON.decode(response.responseText);
			Ext.getCmp('pkid').setValue(pp.model.id);
			Ext.getCmp('policName').setValue(pp.model.policName);
			Ext.getCmp('startSendDate').setValue(pp.policEntity.startSendDate);
			Ext.getCmp('startTime').setValue(Ext.Date.parse(pp.policEntity.startTime,'H:i'));
			Ext.getCmp('startT').setValue(pp.policEntity.startTime);
			Ext.getCmp('endSendDate').setValue(pp.policEntity.endSendDate);
			Ext.getCmp('endTime').setValue(Ext.Date.parse(pp.policEntity.endTime,'H:i'));
			Ext.getCmp('endT').setValue(pp.policEntity.endTime);
			Ext.getCmp('mmsTypeId').setValue(''+pp.model.msgType);
			Ext.getCmp('mmsContent').setValue(''+pp.model.content);
			Ext.getCmp('remark').setValue(pp.model.remark);
			Ext.getCmp('pushMdn').setValue(pp.model.mdnType.id);
			if(1==pp.model.msgType){ //短信
				Ext.getCmp('mmsFile').setVisible(false); //设置为影藏
			}else if(2==pp.model.msgType){ //彩信
				Ext.getCmp('mmsFile').setVisible(true); //设置为显示
			}
			Ext.getCmp('jobPolicWin').show();
		},
		failure: function (response, options) {
			Ext.MessageBox.alert('提示','操作失败，请求超时或网络故障。');
		}
	});
}

/**
 * 时间验证
 */
function verification(){
	var startSendDate = Ext.Date.format(Ext.getCmp('startSendDate').getValue(),'Y-m-d');
	var endSendDate = Ext.Date.format(Ext.getCmp('endSendDate').getValue(),'Y-m-d');
	var startTime = Ext.Date.format(Ext.getCmp('startTime').getValue(),'H:i');
	var endTime = Ext.Date.format(Ext.getCmp('endTime').getValue(),'H:i');
	
	if(Ext.Date.parse(startSendDate+' '+startTime,'Y-m-d H:i',true)<Ext.Date.parse(endSendDate+' '+endTime,'Y-m-d H:i',true)){
		return true;
	}else{
		return false;
	}
}