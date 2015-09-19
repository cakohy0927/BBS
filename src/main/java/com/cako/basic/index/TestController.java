package com.cako.basic.index;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cako.platform.menu.entity.Menu;
import com.cako.platform.menu.service.MenuService;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.JsonMapper;
import com.orm.enums.SysEnum.DeleteStatus;

@Controller
public class TestController {
	@Autowired
	private MenuService menuService;
	
	@RequestMapping(value = "getIndex")
	public String getIndex(Model model){
		try {
			Map<String, Object> paramMap = new HashMap<String,Object>();
			paramMap.put("deleteStatus_eq", DeleteStatus.NO);
			List<Menu> list = menuService.queryByMap(paramMap  , new Sort(Sort.Direction.DESC,"createTime"));
			List<TestTree> testTrees = new ArrayList<TestTree>();
			for (Menu menu : list) {
				testTrees.add(new TestTree(menu));
			}
			model.addAttribute("listTree", new JsonMapper().toJson(testTrees));
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "index";
	}
}
