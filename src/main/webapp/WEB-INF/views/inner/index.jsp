<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://curtainContain/tag" prefix="curtain"%>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<curtain:include href="base/bootstap.jsp" />
<title>后台信息管理</title>
<style type="text/css">
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var h = window.innerHeight;
		$("#main_frame").height(h - 60);
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row" style="height:60px;border-bottom: 2px solid #f2f2f2;">
			这是顶部
		</div>
		<div class="row">
			<div class="col-md-2">
				<ul>
					<li>
						<a href="javascript:void(0)">一级导航(1)</a>
						<ul>
							<li><a href="javascript:void(0)">二级导航(1)(1)</a></li>
							<li><a href="javascript:void(0)">二级导航(1)(2)</a></li>
							<li><a href="javascript:void(0)">二级导航(1)(3)</a></li>
							<li><a href="javascript:void(0)">二级导航(1)(4)</a></li>
							<li><a href="javascript:void(0)">二级导航(1)(5)</a></li>
							<li><a href="javascript:void(0)">二级导航(1)(6)</a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)">一级导航(2)</a>
					</li>
					<li>
						<a href="javascript:void(0)">一级导航(3)</a>
					</li>
					<li>
						<a href="javascript:void(0)">一级导航(4)</a>
					</li>
					<li>
						<a href="javascript:void(0)">一级导航(5)</a>
					</li>
					<li>
						<a href="javascript:void(0)">一级导航(6)</a>
					</li>
				</ul>
			</div>
			<div class="col-md-10" style="padding-left: 0px;padding-right: 1px;border-left: 2px solid #f2f2f2;">
				<iframe id="main_frame" name="main_frame" frameborder="0" src="${ctx}/basic/topic/column/columnList" width="100%" height="100%"/>
			</div>
		</div>
	</div>
</body>
</html>