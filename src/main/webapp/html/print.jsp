<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>print</title>
    <script src="<%=path%>/js/jquery/jquery-3.1.0.min.js"></script>
    <script>
        function getQueryVariable(variable){
            var query=window.location.search.substr(1);
            var vars=query.split("&");
            for(var i=0;i<vars.length;i++){
                var pair=vars[i].split("=");
                if(pair[0]==variable){
                    return pair[1];
                }
            }
        }

        // function getparam(){
        //     var query = location.search.substring(1);
        //     var values= query.split("&");
        //     var value = new Array(values.length);
        //     for(var i = 0; i < values.length; i++) {
        //         var pos = values[i].indexOf('=');
        //         if (pos == -1) continue;
        //         var paramname = values[i].substring(0,pos);
        //         //var value = values[i].substring(pos+1);
        //         value[i]=values[i].substring(pos+1);
        //         //alert(paramname +","+value[i] );
        //        // var array=value[0].split(",");
        //
        //         // for(var i=0;i<array.length;i++){
        //         //     appendStr+=
        //         //         "<tr>" +
        //         //         "<td>"+array[i].name+"</td>" +
        //         //         "<td>"+array[i].num+"</td>" +
        //         //         "<td>"+array[i].price+"</td>" +
        //         //         "</tr>";
        //         //     $("#newprint").append(appendStr);
        //         // }
        //
        //
        //     }
        // }
        // function getParam(paramName) {
        //     var reg = new RegExp("(^|&)" + paramName + "=([^&]*)(&|$)");
        //     var url = window.location.search.substr(1).match(reg);
        //     if (url != null) return unescape(url[2]);
        //     return null;
        // }
        window.onload = function(){
            //var list = getUrlParam('arraylist');
            //getparam();
            //var json=getQueryVariable(arraylist);
            //console(json);
            $("#tds").html("55");
        };

    </script>
</head>
<body>
<table id="newprint">
<tr>
    <td id="tds"></td>
</tr>
</table>
</body>
</html>