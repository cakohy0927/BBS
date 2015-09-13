package com.cako.platform.user.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cako.platform.user.entity.User;
import com.cako.platform.user.entity.UserClazz;
import com.cako.platform.user.service.UserService;
import com.cako.platform.utils.BeanToMapUtil;
import com.orm.commons.encryption.MD5Encryption;
import com.orm.commons.exception.ServiceException;
import com.orm.commons.utils.ObjectTools;
import com.orm.commons.utils.Pager;
import com.orm.enums.SysEnum;

@Controller
@RequestMapping(value = "/platform")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/user/userCreate")
	public String userCreate(HttpServletRequest request, Model model) {

		return "platform/user/userCreate";
	}

	@RequestMapping(value = "/user/userEdit/{id}")
	public String userEdit(@PathVariable("id") String id, HttpServletRequest request, Model model) {
		if (StringUtils.isNotEmpty(id)) {
			try {
				User user = userService.get(id);
				model.addAttribute("user", user);
			} catch (ServiceException e) {
				e.printStackTrace();
			}

		}
		return "platform/user/userUpdate";
	}

	@RequestMapping(value = "/user/userList", method = RequestMethod.GET)
	public String userList(HttpServletRequest request, Model model) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String currentPage = request.getParameter("currentPage");
		paramMap.put("deleteStatus_eq", SysEnum.DeleteStatus.NO);
		try {
			ObjectTools<User> users = userService.queryPageByMap(paramMap, currentPage, new Sort(Sort.Direction.DESC, "createTime"));
			List<UserClazz> userClazzs = new ArrayList<UserClazz>();
			for (User user : users.getEntities()) {
				userClazzs.add(new UserClazz(user));
			}
			model.addAttribute("list", userClazzs);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pager", users.getEntities().size() > 0 ? users.getPager() : new Pager(0, "10"));
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "platform/user/userList";
	}

	@RequestMapping(value = "/user/userSave", method = RequestMethod.POST)
	public String userSave(HttpServletRequest request, HttpServletResponse response) {
		try {
			User user = (User) BeanToMapUtil.getBeenObjectByRequest(new User(), request);
			user.setPassword(MD5Encryption.MD5(user.getPassword()));
			user = userService.save(user);
			System.out.println(user);
		} catch (Exception e) {

		}
		return "redirect:/platform/user/userList";
	}
}
