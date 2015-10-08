<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<%@ taglib uri="http://curtainContain/tag" prefix="curtain"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>栏目添加</title>
<curtain:include href="base/bootstap.jsp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/project/css/index.css">
<script src="${ctx}/static/ckeditor/ckeditor.js"></script>
<script src="${ctx}/static/ckeditor/config.js?v=<%=Math.random()%>"></script>

<style type="text/css">
	.col-sm-offset-2 {
	    margin-left: 18%;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#parentColumnName").click(function() {
			$(".treeColumn").slideDown(500);
		});
		$(".treeColumn").mouseleave(function(){
			$(".treeColumn").slideUp(500);
		});
		
		$('#parentColumnName').keyup(function() {
			if($('#parentColumnName').val() == ''){
				$('#parentColumnId').val('');
			}
		});
	});
	
	var setting = {
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onClick: onClick
		}
	};

	var zNodes = ${columnTrees};
	
	function onClick(event, treeId, treeNode, clickFlag) {
		$("#parentColumnId").val(treeNode.id);
		$("#parentColumnName").val(treeNode.name);
		$(".treeColumn").hide();
	}
	
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		$(".registerform").Validform({
            tiptype:2,
            datatype:{
                "*6-20": /^[^\s]{3,20}$/,
                "z2-4" : /^[\u4E00-\u9FA5\uf900-\ufa2d]{2,4}$/,
                "brithday":function(value){
                    if(value == ''){
                        return "请输入出生日期!";
                    }
                    var a = /^(\d{4})-(\d{2})-(\d{2})$/
                    if (!a.test(value)) {
                        return "日期格式不正确!";
                    }
                }
            }
        });
		$(".btn-primary").click(function() {
			$editor = CKEDITOR.instances.editor01.getData();
			$("#content").val($editor);			
		});
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<form class="form-horizontal registerform" action="${ctx}/outLink/tribune/user/note/save">
			<div class="form-group">
				<label for="number" class="col-sm-2 control-label">帖子编号</label>
				<div class="col-sm-5">
					<input type="text" disabled="disabled" class="form-control" value="${noteNumber}" placeholder="栏目编号" name="noteNumber" id="noteNumber" />
					<input type="hidden" class="form-control" value="${noteNumber}" id="number" name="number" placeholder="栏目编号" />
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">帖子标题</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="title" name="title" placeholder="帖子标题" 
						datatype="*1-30" nullmsg="请输入帖子标题！" errormsg="标题至少1个字符,最多30个字符！"/>
				</div>
				<div class="Validform_checktip"></div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">所属栏目</label>
				<div class="col-sm-5">
					<input type="hidden" name="parentColumnId" id="parentColumnId">
					<input type="text" readonly="readonly" class="form-control" name="parentColumnName" id="parentColumnName" placeholder="所属栏目" 
						datatype="*1-30" nullmsg="请选择所属栏目！" errormsg="标题至少1个字符,最多30个字符！"/>
					<div class="treeColumn col-sm-11">
						<div class="zTreeDemoBackground left">
							<ul id="treeDemo" class="ztree"></ul>
						</div>
					</div>
				</div>
				<div class="Validform_checktip"></div>
			</div>
			<div class="form-group">
				<label for="columnType" class="col-sm-2 control-label">帖子内容</label>
				<div class="col-sm-5">
					<textarea rows="" cols="" style="display:none;" name="content" id="content"></textarea>
					<textarea rows="" cols="" name="editor01" id="editor01"></textarea>
					<script type="text/javascript">
						CKEDITOR.replace('editor01');
					</script>
				</div>
				<div class="Validform_checktip"></div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">确定</button>
					<button type="button" class="btn btn-default">返回</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>