package com.cako.platform.user.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/platform")
public class UserController {

	@RequestMapping(value = "/user/userCreate")
	public String userCreate(HttpServletRequest request, Model model) {

		return "platform/user/userCreate";
	}
}
