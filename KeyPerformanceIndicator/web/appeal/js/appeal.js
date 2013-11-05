/**
 @description 	申诉相关JS方法 工具包 ,此工具包目前只适用于ＩＥ浏览器
 @Verson 		0.01
 @author		xsf
 @date			2010.03.10   
**/


	//流程跟踪信息
	function ev_wlTrace(appealId){
		var url = context+"/listFlowOpinions.do?resourceId="+appealId;
		openWin(url,{showCenter:true,width:600,height:500})
	}
	
	function AA_Show(id){
		openFullScreenWin(context+"/openStaticAssessmentByUser.do?id="+id);
	}