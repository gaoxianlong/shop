package com.stk.controller.mp;

import com.stk.Interface.CodeItemInterface;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	protected Logger log = Logger.getLogger(LoginController.class);


	@Autowired
	private CodeItemInterface   codeItemInterface;
	//根据条形码查询单条物品信息
	@RequestMapping(value = "/login")
	@ResponseBody
	public Object login(@RequestParam(value = "username") String username,
						@RequestParam(value = "passwd") String passwd) {



		return "11";
	}

}
