<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://curtainContain/tag" prefix="curtain"%>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<curtain:include href="base/bootstap.jsp" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/project/css/main.css">
<!--可无视-->
<link href="${ctx}/static/main/css/global.css" rel="stylesheet">

<!--必要样式-->
<link type="text/css" href="${ctx}/static/main/css/style.css" rel="stylesheet">
<link href="${ctx}/static/main/css/component.css" rel="stylesheet" type="text/css" />
<link rel=stylesheet type=text/css href="${ctx}/static/main/css/zzsc.css">
<script type="text/javascript" src="${ctx}/static/main/js/modernizr.custom.js"></script>
<script type="text/javascript" src="${ctx}/static/main/js/jquery.dlmenu.js"></script>
<title>后台信息管理</title>
<style type="text/css">
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var h = window.innerHeight;
		$("#main_frame").height(h - $('.header').height());
		$("#firstpane").height(h - $('.header').height());
		$("body").height(h);

		$("#firstpane .menu_body:eq(0)").show();
		$("#firstpane p.menu_head").click(function(){
			$(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
			$(this).siblings().removeClass("current");
		});
		$("#secondpane .menu_body:eq(0)").show();
		$("#secondpane p.menu_head").mouseover(function(){
			$(this).addClass("current").next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
			$(this).siblings().removeClass("current");
		});

		$( '#dl-menu' ).dlmenu();
	});

	$(window).resize(function() {
		var h = window.innerHeight;
		$("#main_frame").height(h - $('.header').height());
		$("#firstpane").height(h - $('.header').height());
		$("body").height(h);
	});
</script>
</head>
<body style="overflow-y: hidden">
	<div class="container-fluid">
		<div class="row" style="border-bottom: 2px solid #f2f2f2;text-align: left">
			<header class="header">
				<a href="http://sc.chinaz.com/" class="search"><span>目的地搜索</span></a>
				<a href="http://sc.chinaz.com/" class="user-icon"><span>用户中心</span></a>
				<div id="dl-menu" class="dl-menuwrapper">
					<button id="dl-menu-button">Open Menu</button>
					<ul class="dl-menu">
						<li><a href="http://sc.chinaz.com/">首页</a></li>
						<li><a href="http://sc.chinaz.com/">台湾游</a></li>
						<li><a href="http://sc.chinaz.com/">出境游</a></li>
						<li><a href="http://sc.chinaz.com/">国内游</a></li>
						<li><a href="http://sc.chinaz.com/">周边游</a></li>
						<li>
							<a href="Line">自由行</a>
							<ul class="dl-submenu">
								<li class="dl-back"><a href="#">返回上一级</a></li>
								<li><a href="http://sc.chinaz.com/">线路</a></li>
								<li><a href="http://sc.chinaz.com/">签证</a></li>
								<li><a href="http://sc.chinaz.com/">门票</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</header>
		</div>
		<div class="row menu-row">
			<div class="col-md-2" style="background: #f1f1f1">
				<!-- 代码 开始 -->
				<div id="firstpane" class="menu_list" style="overflow-y:auto;overflow-x: hidden">
					<p class="menu_head current">哲学</p>
					<div style="display:block" class=menu_body >
						<a href="#">科学技术哲学</a>
						<a href="#">宗教学</a>
						<a href="#">美学</a>
						<a href="#">伦理学</a>
						<a href="#">逻辑学</a>
						<a href="#">外国哲学</a>
						<a href="#">中国哲学</a>
						<a href="#">马克思主义哲学</a>
					</div>
					<p class="menu_head">经济学</p>
					<div style="display:none" class=menu_body >
						<a href="#">应用经济学</a>
						<a href="#">理论经济学</a>
						<a href="#">国民经济学</a>
						<a href="#">区域经济学</a>
						<a href="#">产业经济学</a>
						<a href="#">国际贸易学</a>
						<a href="#">劳动经济学</a>
						<a href="#">政治经济学</a>
					</div>
					<p class="menu_head">法学</p>
					<div style="display:none" class=menu_body >
						<a href="#">马克思主义基本原理</a>
						<a href="#">马克思主义发展史</a>
						<a href="#">马克思主义中国化研究</a>
						<a href="#">国外马克思主义研究</a>
						<a href="#">思想政治教育</a>
					</div>
					<p class="menu_head">教育学</p>
					<div style="display:none" class=menu_body >
						<a href="#">体育人文社会学</a>
						<a href="#">体育教育训练学</a>
						<a href="#">民族传统体育学</a>
						<a href="#">发展与教育心理学</a>
						<a href="#">应用心理学</a>
						<a href="#">教育学原理</a>
						<a href="#">课程与教学论</a>
						<a href="#">比较教育学</a>
						<a href="#">学前教育学</a>
						<a href="#">高等教育学</a>
						<a href="#">成人教育学</a>
						<a href="#">职业技术教育学</a>
						<a href="#">特殊教育学</a>
						<a href="#">教育技术学</a>
					</div>
					<p class="menu_head">工学</p>
					<div style="display:none" class=menu_body >
						<a href="#">一般力学与力学基础</a>
						<a href="#">固体力学</a>
						<a href="#">流体力学</a>
						<a href="#">工程力学</a>
						<a href="#">机械制造及其自动化</a>
						<a href="#">机械电子工程</a>
						<a href="#">机械设计及理论</a>
						<a href="#">仪器科学与技术</a>
						<a href="#">精密仪器及机械</a>
						<a href="#">测试计量技术及仪器</a>
						<a href="http://sc.chinaz.com/" target="_blank">站长素材</a>
					</div>
				</div>
			</div>
			<div class="col-md-10" style="padding-left: 0px;padding-right: 1px;border-left: 2px solid #f2f2f2;">
				<iframe id="main_frame" name="main_frame" frameborder="0" src="${ctx}/basic/topic/column/columnList" width="100%" height="100%"/>
			</div>
		</div>
	</div>
</body>
</html>