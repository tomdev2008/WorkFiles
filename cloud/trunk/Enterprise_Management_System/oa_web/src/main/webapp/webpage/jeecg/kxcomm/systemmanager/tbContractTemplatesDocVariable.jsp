<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
 <script type="text/javascript">
 
 var templeDocId='${templeDocId}';
 
			  //初始化下标
			function resetTrNum(tableId) {
				$tbody = $("#"+tableId+"");
				$tbody.find('>tr').each(function(i){
					$(':input, select', this).each(function(){
						var $this = $(this), name = $this.attr('name'), val = $this.val();
						if(name!=null){
							if (name.indexOf("#index#") >= 0){
								$this.attr("name",name.replace('#index#',i));
							}else{
								var s = name.indexOf("[");
								var e = name.indexOf("]");
								var new_name = name.substring(s+1,e);
								$this.attr("name",name.replace(new_name,i));
							}
						}
					});
				});
			}
			//关闭
			 function btnClose()
			 {
				 frameElement.api.close();
			 }
			
			function checkInput()
			{
				 var tt=$("#add_tbOrderDetail_table tr").length;
			     if(tt==0){
				     return false;
			     }
			}
			//保存变量信息,修改变量信息
			 function saveAndUpdateVariable() {
				var strName="";
				$('table input[name="variablename"]').each(function(){
					strName+=$(this).val()+",";//每个值之间用','分开
			});
			 	alert(strName);
			}
  </script>
 <head>
  <title>合同模板文件变量</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" beforeSubmit="checkInput();" action="tbContractTemplatesDocVariableController.do?save">
		<div style="width: auto;height: 230px;">
				<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
				<div style="width:600px;height:1px"></div>
				<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
				 <t:tab href="tbContractTemplatesDocVariableController.do?tbVariableDoc&templeDocId=${templeDocId}" icon="icon-search" title="设置变量" id="tbOrder"></t:tab>
				</t:tabs>
			</div>
			<input type="hidden" name="templatesdocId.id" value="${templeDocId}"/>
			<div align="right"><button class="Validform_label">确定</button><button class="Validform_label" onclick="btnClose();">关闭</button></div>
	</t:formvalid>
	
			<!-- 添加 产品明细 模版 -->
		<%-- <table style="display:none" id="docVariable">
		<tbody id="add_tbOrder_table_template">
			<tr >
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
			 <td align="left"><input name="" maxlength="32" type="hidden" style="width:250px;"></td>
			    <td align="left"><input type="hidden"  name="tbContractTemplatesDocVariableList.templatesdocId.id" value="${templeDocId}"/></td>
				  <td align="left"><input name="vo.tbContractTemplatesDocVariableList.variablename" id="name" maxlength="50" type="text" style="width:200px;"></td>
				  <td align="left"><input name="vo.tbContractTemplatesDocVariableList.description" maxlength="50" type="text" style="width:250px;"></td>
			</tr>
		 </tbody>
		</table> --%>
</body>
<script type="text/javascript">
</script>