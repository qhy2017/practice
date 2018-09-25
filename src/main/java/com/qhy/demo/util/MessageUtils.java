package com.qhy.demo.util;

import java.util.Base64;

public class MessageUtils {

	public static String returnMessage(String pwd) {
		byte[] decode = Base64.getDecoder().decode(String.valueOf(pwd));
		String result = new String(decode);
		return result;
	}

}
