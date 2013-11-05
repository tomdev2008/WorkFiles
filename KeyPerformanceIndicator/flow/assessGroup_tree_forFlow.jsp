<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page import="java.util.List,com.shengdai.kpi.system.service.IUserService,com.shengdai.kpi.system.valueobject.User"/>
<jsp:directive.page import="java.util.ArrayList"/>
<jsp:directive.page import="com.shengdai.kpi.system.service.IGroupService"/>
<jsp:directive.page import="com.shengdai.kpi.ag.service.IAssessGroupService,com.shengdai.kpi.ag.valueobject.AssessGroup"/>
<jsp:directive.page import="com.shengdai.kpi.common.SpringHelper"/>
<jsp:directive.page import="com.shengdai.kpi.system.util.OrgTree"/>
<jsp:directive.page import="java.util.Map"/>
<jsp:directive.page import="java.util.HashMap"/>


<%@ include file="../common/head.inc" %>


<%
	IAssessGroupService service = (IAssessGroupService)SpringHelper.getBean("assessGroupService");
	IUserService ius=(IUserService)SpringHelper.getBean("userService");
	String id=loginedUser.getId();
	User user=ius.findUserById(id);
	List list=new ArrayList();
	boolean blnSa = false;
	Map authMap = new HashMap();
	String userRole ="user"; 
	AssessGroup theRoot=service.findAssessGroupById("0");
	if(user.isSARole())
	{
		blnSa = true;
	    userRole = "SA";
	}
	else
	{
		IGroupService igs=(IGroupService)SpringHelper.getBean("groupService");
		List gl=new ArrayList(); 
		String sid="";
		if(user.getStation()!=null)
			sid=user.getStation().getId();
		igs.listGroupsBychild(gl,user.getGroup());//gid
		authMap=service.findAGAuthByObject(loginedUser.getId(),sid,gl);
		list=service.findAssessGroupAuthByObject(loginedUser.getId(),sid,gl);
	}
	String sCode=request.getParameter("agId");
	List modList =  new ArrayList();
	if(authMap.get("mod")!=null)
	modList=(List)authMap.get("mod");
%>
<html>
<script type="text/javascript">
var userRole = '<%=userRole%>';
var modArray=new Array(<%=modList.size()%>);
<%for(int i=0;i<modList.size();i++)
{
%>
	modArray[<%=i%>]="<%=modList.get(i)%>";
<%
}
%>
	
function checkAuth(flag,agId,shows,theType)
{
   if(flag=="mod")
   {
      if(modArray!=null&&modArray.length>0)
      {
        var blnflag = false;
        for (var i=0; i<modArray.length; i++)
        {	 
		    if(agId==modArray[i])
		    {
		         blnflag = true;
		         break;
		    }
		 } 		   
		 if(!blnflag)
		 {
		    alert("当前用户没有本"+theType+"的"+shows+"权限!");
		    return false;
		 }	
	    return true;
      }  
   }  
   alert("您没有"+shows+"权限！");
   return false;
}

function open1(id){
parent.rightFrame.location.href=context+'/listFlowByAssessGroup.do?id='+id;
}




</script>

<head>
<title>指标类型</title>
</head>
<LINK href="${ROOT}/common/xtree/css.css" rel=stylesheet>
<LINK href="${ROOT}/common/xtree/xtree.css" type=text/css rel=stylesheet /> 
<SCRIPT src="${ROOT}/common/xtree/xselecttree.js" type=text/javascript></SCRIPT>
<SCRIPT src="${ROOT}/common/xtree/xtree.js" type=text/javascript></SCRIPT>
<SCRIPT src="${ROOT}/common/xtree/xloadtree.js" type=text/javascript></SCRIPT>
<SCRIPT src="${ROOT}/common/xtree/xmlextras.js" type=text/javascript></SCRIPT>
<body topmargin="10" rightmargin="0" leftmargin="0" bottommargin="0" style="overflow:auto" background="../images/tree/tree-bg.gif">
<form action="" method="get" name="thisForm">
<table cellpadding="0" cellspacing="0" border="0" width="199"> 
		   
		    <tr bgcolor="#ffffff"> 
		       <td  valign="top" width="100%" bgcolor="#FFFBFF"  background="../images/SysUI/deploy_two_16.gif"> 
		       <%if(user.isSARole()){
		            //out.println(OrgTree.newAssessGroupTreeForFlow(theRoot));
		        
		        %> 
<script type="text/javascript">
	var tree = new WebFXLoadTree("群组树", "${ROOT}/loadAGTree.do?root=0&js=open1");
	document.write(tree);
	tree.expand();
</script>
		        <%
		         }else
		         {
		        // out.println(OrgTree.newAssessGroupTreeNow(list,4));
		          out.println(OrgTree.sortedUserAssessGroupTree(list,4));
		         }//4表示流程 
		         
		         %>            
		       </td>           
		    </tr> 
		</table>
<script type="text/javascript">
var objs = new Array();
var nodenum =0;

function addTreeNode(obj)
{
    objs[nodenum++]=obj;
}
  function  getSelectObj(objs,sCode)
{
   for(var i=0;i<objs.length;i++)
   {
      
        if (objs[i].code == sCode) {
            return objs[i];
            break;
        }
   }
}
function  getAllChild(tree)
{
    for (var i = 0; i < tree.childNodes.length; i++)
    {
         addTreeNode(tree.childNodes[i]);
         getAllChild( tree.childNodes[i]);
    }

    return objs;
}
  var sCode ="<%=sCode%>";
 // alert(sCode);
  function Reload()
{

    var oSelect = node0;    
    //node0.expandAll();
     
     if (sCode!="") {
        oSelect = getSelectObj(getAllChild(node0),sCode);
     }
     if(sCode=="000000") return;

     if(oSelect==null)
        oSelect=node0 ;
     webFXTreeHandler.select(oSelect);
    // eval(oSelect.action.substring(11));
}
//Reload();
  </script>
</form> 
</body>