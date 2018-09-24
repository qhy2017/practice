package com.qhy.demo.config;

import java.util.Base64;
import java.util.Properties;
import com.alibaba.druid.util.DruidPasswordCallback;

public class DBPasswordCallback extends DruidPasswordCallback {
	private static final long serialVersionUID = -340126248593018959L;
	private static final String DB_PWD = "password";

	@Override
	public void setProperties(Properties properties) {
		super.setProperties(properties);
		String pwd = properties.getProperty(DB_PWD);
		if (pwd != null && !"".equals(pwd.trim())) {
			try {
				byte[] decode = Base64.getDecoder().decode(String.valueOf(pwd));
				String result = new String(decode);
				setPassword(result.toCharArray());
			} catch (Exception e) {
				setPassword(pwd.toCharArray());
			}
		}
	}
}
