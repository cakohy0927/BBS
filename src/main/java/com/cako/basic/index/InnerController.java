package com.cako.basic.index;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.cako.platform.user.entity.User;
import com.cako.platform.user.service.UserService;
import com.cako.platform.utils.BaseController;
import com.orm.login.SingleLogin;

/**
 * @author cakohy 后台主页的入口
 */
@Controller
public class InnerController extends BaseController {

	@Autowired
	public UserService userService;

	@RequestMapping(value = { "/innerPage", "" })
	public String innerPage(HttpServletRequest request, Model model) {
		System.out.println("这是后台主页");
		return "inner/index";
	}

	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest request, HttpServletResponse response) {
		return "login";
	}

	@RequestMapping(value = { "/login", "" }, method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		try {
			String loginName = request.getParameter("loginname");
			String password = request.getParameter("password");
			boolean flag = SingleLogin.isAlreadyEnter(request.getSession(), loginName);
			if (flag) {
				response.sendRedirect("innerPage?SESSIONID=" + request.getSession().getId().toLowerCase());
			} else {
				User user = userService.findUserByLoginNameAndPassword(loginName, password);
				ModelAndView view = null;
				if (user != null) {
					SingleLogin.setUser(request, user);
					view = new ModelAndView(new RedirectView("innerPage"));
				} else {
					view = new ModelAndView(new RedirectView("loginPage"));
				}
				return view;
			}
		}  catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
