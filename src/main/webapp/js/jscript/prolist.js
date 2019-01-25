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

//模态框  修改商品
function uppro(obj){
		$('#upid').val($(obj).data('id'));
		$('#upname').val($(obj).data('name'));
    	$('#upcode').val($(obj).data('code'));
		$('#upprice').val($(obj).data('price'));
		$('#upcount').val($(obj).data('count'));
    	$('#updesc').val($(obj).data('desc'));
		$('#nowpage').val($(obj).data('page'));
		$("#mymodal").modal({
			backdrop:'static'
		});
}
function saves(){
    var url=geturl();
	var upid=$("#upid").val();
    var upname=$("#upname").val();
    var upcode=$("#upcode").val();
    var upprice=$("#upprice").val();
    var upcount=$("#upcount").val();
    var updesc=$("#updesc").val();
    var nowpage=$("#nowpage").val();

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
        url: ""+path+"/upprobysingle",
        dataType: "jsonp",
        jsonp: "callback",//一般默认为:callback
        jsonpCallback:"success_jsonpCallback",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
        data : {
            "id" : upid,
			"code" :upcode,
            "name" : upname,
            "price" : upprice,
			"count" :upcount,
			"description" :updesc

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

//模态框  删除商品
function delpro(obj){
	$('#delname').html($(obj).data('name'));
    $('#delnowpage').val($(obj).data('page'));
    $('#delid').val($(obj).data('id'));
		$("#mymodaldel").modal({
			backdrop:'static'
		});
}
function savedel(){
    var delid=$("#delid").val();
    var nowpage=$("#delnowpage").val();
	//取得项目路径
    var curWwwPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    var localhostPaht=curWwwPath.substring(0,pos);
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    var path=localhostPaht+projectName;
    var url=geturl();
    $.ajax({
        type: "get",
        async: true,//异步请求
        url: ""+url+"/delprobysingle",
        dataType: "jsonp",
        jsonp: "callback",//一般默认为:callback
        jsonpCallback:"success_jsonpCallback",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
        data : {
            "id" : delid
        },
        success : function(msg) {
            alert("删除成功");
            $('#mymodaldel').modal('toggle');
            window.location.href=''+path+'/selprobytotal?startpage='+nowpage+'';
        },
        error : function(res) {
            //alert(res.responseText);
            alert("FALSE");
        }
    });
}
//添加商品
function savepro(){
    $("#savecode").attr('disabled','disabled');
    var name=$("#savename").val();
    var code=$("#savecode").val();
    var price=$("#saveprice").val();
    var count=$("#savecount").val();
    var discount=$("#savediscount").val();
    var picture=$("#savepicture").val();
    var desc=$("#savedesc").val();
    var url=geturl();
    //取得项目路径
    var curWwwPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    var localhostPaht=curWwwPath.substring(0,pos);
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    var path=localhostPaht+projectName;
    var mall={
        "name"  : name,
        "code" : code,
        "price" : price,
        "count"  : count,
        "discount" : discount,
        "picture" : picture,
        "description" :desc
    };
    $.ajax({
        type: "get",
        async: true,//异步请求
        url: ""+url+"/saveedit",
        dataType: "jsonp",
        jsonp: "callback",//一般默认为:callback
        jsonpCallback:"success_jsonpCallback",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
        data : {
            jsonstr: JSON.stringify(mall)
        },
        success : function(msg) {
            if(msg=="ok"){
                alert("添加成功");
                window.location.href=''+path+'/selprobytotal';

            }else if(msg=="okrepeat"){
                alert("商品已存在，已增加库存！");
                window.location.href=''+path+'/selprobytotal';
            }else{
                alert("添加失败")
                $("#savecode").removeAttr("disabled");
            }

        },
        error : function(res) {
            //alert(res.responseText);
            alert("FALSE");
        }
    });
}