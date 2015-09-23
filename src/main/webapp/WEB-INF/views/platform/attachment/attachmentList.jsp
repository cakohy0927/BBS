<%@page import="com.orm.enums.SysEnum"%>
<%@page import="com.orm.commons.utils.MessageObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://curtainContain/tag" prefix="curtain"%>
<%@ taglib uri="http://caokopage.com.page" prefix="page"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<curtain:include href="base/bootstap.jsp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/project/css/index.css">
<script type="text/javascript">
	function deleteInfo(id,departId){
		//${ctx}/platform/depart/delete
		if(confirm("你确定删除？")){
			$.get("${ctx}/platform/depart/delete/"+id,function(data){
				data = jQuery.parseJSON(data);
				if(data.resposeCode == '<%=MessageObject.ResponseCode.code_200%>'){
					alert(data.message);
					window.location.href = '${ctx}/platform/depart/departChildList?id='+departId;
				} else {
					alert(data.message);
					return ;
				}
					
			});
		}
	}
</script>
<title>菜单列表</title>
</head>
<body>
	<div class="container-fluid">
		<form action="" method="get" name="queryForm" id="queryForm">
			 <div class="row btn-operate" style="">
	            <div class="form-group query-toolbar">
	                <span>文件名称</span>
	                <span>
	                    <input type="text" class="query-input">
	                </span>
	            </div>
	            <div class="operate-toolbar">
	                <a class="btn btn-info btn-sm" href="javascript:void(0)">查询</a>
	                <a class="btn btn-primary btn-sm" href="${ctx}/platform/attachment/create">添加</a>
	            </div>
	        </div>
			<div class="row">
				<table class="table table-striped table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<td style="">文件名称</td>
							<td>文件大小</td>
							<td>文件类型</td>
							<td>文件后缀</td>
							<td>文件路径</td>
							<td>是否显示</td>
							<td style="text-align: center;">操作</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="attachment" items="${attachmentList}">
							<tr>
								<td>${attachment.name}</td>
								<td>${attachment.fileSize}</td>
								<td>${attachment.fileType}</td>
								<td>${attachment.suffix}</td>
								<td>${attachment.path}</td>
								<td>
                                    <c:choose>
                                        <c:when test="${attachment.displayStatus == 'DISPLAY'}">显示</c:when>
                                        <c:when test="${attachment.displayStatus == 'NONE'}">不显示</c:when>
                                    </c:choose>
                                </td>
								<td style="text-align: center;width:130px;">
									<a href="${ctx}/platform/user/userEdit/${user.id}">修改</a>
									<a href="${ctx}/platform/user/userEdit/${user.id}">预览</a>
									<a href="javascript:void(0)" onclick="deleteInfo('${entity.id}','${depart.id}')">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8" style="text-align: right;">
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