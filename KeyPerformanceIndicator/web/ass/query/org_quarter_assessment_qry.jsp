<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<jsp:directive.page import="com.shengdai.kpi.util.AddressHelper"/>
<jsp:directive.page import="java.util.Calendar"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
   <%
         
        String selYear = ParamUtils.getDefaultStringValue(request,"selYear","");
        if(!(selYear.trim().length()>2)){
          selYear = String.valueOf(Calendar.getInstance().get(Calendar.YEAR));
        }
        
    %>


	<title>
		组织季度考核查询
	</title>
	<%@ include file="/web/pub/head.inc"%>
	
	<LINK rel="stylesheet" type="text/css" href="${ROOT}/css/layout_1.css" />
   
    <script>
    
       // 去掉空格
       String.prototype.trim = function()
       {
         return this.replace(/(^[\s]*)|([\s]*$)/g, "");
        }
        
        function onInit()
	    { 
	      // alert("qryInit!");
	     
	         
	     // alert("setPHeight()");
	      
	    }
	    
        function checkForm2()
        {  
          
    	  
          
        }
      
    	function query()
    	{
    	 
    	 }
    	 
    	 function exportAssess(){
    	   
    	 }
    	 
    	/**
    	*  显示考核表
    	*/ 
    	function showAssessment(id)
    	{
    	   
    	}
    	
    	
    	/**
    	*  显示用户信息
    	*/
    	function showAssUser(id)
    	{
    	}
    	
   
     
       
 		
    
    </script>
</head>


<body class="LN_body" onmousewheel="setScrollzheight()">
    	<div class="LN_popupsBox">


<div class="LN_formBox">
<div class="LN_formTitle2">组 织 季 度 考 核 查 询</div>
<form name="form1" id="form1" method="post" action="${ROOT}/queryPersonAssessment.do">
<div class="LN_formTitle2">

 <table cellspacing="0" cellpadding="0" border="0" class="listquery">
 <tr>
        <td width="8%" nowrap height="22"   align="left" id="showTd"> 部门:</td>
       
        <td width="53%" align="left"  valign="bottom">
          <input id="orgInfo" name="orgInfo" type="hidden" value="${orgInfo}" />
        <textarea cols="65" rows="3" class="textarea1" id="orgName" name="orgName" readonly="true">省分公司机关</textarea>
				&nbsp;&nbsp;  
        </td>
        <td width="10%" align="left" valign="bottom">
            <a style="cursor:hand" class="choose" onclick="getAddressList('0','n','0','orgName','orgInfo');">选择查询对象</a><br></br>
        </td>
         <td width="29%" style="text-align:right;">
		<a href="#"  onclick="query();return false;"><img  src="${ROOT}/images/search.gif" >查询</a>&nbsp;&nbsp;
		<a href="#"  onclick="exportAssess();return false;"><img  src="${ROOT}/images/ico_05.gif" >导出</a>&nbsp;&nbsp;
         </td>
</tr>
 

</table>

 

</div>


<input name="INIT_QRY" type="hidden" value="${initQry}" />
<input name="singleQry" type="hidden" value="${singleQry}" />
 <input name="reportType" type="hidden" value="${reportType}" />
  <input name="selectType" type="hidden" value="${selectType}" />

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">查询列表</td>
  </tr>
  <tr>
    <td class="LN_press"><div class="LN_inquiry">历史查询：
      <select name="selYear" id="selYear">
       <%for(int i=2006;i<=(Calendar.getInstance().get(Calendar.YEAR)+15);i++){%>
			<option value="<%=String.valueOf(i)%>" <%if(selYear.equals(String.valueOf(i))) out.print("selected"); %>><%=String.valueOf(i)%>年</option>
	   <%}%>
      </select>
    </div>
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
              <td width="6%" class="LN_tableBoxtitle2" style="text-align:center;">序号</td>
            <td width="15%" class="LN_tableBoxtitle2" style="text-align:center;">单位</td>
            <td width="25%" class="LN_tableBoxtitle2" style="text-align:center;">部门</td>
            <td width="8%" class="LN_tableBoxtitle2" style="text-align:center;">部门负责人</td>
            <td width="16%" class="LN_tableBoxtitle2" style="text-align:center;">岗位</td>
            <td width="10%" class="LN_tableBoxtitle2" style="text-align:center;">评分</td>
            <td width="10%" class="LN_tableBoxtitle2" style="text-align:center;">评分等级</td>
            <td width="10%" class="LN_tableBoxtitle2" style="text-align:center;">评分周期</td>
            </tr>
             <tr id="showTr_8a91bde824f160530124f16e065e001d" name="qryOutTR"  >
                  <td class="LN_tableBoxText2">1</td>  
                  <td class="LN_tableBoxText2" >省分公司机关</td>
                  <td class="LN_tableBoxText2" style="text-align:left;word-break:break-all">人力资源部</td>
                  <td class="LN_tableBoxText2" >姜惠智</td>
                  <td class="LN_tableBoxText2" >主任</td>
                  <td class="LN_tableBoxText2" >90.00</td>
                  <td class="LN_tableBoxText2" >B</td>
                  <td class="LN_tableBoxText2" >2009年3季度</td>
                  </tr>
                  
             <tr id="showTr_8a91bde824f160530124f16e065e001d" name="qryOutTR"  >
                  <td class="LN_tableBoxText2">2</td>  
                  <td class="LN_tableBoxText2" >省分公司机关</td>
                  <td class="LN_tableBoxText2" style="text-align:left;word-break:break-all">个人客户部</td>
                  <td class="LN_tableBoxText2" >李文伟</td>
                  <td class="LN_tableBoxText2" >主任</td>
                  <td class="LN_tableBoxText2" >90.00</td>
                  <td class="LN_tableBoxText2" >B</td>
                  <td class="LN_tableBoxText2" >2009年3季度</td>
                  </tr>
            
           
          </table>
      </td>
  </tr>
