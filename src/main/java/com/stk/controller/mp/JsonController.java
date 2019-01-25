package com.stk.controller.mp;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.stk.Interface.CodeItemInterface;
import com.stk.entity.CodeItem;
import com.stk.service.CodeItemServiceimpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonController {
	protected Logger log = Logger.getLogger(JsonController.class);


	@Autowired
	private CodeItemInterface   codeItemInterface;
	//添加单个物品信息  返回json
	@RequestMapping(value = "/saveedit")
	@ResponseBody
	public Object saveedit(@RequestParam String jsonstr,
						   @RequestParam(value = "callback",required = false) String callback) {
		String flag="false";
		CodeItem ci = JSONObject.parseObject(jsonstr, CodeItem.class);//将json字符串转换成json对象
		String code=ci.getCode();
		if(code != null && code.length()>0){
			//有商品条形码
			CodeItem cis= codeItemInterface.selprobycode(code);
			if(cis == null){
				//添加商品
				int count=ci.getCount();
				if(count==0){
					count=1;
				}
				java.sql.Date nowSqldate = new java.sql.Date(System.currentTimeMillis());
				ci.setDate(nowSqldate);
				ci.setCount(count);

				flag= codeItemInterface.saveedit(ci);
			}else {
				//商品已存在，增加库存
				flag= codeItemInterface.addprorepeat(code);
			}
		}else{
			//无商品条形码
			flag="false";
		}
			JSONPObject jsonpObject = new JSONPObject(callback,flag) ;
		return jsonpObject;
	}
}
