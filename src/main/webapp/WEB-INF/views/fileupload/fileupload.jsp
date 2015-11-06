<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${ctx}/static/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/jquery/fileupload.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#selectfile").fileupload({
                fileId: 'test',
                url: '${ctx}/outLink/upload'
            });
        });
    </script>
</head>
<body>
<input value="选择文件" type="button" id="selectfile" name="selectfile"/>
<input value="上传文件" type="button" id="startfile" name="startfile"/>
</body>
</html>
