package com.stk.controller.mp;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stk.Interface.CodeItemInterface;
import com.stk.entity.CodeItem;
import com.stk.entity.Order;
import com.stk.entity.SelDates;
import com.stk.service.CodeItemServiceimpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

@Controller
public class SelcodeController {
	protected Logger log = Logger.getLogger(SelcodeController.class);


	@Autowired
	private CodeItemInterface codeItemInterface;
	//根据条形码查询单条物品信息
	@RequestMapping(value = "/selcode")
	@ResponseBody
	public Object selcode(@RequestParam(value = "codes",defaultValue = "0") String codes,
						   @RequestParam(value = "callback",required = false) String callback) {
			//CodeItemInterfaces.elprobycode(codes);
			CodeItem ci= codeItemInterface.selprobycode(codes);
//			log.info(ci.toString());
			JSONPObject jsonpObject = new JSONPObject(callback,ci) ;
		return jsonpObject;
	}
	//根据条商品id查询单条物品信息
	@RequestMapping(value = "/selprobysingle")
	public String selcode(@RequestParam(value = "id") int id,Map<String, Object> map) {
		CodeItem ci= codeItemInterface.selprobysingle(id);
		//System.out.print(ci.toString());
		map.put("CodeItem", ci);
		return "pages/prodetail.jsp";
	}

	//查询所有物品信息（保留）
	@RequestMapping(value = "/selprobytotaljson")
	@ResponseBody
	public Object selcodesjson(@RequestParam(value = "callback",required = false) String callback) {
		ArrayList<CodeItem> lscoit=new ArrayList<CodeItem>();
		lscoit= codeItemInterface.selprobytotal();
		log.info(lscoit.size()+"数量");
		JSONPObject jsonpObject = new JSONPObject(callback,lscoit) ;
		return jsonpObject;
	}
	//查询所有物品信息（jsp jstl）
	@RequestMapping(value = "/selprobytotal")
	public String selcodes(@RequestParam(value="startpage",required=false,defaultValue="1") Integer startpage,
			Map<String, Object> map) {

		PageHelper.startPage(startpage, 6);

		ArrayList<CodeItem> lscoit=new ArrayList<CodeItem>();
		lscoit= codeItemInterface.selprobytotal();
		PageInfo<CodeItem> pageInfo = new PageInfo<CodeItem>(lscoit);
		map.put("info", pageInfo);
		map.put("lscoit", pageInfo.getList());
		//return "pages/prolist.jsp";
		return "html/prolist.jsp";
	}
	//查询所有物品信息（jsp jstl）
	@RequestMapping(value = "/seltotalorder")
	public String seltotalorder(@RequestParam(value="startpage",required=false,defaultValue="1") Integer startpage,
						   Map<String, Object> map) {

		PageHelper.startPage(startpage, 6);

		ArrayList<Order> lsorder=new ArrayList<Order>();
		lsorder= codeItemInterface.seltotalorder();
		PageInfo<Order> pageInfo = new PageInfo<Order>(lsorder);
		map.put("info", pageInfo);
		map.put("lsorder", pageInfo.getList());
		//return "pages/prolist.jsp";
		return "html/selsalelist.jsp";
	}
	//查询所有物品信息（jsp jstl）
	@RequestMapping(value = "/selorderbydate")
	public String selorderbydate(@RequestParam(value="startpage",required=false,defaultValue="1") Integer startpage,
								 @RequestParam Date startdate,
								 @RequestParam Date enddate,
								 Map<String, Object> map) {
		SelDates sae = new SelDates();
		sae.setStartdate(startdate);
		sae.setEnddate(enddate);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
log.info(df.format(sae.getStartdate()));
log.info(df.format(sae.getEnddate()));
		PageHelper.startPage(startpage, 6);

		ArrayList<Order> lsorderbydate=new ArrayList<Order>();
		lsorderbydate= codeItemInterface.selorderbydate(sae);
		PageInfo<Order> pageInfo = new PageInfo<Order>(lsorderbydate);
		map.put("info", pageInfo);
		map.put("lsorder", pageInfo.getList());

		return "html/selsalelist.jsp";
	}
}
