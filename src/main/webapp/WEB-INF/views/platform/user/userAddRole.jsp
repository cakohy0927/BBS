<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<%@ taglib uri="http://curtainContain/tag" prefix="curtain"%>
<%@ taglib uri="http://caokopage.com.page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<curtain:include href="base/bootstap.jsp" />
<script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/static/project/css/index.css">
<title>用户信息添加</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#chkAll").click(function () {//反选  
			if(this.checked){    
		        $("#queryForm :checkbox").prop("checked", "checked");   
		    }else{    
		        $("#queryForm :checkbox").prop("checked", false); 
		    }  
        });  
		
		$("#getValue").click(function(){ 
		    var valArr = new Array; 
		    $("#queryForm :checkbox[checked]").each(function(i){ 
		        valArr[i] = $(this).val(); 
		    }); 
		    var vals = valArr.join(',');//转换为逗号隔开的字符串 
		    alert(vals); 
		}); 
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<form class="form-horizontal" style="height:40px;" method="post" action="${ctx}/platform/user/userSave">
			<div class="row btn-operate" style="height:40px;line-height:40px;">
	            <div class="query-toolbar">
	                <span>当前用户：</span><span>${user.nickName}</span>
	            </div>
	            <div class="operate-toolbar">
	                <a class="btn btn-primary btn-sm" href="javasript:void(0)" id="getValue">添加</a>
	            </div>
	        </div>
		</form>
		<form action="${ctx}/platform/role/roleList/${user.id}" method="get" name="queryForm" id="queryForm">
			<div class="row">
				<table class="table table-striped table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<td style="width: 30px;vertical-align: middle;text-align: center;">
								<input type="checkbox" name="chkAll" id="chkAll"/>
							</td>
							<td style="width:200px;">角色编号</td>
							<td>角色名称</td>
							<td>是否显示</td>
							<td style="text-align: center;">操作</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${rolesList}" var="roles">
							<tr>
								<td style="width: 30px;vertical-align: middle;text-align: center;">
									<input type="checkbox" name="chkOne" id="chkOne" value="${roles.id}"/>
								</td>
								<td>${roles.code}</td>
								<td>${roles.name}</td>
								<td>
									<c:choose>
										<c:when test="${roles.displayStatus == 'DISPLAY'}">显示</c:when>
										<c:when test="${roles.displayStatus == 'NONE'}">不显示</c:when>
									</c:choose>
								</td>
								<td style="text-align: center;width:100px;">
									<a href="${ctx}/platform/role/roleEdit/${roles.id}">修改</a>
									<a href="javascript:void(0)" onclick="deleteInfo('${roles.id}')">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6" style="text-align: right;">
								<page:pageInfo pageInfo="${tools.pager}" formId="queryForm" currentPage="${currentPage}"/>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</form>
	</div>
</body>
</html>