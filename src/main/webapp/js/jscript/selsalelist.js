
function geturl(){
    //取得项目路径
    var curWwwPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    var localhostPaht=curWwwPath.substring(0,pos);
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    var path=localhostPaht+projectName;

    return path;
}
//按照日期筛选查询销售订单
function selorderbydate(){
	var startdateq=$("#startdate").val();
    var enddateq=$("#startdate").val();
    var mall={
        "startdate"  : startdateq,
        "enddate" : enddateq
    };
    var url=geturl();

    //取得项目路径
    var curWwwPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    var localhostPaht=curWwwPath.substring(0,pos);
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    var path=localhostPaht+projectName;
    $.ajax({
        type: "get",
        async: true,//异步请求
        url: ""+url+"/upprobysingle",
        dataType: "jsonp",
        jsonp: "callback",//一般默认为:callback
        jsonpCallback:"success_jsonpCallback",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据

        data : {
            jsonstr: JSON.stringify(mall)

        },
        success : function(msg) {
            alert("修改成功");
            $('#mymodal').modal('toggle');
            window.location.href=''+path+'/selprobytotal?startpage='+nowpage+'';
        },
        error : function(res) {
            //alert(res.responseText);
            alert("FALSE");
        }
    });
}


