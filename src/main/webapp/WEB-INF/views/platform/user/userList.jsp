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
<script type="text/javascript">
	function deleteInfo(id,departId){
		//${ctx}/platform/depart/delete
		if(confirm("你确定删除？")){
			$.get("${ctx}/platform/depart/delete/"+id,function(data){
				data = jQuery.parseJSON(data);
				if(data.resposeCode == '<%=MessageObject.ResposeCode.code_200%>'){
					alert(data.inforamation);
					window.location.href = '${ctx}/platform/depart/departChildList?id='+departId;
				} else {
					alert(data.errorInformation);
					return ;
				}
					
			});
		}
	}
</script>
<title>部门列表</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<c:if test="${not empty depart}">
				当前所在机构：${depart.departName}
			</c:if>
			<span style="float:right;">
				<a href="${ctx}/platform/user/userCreate" class="btn btn-primary btn-xs">添加</a>
			</span>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<form action="" method="get" name="queryForm" id="queryForm">
				<table class="table table-striped table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<td>用户昵称</td>
							<td>登录名称</td>
							<td>用户邮箱</td>
							<td>出生日期</td>
							<td>用户状态</td>
							<td>用户类型</td>
							<td style="text-align: center;">操作</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${list}">
							<tr>
								<td>${user.nickName}</td>
								<td>${user.loginName}</td>
								<td>${user.email}</td>
								<td>
									${user.brithday}
								</td>
								<td>
									<c:choose>
										<c:when test="${user.userType=='ADMIN'}">管理员</c:when>
										<c:when test="${user.userType=='GENERAL'}">普通用户</c:when>
										<c:when test="${user.userType=='LEAGUER_MEMBER'}">超级会员</c:when>
										<c:when test="${user.userType=='MEMBER'}">普通会员</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${user.userStatus == 'INIT'}">初始状态</c:when>
										<c:when test="${user.userStatus == 'LOCKED'}">账户锁定</c:when>
										<c:when test="${user.userStatus == 'NORMAL'}">账户可用</c:when>
									</c:choose>
								</td>
								<td style="text-align: center;width:100px;">
									<a href="${ctx}/platform/user/userEdit/${user.id}">修改</a>
									<a href="javascript:void(0)" onclick="deleteInfo('${entity.id}','${depart.id}')">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7" style="text-align: right;">
								<page:pageInfo pageInfo="${pager}" formId="queryForm" currentPage="${currentPage}"/>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>
</body>
</html>