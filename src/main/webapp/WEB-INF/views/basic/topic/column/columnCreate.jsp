<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<%@ taglib uri="http://curtainContain/tag" prefix="curtain"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<curtain:include href="base/bootstap.jsp" />
<title>栏目添加</title>
<style type="text/css">
	.treeColumn {
		position:absolute;
		z-index:9999;
		background:#f2f2f2;
		display: none;
		width:94%;
		padding-left:10px; 
		padding-right:0px;
		border-radius:10px;
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
	});
</script>
</head>
<body>
	<div class="container">
		<form class="form-horizontal registerform" action="${ctx}/basic/topic/column/columnSave.json">
			<div class="form-group">
				<label for="number" class="col-sm-2 control-label">栏目编号</label>
				<div class="col-sm-5">
					<input type="text" disabled="disabled" class="form-control" value="${number}" placeholder="栏目编号" />
					<input type="hidden" class="form-control" value="${number}" id="number" name="number" placeholder="栏目编号" />
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">上级栏目</label>
				<div class="col-sm-5">
					<input type="hidden" name="parentColumnId" id="parentColumnId" >
					<input type="text" class="form-control" name="parentColumnName" id="parentColumnName" placeholder="上级栏目" />
					<div class="treeColumn col-sm-11">
						<div class="zTreeDemoBackground left">
							<ul id="treeDemo" class="ztree"></ul>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">栏目名称</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="name" name="name" placeholder="栏目名称" 
						datatype="*1-18" nullmsg="请输入栏目名称！" errormsg="昵称至少1个字符,最多18个字符！"/>
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