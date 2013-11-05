/**
 @description 	考核相关JS方法 工具包 ,此工具包目前只适用于ＩＥ浏览器
 @Verson 		0.01
 @author		xsf
 @date			2010.03.10   
**/
	//员工的，
	function ev_cal(){
		try{
			var scaleControl = $_EN("scale");
			if(scaleControl){
				var scaleTotal = 0;
				for(var i=0;i<scaleControl.length;i++){
					scaleTotal += parseFloat(scaleControl[i].value);
				}
				$_E("scaleTotal").value = scaleTotal;
			}
		}catch(e){}
		try{
			var scoreControl = $_EN("score");
			if(scoreControl){
				var scoreTotal = 0;
				for(var i=0;i<scoreControl.length;i++){
					scoreTotal += (parseFloat(scoreControl[i].value));
				}
				$_E("scoreTotal").value = Util.formatNumber(scoreTotal,"##.##");
				
			}
		}catch(e){}
	}
	//组织的，不同点在于，组织按权重评分
	function ev_calOrg(){
		try{
			var scaleControl = $_EN("scale");
			if(scaleControl){
				var scaleTotal = 0;
				for(var i=0;i<scaleControl.length;i++){
					scaleTotal += parseFloat(scaleControl[i].value);
				}
				$_E("scaleTotal").value = scaleTotal;
			}
		}catch(e){}
		try{
			var scoreControl = $_EN("score");
			if(scoreControl){
				var scoreTotal = 0;
				for(var i=0;i<scoreControl.length;i++){
					scoreTotal += (parseFloat(scoreControl[i].value));
				}
				$_E("scoreTotal").value = Util.formatNumber(scoreTotal,"##.##");
				
			}
		}catch(e){}
	}
	//对添加的指标重新排序
	function AA_Resort(){
		var priority = document.getElementsByName("priority");
		if(priority && priority.length>0){
			for(var i=0;i<priority.length;i++){
				priority[i].value = i+1;
			}
		}
	}
	
	/**
	  * 删除指标按钮
	  **/
	function ev_delete(){
			var idx = 0;
			if(SelectUtil.checkedCount("priorityCBX")>0){
				if(window.confirm("你确认删除选择的指标项?")){
					if(ev_ajax(context+"/deleteAssessmentIndicators.do")){
						window.location.reload(); 
					}
				}
			}else{
				alert('请先选择您要删除的指标项，然后再重试一次。');
			}
	}
	//导入指标
	function ev_import(assId, flowCode){
		var returnValue = window.showModalDialog(context+"/web/ass/wf/dlg/indicator_upload_dlg.jsp?id="+assId+"&flowCode="+flowCode,window,"dialogHeight:600px;dialogWidth:1000px;status=on");
		if(returnValue){//如果有返回值,刷新页面
			window.location.reload();
		}
	}
	//导出指标模板
	function ev_export(assId, type){
		window.location.href = context+"/exportIndicatorTemplate.do?id="+assId+"&type="+type;
	}
	
	//查看指标项
	function ev_edit(indicatorId,assId){
		var url = context+"/editAssIndicatorByDlg.do?isUndo=false&indicatorId="+indicatorId+"&id="+assId;
		window.showModalDialog(url,window,"dialogWidth:900px;dialogHeight:750px;status=no;");
	}
	//说明
	function ev_showRemark(idx, isUndo){
		var flag = isUndo || false;
		var url = context+"/web/ass/wf/ass_wf_opinion_form.jsp?isUndo="+flag+"&index="+idx;
		var retV = window.showModalDialog(url,window,"dialogHeight:600px;dialogWith:500px;status=no;scroll=no;");
	}
	//流程跟踪信息
	function ev_wlTrace(assId, nodeCode){
		var url = context+"/listFlowOpinions.do?resourceId="+assId+"&nodeCode="+nodeCode;
		openWin(url,{showCenter:true,width:600,height:500})
	}
	
	function VC_Chnage(dom){}
