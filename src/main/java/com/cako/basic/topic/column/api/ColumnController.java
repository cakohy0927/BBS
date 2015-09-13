package com.cako.basic.topic.column.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/basic/topic")
public class ColumnController {

	@RequestMapping(value = "/column/columnCreate", method = RequestMethod.GET)
	public String columnCreate(HttpServletRequest request, Model model) {

		return "basic/topic/column/columnCreate";
	}
}
