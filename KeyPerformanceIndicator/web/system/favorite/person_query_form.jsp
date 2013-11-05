<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="java.util.Set"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.ArrayList"/>
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<jsp:directive.page import="com.shengdai.kpi.system.favorite.vo.PersonQuery"/>
<jsp:directive.page import="com.shengdai.kpi.system.favorite.vo.PersonQueryData"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<%
	String operation = ParamUtils.getDefaultStringValue(request,"operation","");
	PersonQuery personQuery = (PersonQuery)request.getAttribute("personQuery");
	String url = personQuery.getUrl();
	String action = personQuery.getAction();
	
%>
	<title>
		查询条件设置
	</title>
	<%@ include file="/web/pub/head.inc"%>
	
	
	
    <script>
    var operation = "<%=operation%>";
    var queryObject = null;
    var ajaxReturn = "";
    var urlArray = new Array();
	urlArray[0] = new Option("考核表查询","${ROOT}/web/assessment/qry/person_assessment_qry.jsp");
	urlArray[1] = new Option("考核进度报表","${ROOT}/web/assessment/report/reportA_query.jsp");
	
	var urlMapArray = new Array();
	urlMapArray[0] = "${ROOT}/web/assessment/qry/person_assessment_qry.jsp";
	urlMapArray[1] = "${ROOT}/web/assessment/report/reportA_query.jsp";
	
	var actionArray = new Array();
	actionArray[0] = "${ROOT}/queryPersonAssessment.do";
	actionArray[1] = "${ROOT}/reportA.do";
	function  onInit()
	{
	  
	    var url = "";
	    if(operation=="edit")
	    {
	       url ="<%=url%>";
	    }
	    
	    var list = document.getElementById("selctUrl");
	    
	    document.getElementById("queryAction").value=actionArray[0];
	    var i;
		list.length = 0;
		//alert(urlArray.length);
		for(i=0;i<urlArray.length;i++)
		{				
			list.options[i] = urlArray[i];
			//alert("list.options[i].value:"+list.options[i].value);
			if(list.options[i].value==url)
			{
			   
			  list.options[i].selected = true;
			  document.getElementById("queryAction").value=actionArray[i];
			}
		}
		
		checkQuery();
	}
	
	/**
	*  当 可定制报表：选择框的选项发生改变时
	   iframe的链接发生更新，javascript 对象Query 的内容要更新
	*/
	function showUrlLink()
	{
	     var queryName = document.getElementById("selctUrl").value;
	     for(var i=0;i<urlMapArray.length;i++)
	     {
	       if(urlMapArray[i]==queryName)
	       {
	          document.getElementById("queryAction").value=actionArray[i];
	       }
	     }
	     
	     if(queryObject!=null)
	        {
	          queryObject=null;
	          queryObject = new Query(queryName);
	          
	        }
	    //alert(queryName);    
	    document.getElementById("reportFrame").src=queryName;    
	}
	
	

	
	/*                   --------------------     saveQuery()
	   保存指定的的查询条件 
	   AJAX
	*/
	function saveQuery()
	{
	
	    //alert(document.getElementById("reportFrame"));
	    //alert(document.reportFrame);
	    //alert(reportFrame.checkForm2());
	    var queryName = document.getElementById("selctUrl").value;
	    if(CheckForm(form1)&&reportFrame.checkForm2()){
	       var info2 = document.getElementById("orgInfop2").value;
           if(!(info2.length>1))
    	   {
    	   	   alert("请输入 范围 输入项！");
    	       return false;
    	   }
	        
	        if(queryObject!=null)
	        {
	          queryObject = null;
	        }
	        queryObject = new Query(queryName);
	        reportFrame.query_in(queryObject);
	        
	        document.getElementById("queryDate").value = queryObject.compUrl() ;
			//alert(queryObject.compUrl());
			form1.action="${ROOT}/savePersonQuery.do";	
			form1.submit();
		}
		
	    // queryObject = 
	   //  query_in();
	 //  var url = "${ROOT}/createFavorite.do?favoriteInfo="+encodeURI(outputValue)+"&parentId="+retArray[1];
	 // LoadAjaxContentSyn(url,callback); 
	}
	
	
	
	
	/*
	   页面进入时根据选择框的选项show出查询页面
	   如果operation="edit" 则要show出查询条件
	   捡出指定的的查询条件 
	   
	*/
	function checkQuery()
	{
		
	
	    var selectObject = document.getElementById("selctUrl");
		var selectValue = selectObject.options[selectObject.selectedIndex].value;
		///alert("selectValue:"+selectValue);
		//document.getElementById("reportFrame").src=selectValue;
		
		
		if(operation=="edit")
	    {
	       var queryName = document.getElementById("selctUrl").value;
	       if(queryObject==null)
	        {
	          
	          queryObject = new Query(queryName);
	        }
	      <%
	          
	          if(personQuery.getQueryDatas()!=null)
	          {
	            List dataList = new ArrayList(personQuery.getQueryDatas());
	            if(dataList!=null&&dataList.size()>0)
	             {
	                for(int i=0;i<dataList.size();i++)
	                {
	                   PersonQueryData data =(PersonQueryData)dataList.get(i);
	                   %>
	                   
	                   queryObject.addCondition({"paraName":"<%=data.getParaName()%>","paraCode":"<%=data.getParaCode()%>","showValue":"<%=data.getParaShowValue()%>","inputValue":"<%=data.getParaValue()%>"});
	                   <%
	                }
	             }
	          }
	          
	      %>
	   
	      
	    }
	    document.getElementById("reportFrame").src=selectValue;
	    
	}
	
	function exit2()
	{
	  form1.action="${ROOT}/listPersonQuery.do";	
	  form1.submit();
	}
	</script>
