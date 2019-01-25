<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品列表</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap/bootstrap.min.css" >
	  <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap/datepicker.css" >
	  <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap/bootstrap-datetimepicker.min.css" >
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/prolist/selsalelist.css" >
	<script src="<%=path%>/js/jquery/jquery-3.1.0.min.js"></script>
	  <script src="<%=path%>/js/jquery/jquery.i18n.properties.min.js"></script>
    <script src="<%=path%>/js/jquery/bootstrap/bootstrap.min.js"></script>
	  <script src="<%=path%>/js/jquery/bootstrap/bootstrap-datetimepicker.js"></script>

  </head>
  <body>
<div class="container">
    <nav class="navbar bg-primary navbar-fixed-top cus-nav">
    	<div class="container">
	    	<div class="navbar-header">
	    		<a href="#" class="navbar-brand">商品管理系统</a>
	    	</div>
	    	<ul class="nav navbar-nav pull-right">
	    		<li><a href="#">欢迎：13671356502</a></li>
	    		<li><a href="#">退出</a></li>
	    		<li>
	    			<a href="#">消息<span class="badge">10</span></a>
	    		</li>
	    	</ul>
    	</div>
    </nav>
	<ul class="nav nav-pills" style="padding:60px;">
		<li class="active"><a href="#">商品管理</a></li>
		<li><a href="<%=path%>/selprobytotal">商品列表</a></li>
		<li><a href="<%=path%>/html/inputcode.jsp">上传商品</a></li>
		<li><a href="#">商品管理</a></li>
		<li><a href="#">商品管理</a></li>
	</ul>
	<div class="row">
		<div class="col-lg-2 cus-menu">
			<ul class="nav nav-pills nav-stacked" >
				<li>
					<a href="#menu-left" data-toggle="collapse"><span class="glyphicon glyphicon-collapse-down"></span>商品管理</a>
					<ul class="nav nav-pills nav-stacked collapse in" id="menu-left">
						<li>
							<a href="<%=path%>/selprobytotal"><span class="glyphicon glyphicon-collapse-down"></span>商品列表</a>
						</li>
						<li>
							<a href="<%=path%>/html/inputcode.jsp"><span class="glyphicon glyphicon-plus"></span>上传商品</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#menu-left2" data-toggle="collapse"><span class="glyphicon glyphicon-collapse-down"></span>销售管理</a>
					<ul class="nav nav-pills nav-stacked collapse in" id="menu-left2">
						<li>
							<a href="<%=path%>/seltotalorder"><span class="glyphicon glyphicon-collapse-down"></span>销售记录</a>
						</li>

					</ul>
				</li>
			</ul>
		</div>
		<div class="col-lg-10 cus-content">
			<div class="panel-default">
				<div class="panel-heading">
					<form role="form" class="form-inline" action="<%=path%>/selorderbydate" method="post">
						<div class="form-group">
							<div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker mt10 form-control">
								<i class="c-datepicker-range__icon kxiconfont icon-clock"></i>
								<input type="text" autocomplete="off" name="startdate" placeholder="选择日期" class=" c-datepicker-data-input">
							</div>
							<div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker mt10 form-control">
								<i class="c-datepicker-range__icon kxiconfont icon-clock"></i>
								<input type="text" autocomplete="off" name="enddate" placeholder="选择日期" class=" c-datepicker-data-input">
							</div>
							<button class="btn btn-primary form-control">点击查询</button>
						</div>
					</form>
				</div>
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<tr class="info">
							<th>ID</th>
							<th>产品名称</th>
							<th>条形码</th>
							<th>图片</th>
							<th>单价</th>
							<th>实际销售价</th>
							<th>日期</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${lsorder }" var="lc">
						<tr>
							<td>${lc.oid}</td>
							<td>${lc.codeItem.name}</td>
							<td>${lc.ocode}</td>
							<td>${lc.codeItem.picture}</td>
							<td>${lc.codeItem.price}</td>
							<td>${lc.oprice}</td>
							<td>
								<fmt:formatDate value="${lc.saledate }" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>

						</tr>
					</c:forEach>
						<tr>
							<td colspan="10">
								<ul class="pagination">
									<li><a href="seltotalorder?startpage=1">首页</a></li>
									<c:if test="${info.hasPreviousPage }">
										<li><a href="seltotalorder?startpage=${info.pageNum-1 }">上一页</a></li>
									</c:if>
									<c:forEach items="${info.navigatepageNums }" var="page_Num">
										<c:if test="${page_Num == info.pageNum }">
											<li class="active"><a href="seltotalorder?startpage=${page_Num }">${page_Num }</a></li>
										</c:if>
										<c:if test="${page_Num != info.pageNum }">
											<li><a href="seltotalorder?startpage=${page_Num }">${page_Num }</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${info.hasNextPage }">
										<li><a href="seltotalorder?startpage=${info.pageNum+1 }">下一页</a></li>
									</c:if>
									<li><a href="seltotalorder?startpage=${info.pages }" >末页</a></li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>		
	</div>
	<!--模态框 -->
	<!--模态框-->
</div>
  </body>
</html>
<script src="<%=path%>/js/jscript/selsalelist.js" charset="utf-8" type="text/javascript"></script>
<script src="<%=path%>/js/jquery/moment.min.js" charset="utf-8" type="text/javascript"></script>
<script src="<%=path%>/js/jquery/datepicker.all.js" charset="utf-8" type="text/javascript"></script>
<script src="<%=path%>/js/jscript/mydate.js" charset="utf-8" type="text/javascript"></script>