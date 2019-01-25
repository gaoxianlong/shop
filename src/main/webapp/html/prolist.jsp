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
		<li><a href="#">商品管理</a></li>
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
					<form role="form" class="form-inline">
						<div class="form-group">
							<input type="text" placeholder="请输入" class="form-control"/>
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
							<th>价格</th>
							<th>库存</th>
							<th>折扣</th>
							<th>描述</th>
							<th>日期</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${lscoit }" var="lc">
						<tr>
							<td>${lc.id}</td>
							<td>${lc.name}</td>
							<td>${lc.code}</td>
							<td>${lc.picture}</td>
							<td>${lc.price}</td>
							<td style="width:90px">${lc.count}</td>
							<td>${lc.discount}</td>
							<td style="width:90px">${lc.description}</td>
							<td>
								<fmt:formatDate value="${lc.date }" pattern="yyyy-MM-dd" />
							</td>
							<td>
								<button type="button" class="btn btn-primary"  onclick="uppro(this);"
										data-id="${lc.id}" data-name="${lc.name}" data-code="${lc.code}" data-price="${lc.price}"
										data-count="${lc.count}" data-desc="${lc.description}"
										data-page="${info.pageNum}">修改</button>
								<button type="button" class="btn btn-primary"  onclick="delpro(this);"
										data-id="${lc.id}" data-name="${lc.name}" data-page="${info.pageNum}">删除</button>
							</td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="10">
								<ul class="pagination">
									<li><a href="selprobytotal?startpage=1">首页</a></li>
									<c:if test="${info.hasPreviousPage }">
										<li><a href="selprobytotal?startpage=${info.pageNum-1 }">上一页</a></li>
									</c:if>
									<c:forEach items="${info.navigatepageNums }" var="page_Num">
										<c:if test="${page_Num == info.pageNum }">
											<li class="active"><a href="selprobytotal?startpage=${page_Num }">${page_Num }</a></li>
										</c:if>
										<c:if test="${page_Num != info.pageNum }">
											<li><a href="selprobytotal?startpage=${page_Num }">${page_Num }</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${info.hasNextPage }">
										<li><a href="selprobytotal?startpage=${info.pageNum+1 }">下一页</a></li>
									</c:if>
									<li><a href="selprobytotal?startpage=${info.pages }" >末页</a></li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>		
	</div>
	<!--模态框 -->
		<!--模态框  修改商品-->
		<div class="modal" role="dialog" id="mymodal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">修改商品</h4>
							</div>
							<div class="modal-body"/>
							<form class="form form-horizontal">
								<div class="form-group">
									<label class="col-lg-2">产品名称</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" id="upname"/>
									</div>
									<label class="col-lg-2">条形码</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" id="upcode"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2">价格</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" id="upprice"/>
									</div>
									<label class="col-lg-2">库存</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" id="upcount"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2">描述</label>
									<div class="col-lg-10">
										<textarea class="form-control"  id="updesc"></textarea>
										<input type="hidden" id="nowpage" value=""/>
										<input type="hidden" id="upid" value=""/>
									</div>
								</div>
							</form>
						</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">取消</button>
								<button id="saves" class="btn btn-primary" onclick="saves();">保存</button>
							</div>
						</div>
					</div>	
				</div>
		<!--模态框  修改商品-->
		<!--模态框  删除商品-->
		<div class="modal" role="dialog" id="mymodaldel">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">删除商品</h4>
							</div>
							<div class="modal-body"/>
							确定删除   <span id="delname"></span>   吗？
							<input type="hidden" id="delnowpage" value=""/>
							<input type="hidden" id="delid" value=""/>
							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">取消</button>
								<button class="btn btn-primary" onclick="savedel();">保存</button>
							</div>
						</div>
					</div>	
				</div>
		<!--模态框  删除商品-->
	<!--模态框-->
</div>
  </body>
</html>
<script src="<%=path%>/js/jscript/prolist.js"></script>