</head>


<body  onmousewheel="setScrollzheight()">
    	<table cellspacing="0" cellpadding="0"  border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td align="left" height="32">
        				<h4>报表定制</h4>
        			</td>
        		</tr>
        		<tr>
      			<td class="list-caozuo">
				<a id="hlinkDelete" href="javascript:saveQuery();">保存</a>|
				<a id="hlinkDelete" href="javascript:exit2();">退出</a>
    			</td>
	</tr>
        	</tbody>
  		</table>
  	  <br style='line-height:4px;'/>
  	  
  	  
      <form name="form1" method="post" action="">
      <input name="id" type="hidden" value="${personQuery.id }"/>
      <input name="queryDate" type="hidden" value=""/>
      <input name="queryAction" type="hidden" value="<%=action%>"/>
      <table class="formtext1" border="0" cellpadding="0" cellspacing="1" style='width:100%;'>
      <tr style='background-color:#F7F9FC;'>
        <td align="right" class="t" width = "20%" ><font color="red">*</font>名称</td>
        <td width="80%" style='background-color:#F7F9FC;'>
        <input name="queryName" type="text" class="editline" size="70" value="${personQuery.queryName}"  check="lengthNotMoreThan(100);notBlank()" required="true" />
        </td>
      </tr>
	  <tr style='background-color:#F7F9FC;'>
        <td style='background-color:#F7F9FC;text-align:right;padding-right:10px;' align="right" width = "20%"><font color="red">*</font><b>范围</b><br>
       (选择有权限看到以下面查询条件定制的报表的用户)</td>
        <td width="80%" style='background-color:#F7F9FC;'>
        <input name="orgInfop2" type="hidden" value="${orgInfop2}" />
        <textarea cols="60" rows="3" class="textarea1" name="orgNamep2" readonly="true">${orgNamep2}</textarea>
				&nbsp;&nbsp;  <a href="#" class="choose" onclick="getAddressList('20','n','1','orgNamep2','orgInfop2');">选 择</a>
        </td>
       </tr>
       <tr>
       <td width="100%" colspan="2">
       <div id="div1" class="sidebar" style="display:none">
          <table class="formtext1" border="0" cellpadding="0" cellspacing="0" style='width:100%;'>
          <tr>
          <td id="showTable" width="100%" style="background-color:#F7F9FC">
           已定制报表说明:<br>
          &nbsp;1、名称：广州分公司，深圳分公司，惠州分公司<br>
          &nbsp;2、年月：2007年12月
          </td>
          </tr>
          </table>
	    </div>
       </td>
       </tr>
       <tr>
       <td width="100%" colspan="2" style='background-color:#F7F9FC;'>
       <div id="div2" class="sidebar" style='border:0px;' style='background-color:#F7F9FC;'>
          <br>
          <table class="formtext1" border="0" cellpadding="0" cellspacing="0" style='width:100%;'>
          <tr style='background-color:#F7F9FC;'>
          
          <td width="100%" align="right" style="background-color:#F7F9FC" style='text-align:right;'>
         
             可定制报表：
           <select name="selctUrl" style="width:170px" onchange="showUrlLink()" >
           </select>&nbsp;&nbsp;&nbsp;
          </td>
          </tr>
          </table>
	    </div>
       </td>
       </tr>
       </table>
       <table cellspacing="0" cellpadding="0" border="0" class="listquery">
       <tr>
                <td colspan="2" height="*" >
            		<table width="98%" border="0" cellpadding="1" cellspacing="1" class="listquery">
  					<tr>
    					<td height="400px;"  width="100%" >
	    				<div id="divTree2" class="sidebar">
						<iframe id="reportFrame" src="about:blank"  scrolling="auto"  frameborder="0" name="reportFrame" width="100%" height="100%"></iframe>
        				</div>
	  					</td>
  					</tr>
					</table>
				</td>
         </tr>
        </table>
      	
	</form>
</body>
<kpi:UIResponse />	


<script type="text/javascript">
	onInit();
	</script>
</html>
