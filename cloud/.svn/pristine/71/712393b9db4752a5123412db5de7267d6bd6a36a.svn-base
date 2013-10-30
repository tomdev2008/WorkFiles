<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#functionid').tree({
			checkbox : true,
			url : 'tbPostController.do?setAuthority&postId=${postId}',
			onLoadSuccess : function(node) {
			}
		});
		$("#functionListPanel").panel(
			{
				title :"地市列表",
				tools:[{iconCls:'icon-save',handler:function(){mysubmit();}}]
			}
		);
	});
	function mysubmit() {
		var postId = $("#rid").val();
		var s = GetNode();
		doSubmit("tbPostController.do?updateAuthority&postcitys=" + s + "&postId=" + postId);
	}
	function GetNode() {
		var node = $('#functionid').tree('getChecked');
		var cnodes = '';
		var pnodes = '';
		var prevNode = ''; //保存上一步所选父节点
		for ( var i = 0; i < node.length; i++) {
			if ($('#functionid').tree('isLeaf', node[i].target)) {
				cnodes += node[i].id + ',';
				if($('#functionid').tree('getParent', node[i].target)) {
					var pnode = $('#functionid').tree('getParent', node[i].target); //获取当前节点的父节点
					if (prevNode != pnode.id) {//保证当前父节点与上一次父节点不同
						pnodes += pnode.id + ',';
						prevNode = pnode.id; //保存当前节点
					}
				}
			}
		}
		cnodes = cnodes.substring(0, cnodes.length - 1);
		pnodes = pnodes.substring(0, pnodes.length - 1);
		return cnodes + "," + pnodes;
	};
	
	function expandAll() {
		var node = $('#functionid').tree('getSelected');
		if (node) {
			$('#functionid').tree('expandAll', node.target);
		} else {
			$('#functionid').tree('expandAll');
		}
	}
	//update-begin--Author:anchao  Date:20130324 for：角色编辑全选、取消菜单
	function selecrAll() {
		var node = $('#functionid').tree('getRoots');
		for ( var i = 0; i < node.length; i++) {
			var childrenNode =  $('#functionid').tree('getChildren',node[i].target);
			for ( var j = 0; j < childrenNode.length; j++) {
				$('#functionid').tree("check",childrenNode[j].target);
			}
	    }
	}
	function reset() {
		$('#functionid').tree('reload');
	}

	$('#selecrAllBtn').linkbutton({   
	}); 
	$('#resetBtn').linkbutton({   
	});   
		
	//update-end--Author:zhangdaihao  Date:20130205 for：角色编辑全选、取消菜单
</script>
<div class="easyui-layout" fit="true">
<div region="center" style="padding:1px;">
<div class="easyui-panel" style="padding:1px;" fit="true" border="false" id="functionListPanel">
 <input type="hidden" name="postId" value="${postId}" id="rid">
 <!-- update-begin--Author:anchao  Date:20130324 for：角色编辑全选、取消菜单 -->
  <a id = "selecrAllBtn" onclick="selecrAll();">全选</a>
  <a id = "resetBtn"  onclick="reset();">重置</a>
 <!-- update-end--Author:zhangdaihao  Date:20130205 for：角色编辑全选、取消菜单 -->
 <ul id="functionid"></ul>
</div>
</div>
</div>
