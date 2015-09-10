<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc.jsp"></jsp:include>
<meta http-equiv="X-UA-Compatible" content="edge" />
<c:if test="${fn:contains(sessionInfo.resourceList, '/member/edit')}">
	<script type="text/javascript">
		$.canEdit = true;
	</script>
</c:if>
<c:if test="${fn:contains(sessionInfo.resourceList, '/member/delete')}">
	<script type="text/javascript">
		$.canDelete = true;
	</script>
</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员管理</title>
	<script type="text/javascript">
	var dataGrid;
	var organizationTree;
	$(function() {
	
		organizationTree = $('#organizationTree').tree({
			url : '${ctx}/organization/tree',
			parentField : 'pid',
			lines : true,
			onClick : function(node) {
				dataGrid.datagrid('load', {
				    organizationId: node.id
				});
			}
		});
	
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/member/dataGrid',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			idField : 'id',
			sortName : 'phone',
			sortOrder : 'asc',
			pageSize : 50,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			frozenColumns : [ [ {
				width : '100',
				title : '会员卡ID',
				field : 'mebercardid',
				sortable : true
			}, {
				width : '100',
				title : '真实姓名',
				field : 'realname',
				sortable : true
			},{
				width : '80',
				title : '座机',
				field : 'phone',
				sortable : true
			} , {
				width : '80',
				title : '手机',
				field : 'mobile',
				sortable : true
			} ,{
				width : '80',
				title : '邮箱',
				field : 'email',
				sortable : true
			} ,{
				width : '80',
				title : '省份ID',
				field : 'prov_id',
				sortable : true
			} ,{
				width : '80',
				title : '省份名称',
				field : 'prov_name',
				sortable : true
			} ,{
				width : '80',
				title : '城市ID',
				field : 'city_id',
				sortable : true
			} ,{
				width : '80',
				title : '城市名称',
				field : 'city_name',
				sortable : true
			} ,{
				width : '80',
				title : '地址',
				field : 'address',
				sortable : true
			} ,{
				width : '80',
				title : '邮编',
				field : 'zipcode',
				sortable : true
			} ,{
				width : '80',
				title : '身份证',
				field : 'cardid',
				sortable : true
			} , {
				width : '80',
				title : '状态',
				field : 'state',
				sortable : true,
				formatter : function(value, row, index) {
					switch (value) {
					case 0:
						return '停用';
					case 1:
						return '可用';	
					}
				}
			},{
				width : '80',
				title : '会员等级',
				field : 'grade',
				sortable : true
			} ,{
				width : '80',
				title : '购物积分',
				field : 'credit',
				sortable : true
			} ,{
				width : '80',
				title : '注册时间',
				field : 'regdateymd',
				sortable : true
			} ,{
				width : '80',
				title : '最后购物时间',
				field : 'lastdateline',
				sortable : true
			} ,{
				width : '80',
				title : '会员组',
				field : 'mbgroup',
				sortable : true
			} ,{
				field : 'action',
				title : '操作',
				width : 100,
				formatter : function(value, row, index) {
					var str = '';
					if(row.isdefault!=0){
						if ($.canEdit) {
							str += $.formatString('<a href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a>', row.id);
						}
						str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
						if ($.canDelete) {
							str += $.formatString('<a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a>', row.id);
						}
					}
					return str;
				}
			}] ],
			toolbar : '#toolbar'
		});
	});
	
	function addFun() {
		parent.$.modalDialog({
			title : '添加',
			width : 500,
			height : 300,
			href : '${ctx}/member/addPage',
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;
					var f = parent.$.modalDialog.handler.find('#memberAddForm');
					f.submit();
				}
			} ]
		});
	}
	
	function deleteFun(id) {

	}
	
	function editFun(id) {
		
	}
	</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false" title="会员列表">
		<table id="dataGrid" data-options="fit:true,border:false,fitColumns:true"></table>
	</div>

	<div id="toolbar" style="display: none;">
		<c:if test="${fn:contains(sessionInfo.resourceList, '/member/add')}">
			<a onclick="addFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon_add'">添加</a>
		</c:if>
	</div>
</body>
</html>