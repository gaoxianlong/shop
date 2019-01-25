function getpath(){
    //取得项目路径
    var curWwwPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    var localhostPaht=curWwwPath.substring(0,pos);
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    var path=localhostPaht+projectName;

    return path;
}
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


//js 日期转换
/**************************************时间格式化处理************************************/
function dateFtt(fmt,date)
{ //author: meizz
    var o = {
        "M+" : date.getMonth()+1,                 //月份
        "d+" : date.getDate(),                    //日
        "h+" : date.getHours(),                   //小时
        "m+" : date.getMinutes(),                 //分
        "s+" : date.getSeconds(),                 //秒
        "q+" : Math.floor((date.getMonth()+3)/3), //季度
        "S"  : date.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
}
//监听输入框变化
$('#main').on('keydown',('.selcodeinput:last'),function(event) {
    if (event.keyCode == "13") {
        $(this).attr('disabled','disabled');
        //得到当前输入的code
        var code=$(this).val();
        var seljd=$(".seljd:last").val();

        if(code != null && code!= ""){
            //code不为空
            if(seljd==1){
                add(code);
            }else{
                var array = new Array();
                $(".selcodeinput").each(function(){
                    var nowcode=$(this).val();
                    array.push(nowcode);
                });
                array.pop();
                if(isInArray(array,code)){
                    //存在
                    var i=contains(array, code);
                    var nownum=$('.selnum').eq(i).text();
                    var nextnum=Number(nownum)+1;
                    var singleprice=$('.selpricesingle').eq(i).text();
                    var totalprice=Number(singleprice)*Number(nextnum);
                    //数量
                    $('.selnum').eq(i).html(nextnum);
                    //原价
                    $('.selpricepre').eq(i).html(totalprice);
                    $('.selprice').eq(i).val(totalprice);
                    $(".selcodeinput:last").removeAttr("disabled");
                    $(".selcodeinput:last").val("");
                    $('#main .selcodeinput:last').focus();
                }else{
                    //不存在
                    // $(".selcodeinput:last").removeAttr("disabled");
                    //  $(".selcodeinput:last").val("");
                    //  $('#main .selcodeinput:last').focus();
                    add(code);
                }
            }
        }else{
            //code为空
            $(".selcodeinput:last").removeAttr("disabled");
            $(".selcodeinput:last").val("");
            $('#main .selcodeinput:last').focus();
        }

    }
});
//添加div并赋值的封装
function add(code){
    var url=geturl();
    $.ajax({
        type: "get",
        async: true,//异步请求
        url: ""+url+"/selcode",
        dataType: "jsonp",
        jsonp: "callback",//一般默认为:callback
        jsonpCallback:"success_jsonpCallback",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
        data : {
            "codes" : code
        },
        success : function(msg) {
            if(msg!=null){
                $(".selname:last").html(msg.name);
                $(".selnum:last").html(1);
                $(".selpricesingle:last").html(msg.price);
                $(".selpricepre:last").html(msg.price);
                $(".selprice:last").val(msg.price);
                var appendStr ="";
                appendStr+= "<tr class='adddiv'>" +
                    "<td><input type='text' class='form-control selcodeinput' placeholder='条形码' aria-describedby='basic-addon1' ></td>" +
                    "<td class='selname'></td>" +
                    "<td class='selnum'></td>" +
                    "<td class='selpricesingle'></td>" +
                    "<td class='selpricepre'></td>" +
                    "<td><input type='text' class='form-control selprice' disabled='disabled'/></td>" +
                    "<td>" +
                    "<button type='button' class='btn btn-primary'  onclick='upprice(this);'>修改价格</button>" +
                    "<button type='button' class='btn btn-primary'  onclick='dels(this);'>删除</button>" +
                    "</td>" +
                    "<input class='seljd' value='0' type='hidden'>" +
                    "</tr>" ;
                $(".newdiv").append(appendStr);
                $('#main .selcodeinput:last').focus();
            }else{
                $(".selcodeinput:last").removeAttr("disabled");
                $(".selcodeinput:last").val("");
                $('#main .selcodeinput:last').focus();
                alert("无商品信息，请重新扫描！");
            }
        },
        error : function(res) {
            //alert(res.responseText);
            alert("FALSE");
            $(".selcodeinput:last").removeAttr("disabled");
            $(".selcodeinput:last").val("");
            $('#main .selcodeinput:last').focus();
        }
    });

}
//添加div不赋值的封装
function addnva(){
    var appendStr ="";
    appendStr+= "<tr class='adddiv'>" +
        "<td><input type='text' class='form-control selcodeinput' placeholder='条形码' aria-describedby='basic-addon1' ></td>" +
        "<td class='selname'></td>" +
        "<td class='selnum'></td>" +
        "<td class='selpricesingle'></td>" +
        "<td class='selpricepre'></td>" +
        "<td><input type='text' class='form-control selprice' disabled='disabled'/></td>" +
        "<td><button type='button' class='btn btn-primary'  onclick='upprice(this);'>修改价格</button>" +
        "<button type='button' class='btn btn-primary'  onclick='dels(this);'>删除</button></td>" +
        "<input class='seljd' value='0' type='hidden'>" +
        "</tr>" ;
    $(".newdiv").append(appendStr);
    $('#main .selcodeinput:last').focus();
}
function contains(arrays, obj) {
    var i = arrays.length;
    while (i--) {
        if (arrays[i] === obj) {
            return i;
        }
    }
    return false;
}
function isInArray(arr,value){
    var index = $.inArray(value,arr);
    if(index >= 0){
        return true;
    }
    return false;
}
//编辑价格
function upprice(obj) {
    alert("编辑价格");
    // alert(obj.parentNode.parentNode);
    $(obj).parent().prev().children().removeAttr("disabled");
}
//删除
function dels(obj) {
    alert("删除");
    // obj.parentNode.parentNode.removeChild(obj.parentNode);
    $(obj).parent().parent().remove();
}
//结账并打印
function clearandprint(){
   pay();
   prints();
}
//结账
function pay(){
    //  $(".adddiv:last").remove();
    var total=Number(0);
    $(".selprice").each(function(){
        var pr=Number($(this).val());
        total+=pr;
    });
    $("#tprice").text(total);
}
//计算商品总数量
function gettotalnum(){
    //  $(".adddiv:last").remove();
    var total=Number(0);
    $(".selnum").each(function(){
        var pr=Number($(this).text());
        total+=pr;
    });
  return total;
}
//清楚空记录
function clearnull() {
    $(".selcodeinput").each(function(){
        var cod=$(this).val();
        if(cod.replace(/(^s*)|(s*$)/g, "").length ==0){
            $(this).parent().parent().remove();
        }
    });
}
//入库减少库存并增加销售记录
function rf(){
    pay();
    // var cod=$(".selcodeinput:last").val();
    // if(cod.replace(/(^s*)|(s*$)/g, "").length ==0){
    //     $(".selcodeinput:last").parent().parent().remove();
    // }
    var url=geturl();
    clearnull();
    var dat = new Date();
    var array = new Array();
    $(".selcodeinput").each(function(index,item){
        var dat = new Date();
        var nowcode=$(item).val();
        var nownum=$('.selnum').eq(index).text();
        var nowprice=$('.selprice').eq(index).val();
        var arr={ocode:nowcode,num:nownum,oprice:nowprice,saledate:dat};
        array.push(arr);
    });
    $.ajax({
        type: "get",
        async: true,//异步请求
        url: ""+url+"/rf",
        dataType: "jsonp",
        jsonp: "callback",//一般默认为:callback
        contentType:"application/json; charset=utf-8",
        jsonpCallback:"success_jsonpCallback",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
        data : {
            jsonstr: JSON.stringify(array)
        },
        success : function(msg) {
            if(msg.flag=="ok"){
                //alert("入库成功");
                var daterk=dateFtt("yyyy-MM-dd hh:mm:ss",dat);
                $("#trk").text("已入库");
                $("#trkdate").text(daterk);
                $("#rfbt").attr("style","display:none;");
            }else if(msg.flag=="nocount"){
                alert("因库存不足，入库不成功");
                var ls=msg.lscode;
                for(var co in ls){
                    alert(ls[co]);
                }
            }else{
                alert("入库不成功");
            }
        },
        error : function(res) {
            //alert(res.responseText);
            alert("FALSE");
        }
    });
}
//打印
function prints() {
var totalnum=gettotalnum();
    var path=getpath();
    var appendStrtr ="";
    var trkdate=$("#trkdate").text();
    var trkprice=$("#tprice").text();
    // var cod=$(".selcodeinput:last").val();
    // if(cod.replace(/(^s*)|(s*$)/g, "").length ==0){
    //     $(".selcodeinput:last").parent().parent().remove();
    // }
    clearnull();
    var array = new Array();
    $(".selcodeinput").each(function(index,item){
        var name=$('.selname').eq(index).text();
        var nownum=$('.selnum').eq(index).text();
        var nowprice=$('.selprice').eq(index).val();
        var arr={name:name,num:nownum,price:nowprice};
        array.push(arr);
    });
    for(var i=0;i<array.length;i++){
        appendStrtr+= "<div>" +
                "<span style='width:100px;display:inline-block;text-align:center'>"+array[i].name+"</span>" +
                "<span style='width:100px;display:inline-block;text-align:center'>"+array[i].num+"</span>" +
                "<span style='width:100px;display:inline-block;text-align:center'>"+array[i].price+"</span>" +
            "</div>";
    }
    var  ds="<div style='width:300px' align='center'>xxx</div>" +
        "<div style='width:300px' align='center'>xxx</div>" +
        "<div style='width:300px' align='center'>"+trkdate+"</div>" +
        "<div>" +
            "<span style='width:100px;border: #1b6d85 0px solid;display:inline-block;text-align:center;'>名称</span>" +
            "<span style='width:100px;border: #1b6d85 0px solid;display:inline-block;text-align:center;'>数量</span>" +
            "<span style='width:100px;border: #1b6d85 0px solid;display:inline-block;text-align:center;'>价格</span>" +
        "</div>";
    var  bottom="<div style='width:300px;border-top: #46b8da 1px solid;' align='center'>" +
                    "<span style='width:100px;display:inline-block;text-align:center;'>xxx</span>" +
                    "<span style='width:100px;display:inline-block;text-align:center;'>"+totalnum+"</span>" +
                    "<span style='width:100px;display:inline-block;text-align:center;'>"+trkprice+"</span>" +
                "</div>";


    var  div=document.createElement("div");
    div.innerHTML=ds;

    var  divs=document.createElement("div");
    divs.style.width="300px";
   // divs.style.height="300px";
    divs.style.borderTopColor= "#ff0000";
    divs.style.borderTopWidth="1px";
    divs.style.borderTopStyle="solid";

    var  bottomdiv=document.createElement("div");
    bottomdiv.style.width="400px";
    bottomdiv.style.height="400px";

    bottomdiv.innerHTML=bottom;

    divs.innerHTML=appendStrtr;

    div.appendChild(divs);
    div.appendChild(bottomdiv);
    var printHtml=div.innerHTML;
    var url=''+path+'/html/print.jsp?arraylist='+1;
    var wind = window.open("",'newwindow', 'height=300, width=700, top=100, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no');
    wind.document.body.innerHTML = printHtml;
    wind.print();
}