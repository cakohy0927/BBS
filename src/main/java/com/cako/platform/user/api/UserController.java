package com.cako.platform.user.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cako.platform.user.dao.UserDao;
import com.cako.platform.user.entity.User;
import com.cako.platform.utils.BeanToMapUtil;
import com.orm.commons.encryption.MD5Encryption;

@Controller
@RequestMapping(value = "/platform")
public class UserController {

	@Autowired
	private UserDao userDao;

	@RequestMapping(value = "/user/userCreate")
	public String userCreate(HttpServletRequest request, Model model) {

		return "platform/user/userCreate";
	}

	@RequestMapping(value = "/user/userList", method = RequestMethod.GET)
	public String userList(HttpServletRequest request, Model model) {

		return "";
	}

	@RequestMapping(value = "/user/userSave", method = RequestMethod.POST)
	public String userSave(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("-----------------------");
			User user = (User) BeanToMapUtil.getBeenObjectByRequest(new User(), request);
			user.setPassword(MD5Encryption.MD5(user.getPassword()));
			user = userDao.saveEntity(user);
			System.out.println(user);
		} catch (Exception e) {

		}
		return "redirect:platform/user/userList";
	}
}
