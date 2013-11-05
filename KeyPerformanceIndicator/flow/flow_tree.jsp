<%@ page contentType="text/html; charset=utf-8" pageEncoding="gbk"%>
<%@ include file="/web/pub/flow.inc" %>
<%
response.setHeader("Cache-Control","no-store"); //HTTP 1.1
response.setHeader("Pragma","no-cache");        //HTTP 1.0
response.setDateHeader ("Expires", 0);          //防止被proxy server cache
String typeCode="LCDY";
String flowCode = request.getParameter("flowCode");
String sCode = request.getParameter("sCode");

%>
<html>
<head>
<title>流程定义</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<SCRIPT src="${ROOT}/web/flow/js/group_tree.js" type=text/javascript></SCRIPT>
<script type="text/javascript" src="${ROOT}/web/flow/js/xtree.js"></script>
<LINK href="${ROOT}/web/flow/css/xtree.css" type=text/css rel=stylesheet /> 



<style type="text/css">
body {
	background:	ThreeDHighlight !important;
	color:		black;
        SCROLLBAR-FACE-COLOR: #d2e0df; SCROLLBAR-HIGHLIGHT-COLOR: #e2f0df; SCROLLBAR-SHADOW-COLOR: black; SCROLLBAR-3DLIGHT-COLOR: black; SCROLLBAR-ARROW-COLOR: black; SCROLLBAR-TRACK-COLOR: #e2f0df; SCROLLBAR-DARKSHADOW-COLOR: white; SCROLLBAR-BASE-COLOR: #d2e0df
}
</style>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" bgcolor="ECEAE6"  style="overflow:auto">


<script type="text/javascript">
/// XP Look
webFXTreeConfig.rootIcon		= "${ROOT}/web/flow/img/flowTree/folder.png";
webFXTreeConfig.openRootIcon	= "${ROOT}/web/flow/img/flowTree/openfolder.png";
webFXTreeConfig.folderIcon		= "${ROOT}/web/flow/img/flowTree/folder.png";
webFXTreeConfig.openFolderIcon	= "${ROOT}/web/flow/img/flowTree/openfolder.png";
webFXTreeConfig.fileIcon		= "${ROOT}/web/flow/img/flowTree/file.png";
webFXTreeConfig.lMinusIcon		= "${ROOT}/web/flow/img/flowTree/Lminus.png";
webFXTreeConfig.lPlusIcon		= "${ROOT}/web/flow/img/flowTree/Lplus.png";
webFXTreeConfig.tMinusIcon		= "${ROOT}/web/flow/img/flowTree/Tminus.png";
webFXTreeConfig.tPlusIcon		= "${ROOT}/web/flow/img/flowTree/Tplus.png";
webFXTreeConfig.iIcon		= "${ROOT}/web/flow/img/flowTree/I.png";
webFXTreeConfig.lIcon		= "${ROOT}/web/flow/img/flowTree/L.png";
webFXTreeConfig.tIcon		= "${ROOT}/web/flow/img/flowTree/T.png";

//var tree = new WebFXLoadTree("WebFXLoadTree", "tree1.xml");
//tree.setBehavior("classic");
<bean:write name="treeString" filter="false"/>


//tree.add(rti = new WebFXLoadTreeItem("Tree Item 3 (Reload)", "date.xml.pl"));
//document.write(tree);
</script>
<script>
var objs = new Array();
var nodenum =0;

