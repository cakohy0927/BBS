package com.cako.basic.index;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author cakohy
 * 后台主页的入口
 */
@Controller
public class InnerController {
	
	@RequestMapping(value = {"/innerPage",""})
	public String innerPage(HttpServletRequest request,Model model){
		System.out.println("这是后台主页");
		return "inner/index";
	}

	@RequestMapping(value = {"/loginPage",""})
	public String loginPage(HttpServletRequest request){

		return "login";
	}
}
