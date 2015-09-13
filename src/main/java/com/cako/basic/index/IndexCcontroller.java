package com.cako.basic.index;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexCcontroller {

	@RequestMapping(value = "/outerPage", method = RequestMethod.GET)
	public String outerPage(HttpServletRequest request, Model model) {
		return "outerPage";
	}
}
