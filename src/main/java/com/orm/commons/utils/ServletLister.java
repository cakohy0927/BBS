package com.orm.commons.utils;

import java.util.Enumeration;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ServletLister implements ServletContextListener {
	private static Logger logger = LoggerFactory.getLogger(ServletLister.class);

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	@Override
	public void contextInitialized(ServletContextEvent servletContext) {
		logger.info("ServletLister容器正在装载");
		try {
			MyConfig config = new MyConfig();// 存放配置信息，用Map实现
			Enumeration<String> parameters = servletContext.getServletContext().getInitParameterNames();
			while (parameters.hasMoreElements()) {
				String name = parameters.nextElement();
				// 相应的键值对存到map中
				config.addKeyTValue(name, servletContext.getServletContext().getInitParameter(name));
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		// ServletContext config = servletContext.getServletContext();
		// String rootPath = config.getRealPath("/");
		// logger.info("目录为：" + System.getProperty("user.dir"));
		// logger.info("根目录为：" + rootPath);
		logger.info("ServletLister容器装载完成");
	}

}
