package com.cako.platform.menu.api;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Curtain on 2015/9/15.
 */
@Controller
@RequestMapping(value = "/platform")
public class MenuController {

    @RequestMapping(value = "menu/menuCreate")
    public String menuCreate(HttpServletRequest request,Model model){

        return "";
    }

}
