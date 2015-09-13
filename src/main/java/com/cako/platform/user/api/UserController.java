package com.cako.platform.user.api;

import com.cako.platform.user.dao.UserDao;
import com.cako.platform.user.entity.User;
import com.orm.commons.exception.ServiceException;
import com.orm.enums.SysEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping(value = "/platform")
public class UserController {

	@Autowired
	private UserDao userDao;

	@RequestMapping(value = "/user/userCreate")
	public String userCreate(HttpServletRequest request, Model model) {

		return "platform/user/userCreate";
	}

	@RequestMapping(value = "/user/userSave",method = RequestMethod.POST)
	public void userSave(HttpServletRequest request,HttpServletResponse response,User user){
		try {
			System.out.println("-----------------------");
			user = userDao.saveEntity(user);
			System.out.println(user);
		}catch (Exception e){

		} finally {
			try {
				response.getWriter().write("保存成功");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
}
