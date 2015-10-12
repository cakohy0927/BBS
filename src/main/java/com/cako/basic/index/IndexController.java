package com.cako.basic.index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cako.basic.topic.column.entity.Column;
import com.cako.basic.topic.column.service.ColumnService;
import com.orm.commons.exception.ServiceException;
import com.orm.enums.SysEnum;

@Controller
public class IndexController {
	private static Logger logger = LoggerFactory.getLogger(IndexController.class);
	@Autowired
	private ColumnService columnService;

	@RequestMapping(value = "/outLink/outerPage", method = RequestMethod.GET)
	public String outerPage(HttpServletRequest request, Model model) {
		Map<String,Object> paramsMap = new HashMap<String, Object>();
		try {
			paramsMap.put("displayStatus_eq", SysEnum.Display.DISPLAY);
			paramsMap.put("deleteStatus_eq", SysEnum.DeleteStatus.NO);
			paramsMap.put("parent_eq", 1);
			List<Column> columns =columnService.queryByMap(paramsMap,new Sort(Sort.Direction.DESC,"createTime"));
			Map<String,Object> childernMap = new HashMap<String, Object>();
			for (Column column : columns){
				paramsMap.put("parent_eq", 2);
				paramsMap.put("column.id_eq",column.getId());
				List<Column> childerns =columnService.queryByMap(paramsMap);
				childernMap.put(column.getId(),childerns);
			}
			model.addAttribute("childernMap",childernMap);
			model.addAttribute("columns",columns);
		} catch (ServiceException e) {
			logger.info(e.getMessage());
			e.printStackTrace();
		}
		return "outerPage";
	}
	
	@RequestMapping(value = "/outLink/index", method = RequestMethod.GET)
	public String test(HttpServletRequest request, Model model){
		return "inner/childern";
	}
}
