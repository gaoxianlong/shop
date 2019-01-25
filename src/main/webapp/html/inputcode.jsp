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
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/prolist/prolist.css" >
	<script src="<%=path%>/js/jquery/jquery-3.1.0.min.js"></script>
	  <script src="<%=path%>/js/jquery/jquery.i18n.properties.min.js"></script>
    <script src="<%=path%>/js/jquery/bootstrap/bootstrap.min.js"></script>
    
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
			<div>
				<form class="form form-horizontal">
					<div class="form-group">
						<label class="col-lg-2">产品名称</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" id="savename"/>
						</div>
						<label class="col-lg-2">条形码</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" id="savecode"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2">价格</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" id="saveprice"/>
						</div>
						<label class="col-lg-2">库存</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" id="savecount"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2">折扣</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" id="savediscount"/>
						</div>
						<label class="col-lg-2">图片</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" id="savepicture"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2">描述</label>
						<div class="col-lg-10">
							<textarea class="form-control"  id="savedesc"></textarea>
						</div>
					</div>
				</form>
				<div class="form-group" style="text-align:center;margin-top:30px;">
					<button class="btn btn-primary" style="width:200px;" onclick="savepro();">保存</button>
				</div>
			</div>
		</div>		
	</div>

</div>
  </body>
</html>
<script src="<%=path%>/js/jscript/prolist.js"></script>