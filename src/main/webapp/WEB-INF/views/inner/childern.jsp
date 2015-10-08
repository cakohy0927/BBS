<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.hy.include" prefix="hy" %>
<hy:extends name="title">这是子页面的标题</hy:extends>
<hy:extends name="css">
	<style type="text/css">
		body {
			font-size:20px;
			background: #f2f2f2;
		}
	</style>
</hy:extends>
<hy:extends name="javascript">
	<script type="text/javascript">
		$(function(){
			
		});
	</script>
</hy:extends>

<hy:extends name="body">
	<h1>测试的效果还不错</h1>
</hy:extends>
<jsp:include page="/base/parent.jsp" />