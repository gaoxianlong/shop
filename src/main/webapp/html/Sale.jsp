<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sale</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap/bootstrap.min.css" >
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/prolist/sale.css" >
	<script src="<%=path%>/js/jquery/jquery-3.1.0.min.js"></script>
	  <script src="<%=path%>/js/jquery/jquery.i18n.properties.min.js"></script>
    <script src="<%=path%>/js/jquery/bootstrap/bootstrap.min.js"></script>
  </head>
  <body>
	<div class="container index" id="main">
	<div style="height:40px;margin-top: 10px;border:0px solid red;" >
		<div class="" style="float: left">
			<button type="button" class="btn btn-primary"  onclick="pay();">当前价格</button>
			<button type="button" class="btn btn-primary"  onclick="clearandprint();">结账打印</button>
			<button type="button" class="btn btn-primary"  onclick=" addnva();">扫描商品</button>
			<button type="button" class="btn btn-primary"  onclick=" rf();" id="rfbt">入库</button>
			<button type="button" class="btn btn-primary"  onclick=" geturl();" id="rfsbt">alert</button>
			<!--<button type="button" class="btn btn-primary"  onclick=" prints();">打印</button>-->
		</div>
		<div class="" style="float: right;padding:3px;">
			<span style="color:red;font-size:25px;">总价：</span><span style="font-size:25px;width: 300px;" id="tprice">0</span><span style="font-size:25px;">元</span>

			<span style="color:red;font-size:25px;margin-left: 50px;">入库状态：</span><span style="font-size:25px;" id="trk">未入库</span>
			<span style="color:red;font-size:25px;margin-left: 50px;">入库时间：</span><span style="font-size:25px;" id="trkdate"></span>

		</div>
	</div>

		<div>
		<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr class="info">
					<th>条形码</th>
					<th>商品名称</th>
					<th>数量</th>
					<th>单价</th>
					<th>原价</th>
					<th>价格</th>
                    <th>操作</th>
				</tr>
			</thead>

			<tbody class="newdiv" id="newdiv">
				<tr class="adddiv">
					<td><input type="text" class="form-control selcodeinput" placeholder="条形码" aria-describedby="basic-addon1" autofocus='autofocus'></td>
					<td class="selname"></td>
					<td class="selnum"></td>
					<td class="selpricesingle"></td>
					<td class="selpricepre"></td>
					<td><input type='text' class="form-control selprice" disabled="disabled"/></td>
                    <td>
                        <button type="button" class="btn btn-primary"  onclick="upprice(this);">修改价格</button>
                        <button type="button" class="btn btn-primary"  onclick="dels(this);" data-id="${lc.id}">删除</button>
                    </td>
                    <input  class="seljd" type="hidden" value="1"/>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
  </body>
</html>
<script src="<%=path%>/js/jscript/sale.js"></script>