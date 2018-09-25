package com.qhy.demo.config;

import java.util.Base64;
import java.util.Properties;
import com.alibaba.druid.util.DruidPasswordCallback;
import com.qhy.demo.util.MessageUtils;

public class DBPasswordCallback extends DruidPasswordCallback {
	private static final long serialVersionUID = -340126248593018959L;
	private static final String DB_PWD = "password";

	@Override
	public void setProperties(Properties properties) {
		super.setProperties(properties);
		String pwd = properties.getProperty(DB_PWD);
		if (pwd != null && !"".equals(pwd.trim())) {
			try {
				String returnMessage = MessageUtils.returnMessage(pwd);
				setPassword(returnMessage.toCharArray());
			} catch (Exception e) {
				setPassword(pwd.toCharArray());
			}
		}
	}
}
