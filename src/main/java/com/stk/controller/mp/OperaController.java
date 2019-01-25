package com.stk.controller.mp;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.stk.Interface.CodeItemInterface;
import com.stk.entity.CodeItem;
import com.stk.entity.NoNum;
import com.stk.entity.ProNum;
import com.stk.entity.Rf;

import net.sf.json.JSONArray;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class OperaController {
	protected Logger log = Logger.getLogger(OperaController.class);

	@Autowired
	private CodeItemInterface codeItemInterface;
	//注入单个物品信息
	@ModelAttribute
	public void getSeries(
			@RequestParam(value = "id", required = false) Integer id,
			Map<String, Object> map) {
		if (id != null) {
			CodeItem singlecodeItem= codeItemInterface.selprobysingle(id);
			map.put("codeItem", singlecodeItem);
		}
	}

	//删除单个物品信息
	@RequestMapping(value = "/delprobysingle")
	@ResponseBody
	public Object delprobysingle(
						   @RequestParam(value = "id") Integer id,
						   @RequestParam(value = "callback",required = false) String callback) {
		log.info("idididididi"+id);
		String flag="ok";
		try {
			codeItemInterface.delprobysingle(id);
		}catch (Exception e) {
			flag="false";
		}
		JSONPObject jsonpObject = new JSONPObject(callback,flag) ;
		return jsonpObject;
	}
	//修改单个物品信息
	@RequestMapping(value = "/upprobysingle")
	@ResponseBody
	public Object upprobysingle(
			CodeItem codeItem,
			@RequestParam(value = "callback",required = false) String callback) {
			String flag="ok";
	log.info("测试"+codeItem.toString());
			boolean bl= codeItemInterface.upprobysingle(codeItem);
			if(bl=false){
				flag="false";
			}
		JSONPObject jsonpObject = new JSONPObject(callback,flag) ;
		return jsonpObject;
	}
	//入库减少对应库存
	@RequestMapping(value = "/rf")
	@ResponseBody
	public Object rfdel(
			@RequestParam String jsonstr,
			@RequestParam(value = "callback",required = false) String callback) {
		NoNum nom = new NoNum();
		ArrayList<String> lsnonum = new ArrayList<String>();
		try {
			JSONArray jsonArray= JSONArray.fromObject(jsonstr);
			List<Rf> list=(List)JSONArray.toCollection(jsonArray,Rf.class);
			for(Rf r:list){
				int  nownum=r.getNum();
				ProNum proNum= codeItemInterface.selpronumbycode(r.getOcode());
				int  stocknum = proNum.getNum();
				if(nownum>stocknum){
					lsnonum.add(r.getOcode());
				}
			}
			if(lsnonum.size()==0){
				//库存充足
				try{
					codeItemInterface.deladsale(list);
					nom.setFlag("ok");
				}catch (Exception e) {
					nom.setFlag("false");
				}
			}else{
				//库存不足
				nom.setFlag("nocount");
				nom.setLscode(lsnonum);
			}
		}catch (Exception e) {
			nom.setFlag("false");
		}
		JSONPObject jsonpObject = new JSONPObject(callback,nom) ;
		return jsonpObject;
	}



}
