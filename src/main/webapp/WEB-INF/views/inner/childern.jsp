<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.hy.include" prefix="hy" %>
<hy:extends name="title">这是子页面的标题</hy:extends>
<hy:extends name="css">
	<style type="text/css">
		.columnlist {
			float:left;
			width:50%;
			border: 1px solid #e5e5e5;
			border-radius:5px;
		}
		
		.columnlist-left {
			float:left;
			width:49%;
			margin-right:10px;
			border: 1px solid #e5e5e5;
			border-radius:5px;
		}
		
		.columnlist-left .columtitle,.columnlist .columtitle{
			width: 100%;
		    height: 40px;
		    line-height: 34px;
		    padding-top: 2px;
		    padding-left: 15px;
		    padding-bottom: 2px;
		}
		
		.columnlist-left .columncontent,.columnlist .columncontent {
			width: 100%;
		}
		
		a {
			margin-left: 0px;
		}
		
		.columnlist-left .columncontent p,.columnlist .columncontent p{
			border-top: 1px dotted #e5e5e5;
		    padding-left: 15px;
		    height: 24px;
		    line-height: 22px;
		    padding-bottom: 2px;
		    margin-top: 0px;
		    padding-top: 7px;
		}
		
		.columnlist-left .columncontent p span,.columnlist .columncontent p span{
		    color: black;
		    float:right;
		    padding-right:16px;
		}
		.columtitle a {
			color:#000000;
			float:right;
			padding-right:20px;
		}
		.columncontent a {
			color:#000000;
			background: red;
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
	<div class="columnlist-left">
		<div class="columtitle">
			栏目1
			<a>更多&gt;&gt;</a>
		</div>
		<div class="columncontent">
			<a>
				<p>新闻条目一<span>2015-02-14</span></p>
			</a>
			<a>
				<p>新闻条目一<span>2015-02-14</span></p>
			</a>
			<a>
				<p>新闻条目一<span>2015-02-14</span></p>
			</a>
			<a>
				<p>新闻条目一<span>2015-02-14</span></p>
			</a>
			<a>
				<p>新闻条目一<span>2015-02-14</span></p>
			</a>
			<a>
				<p>新闻条目一<span>2015-02-14</span></p>
			</a>
		</div>
	</div>
	<div class="columnlist">
		<div class="columtitle">
			栏目2
			<a>更多&gt;&gt;</a>
		</div>
		<div class="columncontent">
			<a>
				<p>新闻条目一<span>2015-02-14</span></p>
			</a>
			<a>
				<p>新闻条目一<span>2015-02-14</span></p>
			</a>
			<a>
				<p>新闻条目一<span>2015-02-14</span></p>
			</a>
			<a>
				<p>新闻条目一<span>2015-02-14</span></p>
			</a>
			<a>
				<p>新闻条目一<span>2015-02-14</span></p>
			</a>
			<a>
				<p>新闻条目一<span>2015-02-14</span></p>
			</a>
		</div>
	</div>
</hy:extends>
<jsp:include page="/base/parent.jsp" />