function addTreeNode(obj)
{
    objs[nodenum++]=obj;
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

function addNode(fName,fCode,fType,sCode,flowCode) {

       var  temp = "javascript:openNode('"+flowCode+"','"+fCode+"')";
       var  oSelect = getSelectObj(getAllChild(tree),sCode);

       if(sCode.length>0){
           if (fType == "ROUTE") {
              temp = "javascript:openRoute('"+flowCode+"','"+sCode+"','"+fCode+"')";
           }
             if(oSelect==null)
                oSelect=tree;
             webFXTreeHandler.select(oSelect);

             oSelect.add(new WebFXTreeItem(fName,temp,fCode));
             oSelect.expand();
       }else
       {
          tree.add(new WebFXTreeItem(orgName,"javascript:openNode('"+flowCode+"','"+fCode+"')"));
       }
}

function delNode() {
 var tmpTreeItem = null;
   if (tree.getSelected()) {
        tmpTreeItem=tree.getSelected();
        webFXTreeHandler.select(tmpTreeItem.getPreviousSibling());
        eval(tmpTreeItem.getPreviousSibling().action.substring(11));
  	tmpTreeItem.remove();
  }
}

function srcReload()
{
 	if (tree.getSelected()) {
	   tree.getSelected().reload();
	}
}

function openSrc(orgCode,orgType,orgBCFL,orgName)
{
  parent.mainFrame.window.location.href="/Controller?action=GetOrgNodeInfo&code="+orgCode+"&orgType="+orgType+"&orgBCFL="+orgBCFL;
}

function openRoute(flowCode,nodeCode,routeCode)
{
document.all.sCode.value = routeCode;
   parent.parent.topFrame.window.location.href="${ROOT}/flow/route_form_edit_top.jsp?routeCode="+routeCode+"&nodeCode="+nodeCode+"&flowCode="+flowCode;
   parent.Entrys.window.location.href="${ROOT}/routeEditPage.do?routeCode="+routeCode;

}
function openNode(flowCode,nodeCode)
{
document.all.sCode.value = nodeCode;
   parent.parent.topFrame.window.location.href="${ROOT}/flow/node_form.jsp?flowCode="+flowCode+"&flwType=NODE&nodeCode="+nodeCode;
   parent.Entrys.window.location.href="${ROOT}/nodeEditPage.do?nodeCode="+nodeCode;
}
function openFlow(flowCode)
{
document.all.sCode.value = flowCode;
   parent.Entrys.window.location.href="${ROOT}/flowEditPage.do?flowCode="+flowCode;
   parent.parent.topFrame.window.location.href="${ROOT}/flow/flow_form.jsp?flowCode=<%=flowCode%>&flwType=FLOW&typeCode=<%=typeCode%>";
}

function openChildNode(flowCode,nodeCode){
document.all.sCode.value = nodeCode;
   parent.parent.topFrame.window.location.href="${ROOT}/flow/node_form.jsp?flowCode="+flowCode+"&flwType=NODE&nodeCode="+nodeCode;
   parent.Entrys.window.location.href="${ROOT}/nodeEditPage.do?nodeCode="+nodeCode;
}

function openChildRoute(flowCode,nodeCode,routeCode){
document.all.sCode.value = routeCode;
   parent.parent.topFrame.window.location.href="${ROOT}/flow/route_form_edit_top.jsp?routeCode="+routeCode+"&nodeCode="+nodeCode+"&flowCode="+flowCode;
   parent.Entrys.window.location.href="${ROOT}/routeEditPage.do?routeCode="+routeCode;

}

function openNewChildFlow(parentCode,pflwCode,nodeCode){
   parent.parent.topFrame.window.location.href="${ROOT}/flow/flow_form_add_top.jsp";
   parent.Entrys.window.location.href="${ROOT}/listFlowPage.do?parentFlowCode="+parentCode;
}

function openNewChildNode(flowCode,pflwCode,nodeCode){
  parent.parent.topFrame.window.location.href="${ROOT}/flow/child_flow_form.jsp?flowCode="+flowCode+"&parentFlowCode="+pflwCode+"&nodeCode="+nodeCode+"&flwType=FLOW&typeCode=LCDY";
   parent.Entrys.window.location.href="${ROOT}/nodeAddPage.do?flowCode="+flowCode;
}

var sCode ="<%=sCode%>";
function Reload()
{

    var oSelect = tree;
    tree.expandAll();
     if (sCode!="") {
        oSelect = getSelectObj(getAllChild(tree),sCode);
     }

     if(oSelect==null)
        oSelect=tree ;
     webFXTreeHandler.select(oSelect);
    // eval(oSelect.action.substring(11));
}
Reload();
</script>
<INPUT name="sCode" type="hidden" value=""/>
</body>
</html>