</table>
		
	<style>A.blue:link {COLOR: #2262E8; TEXT-DECORATION:none }A.blue:visited {COLOR: #2262E8; TEXT-DECORATION:none }A.blue:hover {COLOR: #009933; TEXT-DECORATION:none }</style>
<script>
var pageForm = document.getElementById('form1');
function getElement( strName )
{
var element = null;
var length=pageForm.elements.length;
for (var i=0;i<length;i++)
{
element = pageForm.elements[i];
if ( element.name== strName)
{
break;
}
}
return element;} function show(page) 
{ 
var form = pageForm; 
var element1 = getElement( "page.currentPage" ); 
element1.value = page; 
form.submit(); 
} 
function checkInteger(strVal) {
strVal = TrimString (strVal);
if (strVal.length == "")return (false);
reVal = /^[\-\+]?([1-9]\d*|0|[1-9]\d{0,2}(,\d{3})*)$/;
return (reVal.test (strVal));
} 
function TrimString(data)
{
var reg = /^\s*|\s*$/g;
return data.replace(reg,"");
}
function go() 
{
var form = pageForm; 
var element0 = getElement( "page.inputpage" ); 
var element2 = getElement( "page.totalPage" ); 
var element3 = getElement( "page.currentPage" ); 
if(!checkInteger(element0.value)){
alert("请输入整数"); 
return; 
}
if(parseInt(element0.value)>=1&&parseInt(element0.value)<=parseInt(TrimString(element2.value))){
element3.value = element0.value; 
form.submit();
return; 
}
alert("请输入合法的页数范围");
} 
function refresh(){ 
var element = getElement( "page.refresh" ).value = '1'; 
pageForm.submit();
} 
function go2() 
{ 
var form = pageForm; 
var element1 = getElement( "page.inputPageSize" ); 
var element2 = getElement( "page.totalPage" ); 
var element3 = getElement( "page.currentPage" ); 
if(!checkInteger(element1.value)){
alert("请输入整数"); 
return; 
}
getElement( "page.pageSize" ).value=element1.value;
element3.value= 1;
form.submit(); 
return; 
} 
document.onkeydown = keyDown; 
function keyDown(){ 
var keycode = event.keyCode;
if(keycode==13){ 
if(document.getElementById("page.inputpage")==document.activeElement){ 
go(); 
} 
if(document.getElementById("page.inputPageSize")==document.activeElement){ 
go2(); 
} 
} 
} 
</script>

<input type='hidden' name='page.refresh' value='0'>
<input type='hidden' name='page.pageSize' value='15'>
<input type='hidden' name='page.currentPage' value='1'>
<input type='hidden' name='page.totalPage' value='1'>
<input type='hidden' name='page.totalNumber' value='2'>
<input type='hidden' name='page.sortInfo.column' value='null'>
<input type='hidden' name='page.sortInfo.ascOrDesc' value='ASC'>

<table border="0" cellspacing="0" cellpadding="0" class="page-box">
	<tr>
		<td>
   首页   上页 下页
 尾页 
  页码：<input type="text" id="page.inputpage" name="page.inputpage" size="2" maxlength="5" class="editline" value="" >
   <a href="#" onClick="javascript:go()">跳转</a>
		</td>
	</tr>
	<tr>
		<td>
			状态说明：当前在第<span class="text-red">1</span>页,共<span class="text-red">1</span>页<span class="text-red">2</span>条记录
  每页：<input type="text" id="page.inputPageSize" name="page.inputPageSize" size="2" maxlength="4" class="editline" value="15" >条记录
   <a href="#" class="blue" onClick="javascript:go2()">确定</a>
		</td>
	</tr>
	</table>
	
	
	</form>
	
</div>
</div>	
</body>
<script type="text/javascript">window.onload = function(){setPHeight3();}</script>
<script>
	
		
	


function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      oldonload();
      func();
    }
  }
}		
</script>
</html>




<kpi:UIResponse />	
